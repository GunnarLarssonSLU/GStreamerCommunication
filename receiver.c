#include <gst/gst.h>
#include <stdio.h>

// A simple bus callback to handle error, warning, and EOS messages
static gboolean bus_cb(GstBus *bus, GstMessage *msg, gpointer user_data) {
    GError *err = NULL;
    gchar *debug_info = NULL;

    switch (GST_MESSAGE_TYPE(msg)) {
    case GST_MESSAGE_ERROR:
        gst_message_parse_error(msg, &err, &debug_info);
        g_printerr("\n[BUS] ERROR from element %s: %s\n",
                   GST_OBJECT_NAME(msg->src), err->message);
        if (debug_info) {
            g_printerr("[BUS] Debug info: %s\n", debug_info);
        }
        g_clear_error(&err);
        g_free(debug_info);
        // You might want to quit the main loop or set pipeline to NULL here
        break;

    case GST_MESSAGE_WARNING:
        gst_message_parse_warning(msg, &err, &debug_info);
        g_printerr("\n[BUS] WARNING from element %s: %s\n",
                   GST_OBJECT_NAME(msg->src), err->message);
        if (debug_info) {
            g_printerr("[BUS] Debug info: %s\n", debug_info);
        }
        g_clear_error(&err);
        g_free(debug_info);
        break;

    case GST_MESSAGE_EOS:
        g_print("\n[BUS] End-Of-Stream reached\n");
        // End of stream. You might exit the main loop here if you had one.
        break;

    default:
        // For other message types, just do nothing
        break;
    }
    return TRUE; // Keep receiving messages
}

int main(int argc, char *argv[]) {
    gst_init(&argc, &argv);

    // 1) Define your audio receiver pipeline (L16 over RTP):
    //    Equivalent to:
    //    gst-launch-1.0 udpsrc port=5200 ! "application/x-rtp, media=audio, ..."
    //    ! rtpL16depay ! audioconvert ! autoaudiosink sync=false
    const gchar *pipeline_desc =
        "udpsrc port=5200 ! "
        "application/x-rtp,media=audio,clock-rate=44100,width=16,height=16,"
        "encoding-name=L16,encoding-params=1,channels=1,channel-positions=1,payload=96 ! "
        "rtpL16depay ! "
        "audioconvert ! "
        "autoaudiosink sync=false";

    GError *error = NULL;
    GstElement *pipeline = gst_parse_launch(pipeline_desc, &error);

    if (!pipeline) {
        g_printerr("Failed to create pipeline: %s\n", error->message);
        g_clear_error(&error);
        return -1;
    }
    if (error) {
        g_printerr("Pipeline parse error: %s\n", error->message);
        g_clear_error(&error);
        gst_object_unref(pipeline);
        return -1;
    }

    // 2) Set up a bus watch to catch errors, warnings, EOS, etc.
    GstBus *bus = gst_element_get_bus(pipeline);
    gst_bus_add_watch(bus, bus_cb, NULL); 
    gst_object_unref(bus);

    // 3) Start playing
    gst_element_set_state(pipeline, GST_STATE_PLAYING);
    g_print("Audio Receiver is now playing...\n");

    // 4) Run a main loop so we can catch asynchronous bus messages
    GMainLoop *loop = g_main_loop_new(NULL, FALSE);
    g_main_loop_run(loop);

    // Cleanup after the loop ends
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);
    g_main_loop_unref(loop);

    return 0;
}

