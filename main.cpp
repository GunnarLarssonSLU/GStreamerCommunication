#include <QApplication>
#include <QWidget>
#include <QVBoxLayout>
#include <QPushButton>
#include <QLabel>
#include "gstreamerworker.h"

/*
 * This simple GUI provides two buttons:
 * - "Local Webcam" -> starts the local webcam pipeline
 * - "UDP Receiver" -> starts the receiving pipeline (listens for H.264 on port 6000)
 *
 * In a real app, you might embed the video in a widget using GstVideoOverlay or another sink.
 */

class MainWindow : public QWidget
{
    Q_OBJECT
public:
    MainWindow(QWidget *parent = nullptr) : QWidget(parent) {
        QVBoxLayout *layout = new QVBoxLayout(this);
        QLabel *info = new QLabel("Choose pipeline:", this);
        layout->addWidget(info);

        QPushButton *btnLocal = new QPushButton("Local Webcam", this);
        QPushButton *btnRemote = new QPushButton("UDP Receiver", this);

        layout->addWidget(btnLocal);
        layout->addWidget(btnRemote);

        connect(btnLocal, &QPushButton::clicked, this, &MainWindow::startLocalWebcam);
        connect(btnRemote, &QPushButton::clicked, this, &MainWindow::startRemoteVideo);
    }

private slots:
    void startLocalWebcam() {
        // If there's an existing worker, stop it
        if (m_worker) {
            stopWorker();
        }
        // Create a new worker
        m_worker = new GStreamerWorker(this);

        // Example pipeline: local webcam to ximagesink
        // You could also add audio here if you want a combined pipeline
        QString pipelineStr = QLatin1String(
            "v4l2src ! videoconvert ! ximagesink"
        );

        m_worker->setPipelineString(pipelineStr);
        m_worker->start(); // runs in separate thread
    }

    void startRemoteVideo() {
        if (m_worker) {
            stopWorker();
        }
        m_worker = new GStreamerWorker(this);

        // Example pipeline: UDP receiver for H.264
        // "gst-launch-1.0 udpsrc port=6000 caps=... ! rtph264depay ! avdec_h264 ! videoconvert ! ximagesink"
        QString pipelineStr = QLatin1String(
            "udpsrc port=6000 caps=\"application/x-rtp, media=video, encoding-name=H264, payload=96, clock-rate=90000\" ! "
            "rtph264depay ! avdec_h264 ! videoconvert ! ximagesink"
        );

        m_worker->setPipelineString(pipelineStr);
        m_worker->start();
    }

    void stopWorker() {
        if (!m_worker) return;
        // Signal the worker to stop
        m_worker->requestInterruption();
        // This ends the g_main_loop_run()
        // The worker thread will stop after pipeline is set to NULL
        m_worker->quit();
        m_worker->wait();
        m_worker->deleteLater();
        m_worker = nullptr;
    }

protected:
    void closeEvent(QCloseEvent *event) override {
        stopWorker();
        QWidget::closeEvent(event);
    }

private:
    GStreamerWorker *m_worker = nullptr;
};

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    MainWindow win;
    win.setWindowTitle("Qt + GStreamer Demo");
    win.resize(300, 150);
    win.show();

    return app.exec();
}

#include "main.moc"

