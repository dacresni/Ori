import QtQuick
import QtQuick.Controls

ApplicationWindow {
    title: "Ori"
    width: 640
    height: 480
    visible: true

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: ConnectionsPage {}
    }

}
