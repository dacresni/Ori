import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Page {
    anchors.fill: parent
    header: ToolBar {
      Label {
          padding: 10
          text: qsTr("Connections")
          font.pixelSize: 20
          horizontalAlignment: Text.AlignHCenter
          verticalAlignment: Text.AlignVCenter
      }
    }
    ListView {
        id: listView
        anchors.fill: parent
        topMargin: 48
        leftMargin: 48
        bottomMargin: 48
        rightMargin: 48
        spacing: 20
        model: ["Albert Einstein", "Ernest Hemingway", "Hans Gude"]
        delegate: ItemDelegate {
            text: modelData
            width: listView.width - listView.leftMargin - listView.rightMargin
            height: avatar.implicitHeight
            leftPadding: avatar.implicitWidth + 32

            Image {
                id: avatar
                source: "database-2-line.svg"
            }
        }
    }
}
