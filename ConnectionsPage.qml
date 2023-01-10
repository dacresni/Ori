import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.LocalStorage as Sql
import "Database.js" as SettingsStore

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
		RowLayout {
                Button {
                    text: qsTr("New")
                    onClicked: {
                        input.initrec_new()
                        window.creatingNewEntry = true
                        listView.model.setProperty(listView.currentIndex, "id", 0)
                    }
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
        model: [ 'list']
        //model: listModel 
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
    ListModel {
        id: listModel
        Component.onCompleted: SettingsStore.readAll()
    }
}
