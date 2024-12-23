#include "gstreamerworker.h"
#include <QDebug>

GStreamerWorker::GStreamerWorker(QObject *parent)
    : QThread(parent)
{
    // Initialize GStreamer if not already done:
    static bool gstInitialized = false;
    if (!gstInitialized) {
        gst_init(nullptr, nullptr);
        gstInitialized = true;
    }
}

GStreamerWorker::~GStreamerWorker()
{
    // If the thread is still running, wait for it to stop
    requestInterruption();
    quit();
    wait();
}

void GStreamerWorker::setPipelineString(const QString &pipelineStr)
{
    m_pipelineStr = pipelineStr;
}

gboolean GStreamerWorker::busCallback(GstBus *bus, GstMessage *msg, gpointer data)
{
    Q_UNUSED(bus);
    auto worker = static_cast<GStreamerWorker*>(data);

    switch (GST_MESSAGE_TYPE(msg)) {
    case GST_MESSAGE_ERROR: {
        GError *err = nullptr;
        gchar *debugInfo = nullptr;
        gst_message_parse_error(msg, &err, &debugInfo);
        qWarning() << "[GStreamerWorker] ERROR from element"
                   << GST_OBJECT_NAME(msg->src) << ":" << err->message;
        if (debugInfo) {
            qWarning() << "[GStreamerWorker] Debug info:" << debugInfo;
        }
        g_clear_error(&err);
        g_free(debugInfo);

        // Optionally stop the main loop on error
        if (worker->m_loop) {
            g_main_loop_quit(worker->m_loop);
        }
        break;
    }
    case GST_MESSAGE_WARNING: {
        GError *err = nullptr;
        gchar *debugInfo = nullptr;
        gst_message_parse_warning(msg, &err, &debugInfo);
        qWarning() << "[GStreamerWorker] WARNING from element"
                   << GST_OBJECT_NAME(msg->src) << ":" << err->message;
        if (debugInfo) {
            qWarning() << "[GStreamerWorker] Debug info:" << debugInfo;
        }
        g_clear_error(&err);
        g_free(debugInfo);
        break;
    }
    case GST_MESSAGE_EOS:
        qInfo() << "[GStreamerWorker] End of stream";
        if (worker->m_loop) {
            g_main_loop_quit(worker->m_loop);
        }
        break;

    default:
        break;
    }
    return TRUE; // Keep watching the bus
}

void GStreamerWorker::run()
{
    // Create the GStreamer pipeline from the string
    GError *err = nullptr;
    m_pipeline = gst_parse_launch(m_pipelineStr.toUtf8().data(), &err);
    if (!m_pipeline || err) {
        qWarning() << "[GStreamerWorker] Failed to create pipeline:" 
                   << (err ? err->message : "Unknown error");
        if (err) {
            g_clear_error(&err);
        }
        return;
    }

    // Add a bus watch to capture errors, warnings, etc.
    GstBus *bus = gst_element_get_bus(m_pipeline);
    gst_bus_add_watch(bus, busCallback, this);
    gst_object_unref(bus);

    // Create a GMainLoop and run it in this thread
    m_loop = g_main_loop_new(NULL, FALSE);

    // Start playing the pipeline
    gst_element_set_state(m_pipeline, GST_STATE_PLAYING);
    qInfo() << "[GStreamerWorker] Pipeline started";

    g_main_loop_run(m_loop);

    // Cleanup after the loop ends
    qInfo() << "[GStreamerWorker] Cleaning up the pipeline";
    gst_element_set_state(m_pipeline, GST_STATE_NULL);
    gst_object_unref(m_pipeline);
    m_pipeline = nullptr;

    g_main_loop_unref(m_loop);
    m_loop = nullptr;
}

