import QtQuick 2.0
import SddmComponents 2.0

// Astro SDDM theme. Stock Omarchy Main.qml with one change: logo.png
// (the theme's unlock.png) fills the whole screen and the password row
// sits in the lower third, over the image. Colors are baked in for the
// astro theme. Installed over /usr/share/sddm/themes/omarchy/Main.qml
// by plymouth-install.sh.
Rectangle {
  id: root
  width: 640
  height: 480
  color: "#0a1033"

  property string currentUser: userModel.lastUser
  property bool loginFailed: false
  property int sessionIndex: {
    for (var i = 0; i < sessionModel.rowCount(); i++) {
      var name = (sessionModel.data(sessionModel.index(i, 0), Qt.DisplayRole) || "").toString()
      if (name.indexOf("uwsm") !== -1)
        return i
    }
    return sessionModel.lastIndex
  }

  Connections {
    target: sddm
    function onLoginFailed() {
      root.loginFailed = true
      password.text = ""
      password.focus = true
    }
    function onLoginSucceeded() {
      root.loginFailed = false
    }
  }

  Image {
    anchors.fill: parent
    source: "logo.png"
    fillMode: Image.PreserveAspectCrop
  }

  Row {
    anchors.horizontalCenter: parent.horizontalCenter
    y: Math.round(parent.height * 0.72 - height / 2)
    spacing: 15

    Image {
      source: root.loginFailed ? "lock-failed.png" : "lock.png"
      width: 34
      height: 38
      fillMode: Image.PreserveAspectFit
      anchors.verticalCenter: parent.verticalCenter
    }

    Item {
      width: entry.width
      height: entry.height

      Image {
        id: entry
        source: root.loginFailed ? "entry-failed.png" : "entry.png"
        anchors.centerIn: parent
      }

      Row {
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.verticalCenter: parent.verticalCenter
        spacing: 5

        Repeater {
          model: Math.min(password.text.length, 21)

          Image {
            source: "bullet.png"
            width: 7
            height: 7
          }
        }
      }

      TextInput {
        id: password
        anchors.fill: parent
        anchors.leftMargin: 20
        anchors.rightMargin: 20
        verticalAlignment: TextInput.AlignVCenter
        echoMode: TextInput.Password
        font.family: "JetBrainsMono Nerd Font"
        font.pixelSize: 24
        font.letterSpacing: 5
        passwordCharacter: "•"
        color: "transparent"
        selectionColor: "transparent"
        selectedTextColor: "transparent"
        cursorDelegate: Item {}
        focus: true

        onTextChanged: root.loginFailed = false

        Keys.onPressed: {
          if (event.key === Qt.Key_Return || event.key === Qt.Key_Enter) {
            sddm.login(root.currentUser, password.text, root.sessionIndex)
            event.accepted = true
          }
        }
      }
    }
  }

  Component.onCompleted: password.forceActiveFocus()
}
