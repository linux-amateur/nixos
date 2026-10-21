import QtQuick
import Quickshell

Rectangle {
	property string textContent

	color: "transparent"

	Text {
		anchors.horizontalCenter: parent.horizontalCenter
		anchors.verticalCenter: parent.verticalCenter
		color: "white"
		font.family: "JetBrainsMono Nerd Font"
		font.pixelSize: 14
		text: textContent
	}
}
