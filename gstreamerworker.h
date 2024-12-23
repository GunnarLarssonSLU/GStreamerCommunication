#ifndef GSTREAMERWORKER_H
#define GSTREAMERWORKER_H

#include <QThread>
#include <gst/gst.h>

class GStreamerWorker : public QThread
{
    Q_OBJECT
public:
    explicit GStreamerWorker(QObject *parent = nullptr);
    ~GStreamerWorker();

    // Call before starting the thread
    void setPipelineString(const QString &pipelineStr);

protected:
    void run() override;  // Thread entry point

private:
    static gboolean busCallback(GstBus *bus, GstMessage *msg, gpointer data);

    QString m_pipelineStr;        // GStreamer pipeline description
    GMainLoop *m_loop = nullptr;  // GMainLoop for GStreamer
    GstElement *m_pipeline = nullptr;
};

#endif // GSTREAMERWORKER_H

