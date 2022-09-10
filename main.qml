import QtQuick
import QtQuick.Controls

ApplicationWindow {
    title: "Ori"
    width: 640
    height: 480
    visible: true

    Button {
        text: "Push Me"
        anchors.centerIn: parent
    }
    Page {
        anchors.fill: parent
        header: Label {
            padding: 10
            text: qsTr("Contacts")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
