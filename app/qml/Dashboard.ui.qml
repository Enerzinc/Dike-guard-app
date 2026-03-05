import QtQuick

Item {
    id: root
    anchors.fill: parent
    signal goToMain()
    //  your design (Figma) size
    property real baseW: 1800
    property real baseH: 1080
    //  scale based on device/window size
    property real s: Math.min(width / baseW, height / baseH)
    //  center the scaled UI
    property real offX: (width - baseW * s) / 2
    property real offY: (height - baseH * s) / 2
    FontLoader {
        id: koulenFont
        source: Qt.resolvedUrl("fonts/koulen-regular.ttf")
    }
    Image {
        id: frame_1
        anchors.fill: parent
        clip: true
        fillMode: Image.Stretch   
        source: Qt.resolvedUrl("assets/dashboard.png")
    }
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
            Image {
                id: rectangle_2
                x: 20
                y: 808
                source: Qt.resolvedUrl("assets/rectangle_2.png")
                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.goToMain()
                }
            }
            Image {
                id: up
                x: 56
                y: 808
                source: Qt.resolvedUrl("assets/up.png")
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
                    Text {
                        id: oDHConditionLabel
                        x: 136.30
                        y: 28.25
                        text: dhiBackend ? dhiBackend.progressLabel : ""
                        color: dhiBackend ? dhiBackend.progressColor : "transparent"
                        font.pixelSize: 25
                        font.bold: true
                        font.family: koulenFont.name
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
                        width: dhiBackend ? (progressTrack.width - 8) * (dhiBackend.percent / 100) : 0
                        radius: 6
                        color: dhiBackend ? dhiBackend.progressColor : "transparent"
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
                    text: dhiBackend ? dhiBackend.percent + "%" : "0%"
                    color: "white"
                    font.pixelSize: 24
                    font.bold: true
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
                x: 8
                y: 442
                source: Qt.resolvedUrl("assets/stationMain.png")
            }
            Item {
                id: frame_12
                x: 37
                y: 456
                height: 56
                width: 384
                Image {
                    id: titleStation
                    x: 103.04
                    y: 18.63
                    source: Qt.resolvedUrl("assets/titleStation.png")
                }
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
                    text: weatherBackend ? weatherBackend.temp : "--°C"
                    color: "white"
                    font.pixelSize: 28
                    font.bold: true
                }
                // day value
                Text{
                    id : dayValue
                    x: 16.86
                    y: 168.54
                    text: weatherBackend ? weatherBackend.day : "--"
                    color: "white"
                    font.pixelSize: 20
                }
                // date and time value
                Text{
                    id : dateTimeValue
                    x: 17.86
                    y: 222.54
                    text: weatherBackend ? weatherBackend.dateTime : "--"
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
                    source: weatherBackend ? weatherBackend.iconUrl : ""
                    fillMode: Image.PreserveAspectFit
                    
                    onStatusChanged: {
                    if (status === Image.Error)   console.log("Icon FAILED:", source)
                    if (status === Image.Ready)   console.log("Icon OK:", source)
                    }
                }
            }   
            Image {
                id: frame_11
                x: 500
                y: 390
                clip: true
                source: Qt.resolvedUrl("assets/frame_11.png")
                Item{
                    id: stations
                    x: 42
                    y: 30
                    height: 441
                    width: 469
                    Image {
                        id: station_Main_Container
                        source: Qt.resolvedUrl("assets/station_Main_Container.png")
                    }
                    Image {
                        id: sTATIONS_1
                        x: 38.33
                        y: 47.03
                        source: Qt.resolvedUrl("assets/sTATIONS.png")
                    }
                    Rectangle {
                        id: rectangle_57
                        x: 42
                        y: 95
                        height: 251
                        width: 385
                        color: "#d9d9d9"
                    }
                    Image {
                        id: view_Btn
                        x: 61
                        y: 367
                        source: Qt.resolvedUrl("assets/view_Btn.png")

                        Text {
                            anchors.centerIn: parent
                            text: "View"
                            font.family: koulenFont.name   // ✅ use .name, not the file path
                            font.pixelSize: 30
                            font.bold: true
                            color: "white"
                        }
                    }
                }
                Item{
                    id: d_View
                    x: 546
                    y: 30
                    height: 441
                    width: 641
                    Image {
                        id: d_Main_Container
                        x: -4
                        source: Qt.resolvedUrl("assets/d_Main_Container.png")
                    }
                    Rectangle {
                        id: d_Container
                        x: 18
                        y: 59
                        height: 355
                        width: 605
                        bottomLeftRadius: 20.72
                        bottomRightRadius: 20.72
                        color: "#d9d9d9"
                        topRightRadius: 20.72
                    }
                    Image {
                        id: d_Tab
                        x: 12
                        y: 11
                        source: Qt.resolvedUrl("assets/d_Tab.png")
                    }
                    Image {
                        id: d_View_1
                        x: 47.84
                        y: 28.03
                        source: Qt.resolvedUrl("assets/d_View.png")
                    }
                }
            }
            Rectangle {
                id: notif_Box
                x: 30
                y: 525
                height: 221
                width: 400
                color: '#f8f2f2'
                Item {
                    id: group_5
                    height: 51
                    width: 384
                    Rectangle {
                        id: rectangle_60
                        height: 51
                        width: 384
                        color: "#d9d9d9"
                    }
                    Item {
                        id: group_4
                        x: 36
                        y: 12
                        height: 27.59
                        width: 180
                        Text {
                            id: station_1
                            height: 17
                            width: 69
                            color: "#3f3636"
                            font.family: "Konkhmer Sleokchher"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Station 1"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: needs_to_be_repaired_immediately_
                            y: 14
                            height: 13.59
                            width: 181
                            color: "#3f3636"
                            font.family: "Lato"
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignHCenter
                            text: "Needs to be repaired immediately."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Image {
                        id: ellipse_5
                        x: 12
                        y: 20
                        source: Qt.resolvedUrl("assets/ellipse_5.png")
                    }
                    Image {
                        id: multiply
                        x: 341
                        y: 14
                        source: Qt.resolvedUrl("assets/multiply.png")
                    }
                }
                Item {
                    id: group_6
                    y: 55
                    height: 51
                    width: 384
                    Rectangle {
                        id: rectangle_61
                        height: 51
                        width: 384
                        color: "#d9d9d9"
                    }
                    Item {
                        id: group_7
                        x: 36
                        y: 12
                        height: 28
                        width: 231
                        Text {
                            id: station_2
                            height: 17
                            width: 77
                            color: "#3f3636"
                            font.family: "Konkhmer Sleokchher"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Station 2"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: cleaning_should_be_done_promptly_
                            y: 14
                            height: 14
                            width: 232
                            color: "#3f3636"
                            font.family: "Lato"
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Cleaning should be done promptly."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Image {
                        id: ellipse_6
                        x: 12
                        y: 20
                        source: Qt.resolvedUrl("assets/ellipse_6.png")
                    }
                    Image {
                        id: multiply_1
                        x: 341
                        y: 14
                        source: Qt.resolvedUrl("assets/multiply_1.png")
                    }
                }
                Item {
                    id: group_8
                    y: 110
                    height: 51
                    width: 384
                    Rectangle {
                        id: rectangle_62
                        height: 51
                        width: 384
                        color: "#d9d9d9"
                    }
                    Item {
                        id: group_9
                        x: 36
                        y: 12
                        height: 27.59
                        width: 231
                        Text {
                            id: station_8
                            height: 17
                            width: 104.95
                            color: "#3f3636"
                            font.family: "Konkhmer Sleokchher"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Station 8"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: requires_urgent_repair_due_to_safety_risks_
                            y: 14
                            height: 13.59
                            width: 232
                            color: "#3f3636"
                            font.family: "Lato"
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Requires urgent repair due to safety risks."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                    }
                    Image {
                        id: ellipse_7
                        x: 12
                        y: 20
                        source: Qt.resolvedUrl("assets/ellipse_7.png")
                    }
                    Image {
                        id: multiply_2
                        x: 341
                        y: 14
                        source: Qt.resolvedUrl("assets/multiply_2.png")
                    }
                }
                Item {
                    id: group_10
                    y: 165
                    height: 51
                    width: 384
                    Rectangle {
                        id: rectangle_63
                        height: 51
                        width: 384
                        color: "#d9d9d9"
                    }
                    Item {
                        id: group_11
                        x: 36
                        y: 12
                        height: 27
                        width: 320
                        Text {
                            id: station_14
                            height: 17
                            width: 82
                            color: "#3f3636"
                            font.family: "Konkhmer Sleokchher"
                            font.pixelSize: 16
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Station 14"
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                        }
                        Text {
                            id: urgent_attention_is_needed_to_fix_this_dangerous
                            y: 13
                            height: 14
                            width: 321
                            color: "#3f3636"
                            font.family: "Lato"
                            font.pixelSize: 12
                            font.weight: Font.Normal
                            horizontalAlignment: Text.AlignLeft
                            text: "Urgent attention is needed to fix this dangerous issue."
                            textFormat: Text.PlainText
                            verticalAlignment: Text.AlignVCenter
                            wrapMode: Text.WordWrap
                        }
                    }
                    Image {
                        id: ellipse_8
                        x: 12
                        y: 20
                        source: Qt.resolvedUrl("assets/ellipse_8.png")
                    }
                    Image {
                        id: multiply_3
                        x: 341
                        y: 14
                        source: Qt.resolvedUrl("assets/multiply_3.png")
                    }
                }
                Image {
                    id: line_6
                    x: 31
                    y: 110
                    source: Qt.resolvedUrl("assets/line_6.png")
                }
                Image {
                    id: line_7
                    x: 31
                    y: 166
                    source: Qt.resolvedUrl("assets/line_7.png")
                }
                Image {
                    id: line_5
                    x: 31
                    y: 51
                    source: Qt.resolvedUrl("assets/line_5.png")
                }
            }
        }
    }
}


