import QtQuick

Item {
    id: root
    anchors.fill: parent

    // ✅ your design (Figma) size
    property real baseW: 1800
    property real baseH: 1080

    // ✅ scale based on device/window size
    property real s: Math.min(width / baseW, height / baseH)

    // ✅ center the scaled UI
    property real offX: (width - baseW * s) / 2
    property real offY: (height - baseH * s) / 2
            // ✅ your back button (uses original design pixels)
        Image {
            id: backBtn
            x: 10
            y: 10
            z: 999
            width: 40
            height: 40
            source: Qt.resolvedUrl("assets/staionButton1.png")

            MouseArea {
                anchors.fill: parent
                onClicked: nav.goBack()
            }
        }

    Image {
        id: frame_1
        anchors.fill: parent
        clip: true
        fillMode: Image.Stretch   // background always fills
        source: Qt.resolvedUrl("assets/frame_1.png")
    }

    // ✅ Everything inside main scales together
    Item {
        id: main
        x: root.offX
        y: root.offY
        width: root.baseW
        height: root.baseH
        scale: root.s
        transformOrigin: Item.TopLeft


        Item {
            id: mainContainer

            height: 928
            width: 1767
            anchors.centerIn: parent 
            Image {
                id: sideBarContainer

                x: -4

                source: Qt.resolvedUrl("assets/sideBarContainer.png")
            }
            Image {
                id: contentContainer

                x: 454

                source: Qt.resolvedUrl("assets/contentContainer.png")
            }
            Image {
                id: logoContainer

                source: Qt.resolvedUrl("assets/logoContainer.png")
            }
            Item {
            id: logo

            x: 24
            y: 7

            height: 82
            width: 427

            Image {
                id: labelTitleDrone

                x: 60.58
                y: 18.73

                source: Qt.resolvedUrl("assets/labelTitleDrone.png")
            }
            Image {
                id: logoPic

                y: 18

                source: Qt.resolvedUrl("assets/logoPic.png")
            }
        }
        Image {
            id: oDHMain

            x: 496
            y: 35

            source: Qt.resolvedUrl("assets/oDHMain.png")

            Image {
                id: oDHContainer

                source: Qt.resolvedUrl("assets/oDHContainer.png")
            }
            // Image {
            //     id: oDHPercent

            //     x: 57.13
            //     y: 113.36

            //     source: Qt.resolvedUrl("assets/oDHPercent.png")
            // }
            Item {
                id: station_stat_1

                x: 322.75
                y: 191

                height: 73
                width: 880.25

                Image {
                    id: containerGreenStat

                    source: Qt.resolvedUrl("assets/containerGreenStat.png")
                }
                Image {
                    id: labelTextGreen

                    x: 136.30
                    y: 28.25

                    source: Qt.resolvedUrl("assets/labelTextGreen.png")
                }
                Image {
                    id: greenIconContainer

                    x: 47.25
                    y: 13

                    source: Qt.resolvedUrl("assets/greenIconContainer.png")
                }
                Image {
                    id: iconGreen

                    x: 58.25
                    y: 24

                    source: Qt.resolvedUrl("assets/iconGreen.png")
                }
            }
        // Replace your existing oDHProgressBar Image block with this:
        Item {
            id: oDHProgressBar

            x: 321.75
            y: 112

            // Use the original oDHProgressBar image as the background track
            Image {
                id: progressTrack
                source: Qt.resolvedUrl("assets/oDHProgressBar.png")
                z: 0
            }

            // Dynamic colored fill — replaces progressColored image
            Rectangle {
                id: progressFill

                // Sit on top of the track image
                z: 1

                // Match the vertical center and height of your original progressColored asset
                // Adjust y, height, and corner radius to match your design
                x: 2
                y: 2
                height: progressTrack.height - 8
                width: (progressTrack.width - 8) * (dhiBackend.percent / 100)
                radius: 6

                color: dhiBackend.progressColor

                // Smooth animation whenever percent changes
                Behavior on width {
                    NumberAnimation {
                        duration: 500
                        easing.type: Easing.OutCubic
                    }
                }
                Behavior on color {
                    ColorAnimation { duration: 300 }
                }
            }
        }

        // Percentage text — update this wherever you display the ODH percent value
        Text {
            id: oDHPercentText
            x: 57.13
            y: 113.36
            text: dhiBackend.percent + "%"
            color: "white"
            font.pixelSize: 24
            font.bold: true
        }

        // Condition label (optional — shows "Good condition", "High Severity", etc.)
        Text {
            id: oDHConditionLabel
            x: 57.13
            y: 145
            text: dhiBackend.progressLabel
            color: dhiBackend.progressColor
            font.pixelSize: 16
        }
        }
        Image {
            id: titleTextODH

            x: 822.61
            y: 99.41

            source: Qt.resolvedUrl("assets/titleTextODH.png")
        }
        Image {
            id: oDHLine

            x: 679.49
            y: 188.50

            rotation: 90
            source: Qt.resolvedUrl("assets/oDHLine.png")

            transform: Scale {
                origin.x: oDHLine.width / 2
                origin.y: oDHLine.height / 2
                xScale: -1
            }
        }
        Image {
            id: stationMain

            x: 492
            y: 375

            source: Qt.resolvedUrl("assets/stationMain.png")

            Image {
                id: staionButton1

                x: 61
                y: 99

                source: Qt.resolvedUrl("assets/staionButton1.png")
            }
            Image {
                id: staionButton2

                x: 271
                y: 99

                source: Qt.resolvedUrl("assets/staionButton2.png")
            }
            Image {
                id: staionButton3

                x: 481
                y: 99

                source: Qt.resolvedUrl("assets/staionButton3.png")
            }
            Image {
                id: staionButton4

                x: 61
                y: 178

                source: Qt.resolvedUrl("assets/staionButton4.png")
            }
            Image {
                id: staionButton5

                x: 271
                y: 178

                source: Qt.resolvedUrl("assets/staionButton5.png")
            }
            Image {
                id: staionButton6

                x: 481
                y: 178

                source: Qt.resolvedUrl("assets/staionButton6.png")
            }
            Image {
                id: staionButton7

                x: 61
                y: 257

                source: Qt.resolvedUrl("assets/staionButton7.png")
            }
            Image {
                id: staionButton8

                x: 271
                y: 257

                source: Qt.resolvedUrl("assets/staionButton8.png")
            }
            Image {
                id: staionButton9

                x: 481
                y: 257

                source: Qt.resolvedUrl("assets/staionButton9.png")
            }
            Image {
                id: staionButton10

                x: 61
                y: 336

                source: Qt.resolvedUrl("assets/staionButton10.png")
            }
            Image {
                id: staionButton11

                x: 271
                y: 336

                source: Qt.resolvedUrl("assets/staionButton11.png")
            }
            Image {
                id: staionButton12

                x: 481
                y: 336

                source: Qt.resolvedUrl("assets/staionButton12.png")
            }
            Image {
                id: staionButton13

                x: 61
                y: 415

                source: Qt.resolvedUrl("assets/staionButton13.png")
            }
            Image {
                id: staionButton14

                x: 271
                y: 415

                source: Qt.resolvedUrl("assets/staionButton14.png")
            }
            Image {
                id: staionButton15

                x: 481
                y: 415

                source: Qt.resolvedUrl("assets/staionButton15.png")
            }
        }
        Image {
            id: totalStations

            x: 1039.63
            y: 412.90

            source: Qt.resolvedUrl("assets/totalStations.png")
        }
        Image {
            id: titleStation

            x: 551.58
            y: 411.26

            source: Qt.resolvedUrl("assets/titleStation.png")
        }
        Image {
            id: stats

            x: 12
            y: 122

            source: Qt.resolvedUrl("assets/stats.png")

            //degree value
            Text{
                id : degreeValue
                x: 237.84
                y: 40.08
                text: weatherBackend.temp
                color: "white"
                font.pixelSize: 28
                font.bold: true
            }
            // day value
            Text{
                id : dayValue
                x: 16.86
                y: 168.54
                text: weatherBackend.day
                color: "white"
                font.pixelSize: 20
            }
            // date and time value
            Text{
                id : dateTimeValue
                x: 17.86
                y: 222.54
                text: weatherBackend.dateTime
                color: "white"
                font.pixelSize: 16
            }
            // weather icon
            Image{
                id: weatherIcon
                x: 38.86
                y: 40.08
                width: 80
                height: 80
                source: weatherBackend.iconUrl
                fillMode: Image.PreserveAspectFit
                
                onStatusChanged: {
        if (status === Image.Error)   console.log("Icon FAILED:", source)
        if (status === Image.Ready)   console.log("Icon OK:", source)
    }

                
            }

        }   
    }
    }

}


