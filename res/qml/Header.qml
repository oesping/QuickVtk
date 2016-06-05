import QtQuick 2.6

import "./lib" as Lib

Rectangle {
    height: visible ? 32 : 0;
    visible: !App.expanded;

    color: "#21252B"

    Rectangle {
        anchors.left: parent.left;
        anchors.right: parent.right;
        anchors.bottom: parent.bottom;

        height: 1;

        color: "#181A1F"
    }

    Row {
        anchors.left: parent.left;
        anchors.leftMargin: 4;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;

        spacing: 4;

        Lib.Button {
            anchors.verticalCenter: parent.verticalCenter;

            label.text: "Link File";
            icon.type: icon.types.fa_folder_open;

            onClicked: App.compiler.linkFile();
        }

        Lib.Button {
            anchors.verticalCenter: parent.verticalCenter;

            label.text: "Compile";
            icon.type: icon.types.fa_play_circle;
            enabled: App.compiler.modified;

            onClicked: {
                App.compiler.updateSource();
                App.compiler.compile();
            }
        }

        Lib.CheckBox {
            anchors.verticalCenter: parent.verticalCenter;

            label.text: "Auto-Compile"
            checked: App.compiler.autocompile;

            onClicked: App.compiler.autocompile = !App.compiler.autocompile;
        }
    }

    Row {
        anchors.right: parent.right;
        anchors.top: parent.top;
        anchors.bottom: parent.bottom;
        anchors.rightMargin: 4;

        spacing: 4;

        Lib.TagLabel {
            anchors.verticalCenter: parent.verticalCenter;
            visible: App.compiler.source.length > 0;
            color: App.compiler.modified ? "#aa5511" : "#008800";
            label.text: App.compiler.modified ? "modified" : "up-to-date";
        }

        Lib.Label {
            anchors.verticalCenter: parent.verticalCenter;

            font.pixelSize: 11;
            text: App.compiler.filePath;
        }

        Lib.CheckBox {
            anchors.verticalCenter: parent.verticalCenter;

            label.text: "TypeList"
            checked: App.typeList.visible;

            onClicked: App.typeList.visible = !App.typeList.visible;
        }

        Lib.Button {
            anchors.verticalCenter: parent.verticalCenter;

            icon.type: icon.types.fa_expand;
            onClicked: App.expanded = true;

            color: "#00000000"
            border.color: "#00000000"
        }
    }
}
