import QtQuick

Item {
    id: root
    anchors.fill: parent

    signal goToDashboard()

    //  Design (Figma) base size
    property real baseW: 1920
    property real baseH: 1080

    //  Scale based on device/window size
    property real s: width / baseW

    //  Center the scaled UI
    property real offX:0
    property real offY: (height - baseH * s) / 2

    //  Background fills the entire screen always
    Image {
        id: main_Window
        anchors.fill: parent
        clip: true
        fillMode: Image.Stretch
        source: Qt.resolvedUrl("assets/main_Window.png")
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
            id: header

            height: 130
            width: 1920

            Image {
                id: rectangle_57
                source: Qt.resolvedUrl("assets/rectangle_57.png")
            }

            Item {
                id: group_1

                x: 37
                y: 24

                height: 82
                width: 421

                Image {
                    id: labelTitleDrone

                    x: 54.58
                    y: 18.73

                    source: Qt.resolvedUrl("assets/labelTitleDrone.png")
                }
                Image {
                    id: logoPic

                    y: 18

                    source: Qt.resolvedUrl("assets/logoPic.png")
                }
            }
        }

        Item {
            id: bg_Design

            x: 1064
            y: 226

            height: 1079
            width: 813

            Image {
                id: ellipse_4

                x: 305
                y: -100

                source: Qt.resolvedUrl("assets/ellipse_4.png")
            }
            Image {
                id: ellipse_3

                x: -100
                y: 247

                source: Qt.resolvedUrl("assets/ellipse_3.png")
            }
        }

        Image {
            id: d_drone_1

            x: 770
            y: 178

            source: Qt.resolvedUrl("assets/d_drone_1.png")
        }

        Item {
            id: bg_Info_Design

            x: 125
            y: 280

            height: 520
            width: 450

            Image {
                id: line_1

                y: 85

                source: Qt.resolvedUrl("assets/line_1.png")
            }
            Image {
                id: line_2

                y: 201

                source: Qt.resolvedUrl("assets/line_2.png")
            }
            Image {
                id: line_3

                y: 317

                source: Qt.resolvedUrl("assets/line_3.png")
            }
            Image {
                id: line_4

                y: 433

                source: Qt.resolvedUrl("assets/line_4.png")
            }

            Item {
                id: dark_Red

                y: 460

                height: 60
                width: 311

                Image {
                    id: dark_Red_Circle
                    source: Qt.resolvedUrl("assets/dark_Red_Circle.png")
                }
                Item {
                    id: dark_Red_Group

                    x: 75
                    y: 3

                    height: 57
                    width: 236

                    Text {
                        id: dark_Red_1

                        height: 29
                        width: 81

                        color: "#ffffff"
                        font.family: "Karma"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        id: extreme_Severity

                        y: 9

                        height: 48
                        width: 237

                        color: "#ffffff"
                        font.family: "Markazi Text"
                        font.pixelSize: 40
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        text: "Extreme Severity"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Item {
                id: red

                y: 345

                height: 60
                width: 260

                Image {
                    id: red_Circle
                    source: Qt.resolvedUrl("assets/red_Circle.png")
                }
                Item {
                    id: red_Group

                    x: 75
                    y: 2

                    height: 58
                    width: 185

                    Text {
                        id: high_Severity

                        y: 10

                        height: 48
                        width: 186

                        color: "#ffffff"
                        font.family: "Markazi Text"
                        font.pixelSize: 40
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        text: "High Severity"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        id: red_1

                        height: 29
                        width: 33

                        color: "#ffffff"
                        font.family: "Karma"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Item {
                id: yellow

                y: 230

                height: 61
                width: 327

                Image {
                    id: yellow_Circle
                    source: Qt.resolvedUrl("assets/yellow_Circle.png")
                }
                Item {
                    id: yellow_Group

                    x: 75

                    height: 61
                    width: 252

                    Text {
                        id: moderate_Severity

                        y: 13

                        height: 48
                        width: 253

                        color: "#ffffff"
                        font.family: "Markazi Text"
                        font.pixelSize: 40
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        text: "Moderate Severity"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        id: yellow_1

                        height: 29
                        width: 58

                        color: "#ffffff"
                        font.family: "Karma"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Item {
                id: green

                y: 114

                height: 61
                width: 251

                Image {
                    id: green_Circle

                    x: -4
                    y: 1

                    source: Qt.resolvedUrl("assets/green_Circle.png")
                }
                Item {
                    id: green_Group

                    x: 75

                    height: 61
                    width: 176

                    Text {
                        id: low_Severity

                        y: 13

                        height: 48
                        width: 177

                        color: "#ffffff"
                        font.family: "Markazi Text"
                        font.pixelSize: 40
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        text: "Low Severity"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        id: green_1

                        height: 29
                        width: 53

                        color: "#ffffff"
                        font.family: "Karma"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                }
            }

            Item {
                id: dark_green

                height: 61
                width: 292

                Image {
                    id: dark_Green_Circle

                    x: -4
                    y: 0.50

                    source: Qt.resolvedUrl("assets/dark_Green_Circle.png")
                }
                Item {
                    id: dark_Green_Group

                    x: 75

                    height: 61
                    width: 217

                    Text {
                        id: good_Condition

                        y: 13

                        height: 48
                        width: 218

                        color: "#ffffff"
                        font.family: "Markazi Text"
                        font.pixelSize: 40
                        font.weight: Font.Bold
                        horizontalAlignment: Text.AlignLeft
                        text: "Good Condition"
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                    Text {
                        id: dark_Green_1

                        height: 29
                        width: 100

                        color: "#ffffff"
                        font.family: "Karma"
                        font.pixelSize: 20
                        font.weight: Font.Normal
                        horizontalAlignment: Text.AlignHCenter
                        textFormat: Text.PlainText
                        verticalAlignment: Text.AlignVCenter
                        wrapMode: Text.WordWrap
                    }
                }
            }
        }

        Image {
            id: dashboard_Btn

            x: 217
            y: 887

            source: Qt.resolvedUrl("assets/dashboard_Btn.png")

            Text {
                id: dashboard

                x: 66
                y: 15

                height: 65
                width: 181.60

                color: "#ffffff"
                font.family: "Koulen"
                font.letterSpacing: 3.60
                font.pixelSize: 36
                font.weight: Font.Normal
                horizontalAlignment: Text.AlignHCenter
                text: "Dashboard"
                textFormat: Text.PlainText
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
            }
            MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            onClicked: root.goToDashboard()
        }
        }

    } // end of main (scaled Item)
} 