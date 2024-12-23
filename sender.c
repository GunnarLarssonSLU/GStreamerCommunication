#include <gst/gst.h>

int main(int argc, char *argv[]) {
    gst_init(&argc, &argv);

    // Pipeline from your working example:
    // gst-launch-1.0 alsasrc ! audioconvert ! audio/x-raw,channels=1,depth=16,width=16,rate=44100 ! rtpL16pay ! udpsink host=127.0.0.1 port=5200
    const gchar *pipeline_desc =
        "alsasrc ! "
        "audioconvert ! audio/x-raw,channels=1,depth=16,width=16,rate=44100 ! "
        "rtpL16pay ! "
        "udpsink host=127.0.0.1 port=5200";

    GError *error = NULL;
    GstElement *pipeline = gst_parse_launch(pipeline_desc, &error);

    if (!pipeline) {
        g_printerr("Failed to create pipeline: %s\n", error->message);
        g_clear_error(&error);
        return -1;
    }

    gst_element_set_state(pipeline, GST_STATE_PLAYING);

    // Run until error or EOS
    GstBus *bus = gst_element_get_bus(pipeline);
    GstMessage *msg;
    msg = gst_bus_timed_pop_filtered(bus, GST_CLOCK_TIME_NONE,
                                     GST_MESSAGE_ERROR | GST_MESSAGE_EOS);

    if (msg != NULL)
        gst_message_unref(msg);

    gst_object_unref(bus);
    gst_element_set_state(pipeline, GST_STATE_NULL);
    gst_object_unref(pipeline);

    return 0;
}

