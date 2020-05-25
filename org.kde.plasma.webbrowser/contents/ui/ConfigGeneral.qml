import QtQuick 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.5 as QQC2

import org.kde.kirigami 2.8 as Kirigami
import org.kde.plasma.core 2.0 as PlasmaCore

Kirigami.FormLayout {
    anchors.right: parent.right
    anchors.left: parent.left

    property alias cfg_useMinViewWidth: useMinViewWidth.checked
    property alias cfg_minViewWidth: minViewWidth.value
    property alias cfg_useConstantZoom: useConstantZoom.checked
    property alias cfg_constantZoomFactor: constantZoomFactor.value

    RowLayout {
        Kirigami.FormData.label: i18nc("@title:group", "Dynamic view scaling:")
        Layout.fillWidth: true

        QQC2.CheckBox {
            id: useMinViewWidth
            checked: useMinViewWidth
            text: i18nc("@option:check", "Minimum width (px):")

            onClicked: {
                cfg_useConstantZoom = !checked;
                if (checked) {
                    minViewWidth.forceActiveFocus();
                }
            }
        }

        QQC2.SpinBox {
            id: minViewWidth
            editable: true
            enabled: useMinViewWidth.checked

            from: 320
            to: 3840
        }
    }

    RowLayout {
        Kirigami.FormData.label: i18nc("@title:group", "Static view scaling:")
        Layout.fillWidth: true

        QQC2.CheckBox {
            id: useConstantZoom
            checked: useConstantZoom
            text: i18nc("@option:check", "Zoom factor (%):")

            onClicked: {
                cfg_useMinViewWidth = !checked;
                if (checked) {
                    constantZoomFactor.forceActiveFocus();
                }
            }
        }

        QQC2.SpinBox {
            id: constantZoomFactor
            editable: true
            enabled: useConstantZoom.checked

            from: 25
            to: 500
        }
    }
}
