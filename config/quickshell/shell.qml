import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire as Pw

ShellRoot {
	Variants {
		model: Quickshell.screens
		delegate: Component {
			PanelWindow {
				required property var modelData
				screen: modelData

				anchors.left: true
				anchors.right: true
				anchors.top: true
				color: "#BB000000"
				implicitHeight: 25

				RowLayout {
					anchors.fill: parent
					spacing: 0

					Item {
						Layout.fillWidth: true
					}

					BarElement {
						implicitHeight: 25
						implicitWidth: 260

						Pw.PwObjectTracker {
							objects: [ Pw.Pipewire.defaultAudioSink, Pw.Pipewire.defaultAudioSource ]
						}

						textContent: {
							let sink = Pw.Pipewire.defaultAudioSink
							let source = Pw.Pipewire.defaultAudioSource
							let sinkPercentage = sink.audio.muted ? "MT" : Math.round(sink.audio.volume * 100)
							let sourcePercentage = source.audio.muted ? "MT" : Math.round(source.audio.volume * 100)
							return `Microphone ${sourcePercentage}% | Speaker ${sinkPercentage}%`
						}
					}

					BarElement {
						implicitHeight: 25
						implicitWidth: 160

						SystemClock {
							id: clock
							precision: SystemClock.Minutes
						}

						textContent: Qt.formatDateTime(clock.date, "ddd dd MMM hh:mm")
					}
				}
			}
		}
	}
}
