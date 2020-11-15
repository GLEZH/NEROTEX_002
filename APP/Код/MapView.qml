import QtQuick 2.0
import QtLocation 5.6
import QtQuick.Controls 2.0
import QtPositioning 5.2

Item {
    id: item

   /*function start() {
        console.debug("2.1")
        mapItem.clearMapItems();
        mapItem.track = Qt.createQmlObject('import QtLocation 5.6; MapPolyline {}', item);
        mapItem.track.line.width = 6;
        mapItem.track.line.color = 'red';
        mapItem.addMapItem(mapItem.track);
        var current =  gpsSrc.position.coordinate
        console.debug(current)
        mapItem.center = current

    }


    function appendCoordinate(position){
        console.debug("2.2")
        mapItem.center = position
        mapItem.track.addCoordinate(position)
    }*/




    /*Map {
        id: mapItem
        plugin: mapPlugin
        zoomLevel: 16
        width: item.width
        height:item.height
        center {
        latitude: 59.9485
        longitude: 10.7686
    }
        MapItemView{
            model: markerModel
            delegate: mapcomponent

        }

    }*/


    /*Component {
            id: mapcomponent

            MapQuickItem {
                id: marker
                anchorPoint.x: image.width
                anchorPoint.y: image.height
                coordinate: mapItem.center

                sourceItem: Image {
                    id: image
                    source: "http://maps.gstatic.com/mapfiles/ridefinder-images/mm_20_red.png"
                }
        }
    }

    MouseArea {
    anchors.fill: parent
    onPressed: {
        console.debug("1")
            var coordinate = mapItem.toCoordinate(Qt.point(mouse.x,mouse.y))
        markerModel.addMarker(coordinate)
    }
    }


    MapQuickItem {
        id:marker1
        sourceItem: Image{
        id: image
        source: "qrc:/images/folder.png"
        }
        coordinate: mapItem.center
        anchorPoint.x: image.width / 2
        anchorPoint.y: image.height / 2
        }

    MouseArea {
    anchors.fill: parent
    onPressed: {
        console.debug("1")
    marker1.coordinate = mapItem.toCoordinate(Qt.point(mouse.x,mouse.y))
    }
    }


    Timer {
        interval: 100; running: true; repeat: false
        onTriggered: {
            for(var i = 0;
                i < mapItem.supportedMapTypes.length;
                ++i){
                if(mapItem.supportedMapTypes[i].style
                        === MapType.CustomMap){
                    mapItem.activeMapType = mapItem.supportedMapTypes[i];
                }
            }
        }
    }

    Button{
        anchors{
            right: parent.right
            top:parent.top
            margins: 20
        }

        background:Rectangle{

            anchors.centerIn: parent
            implicitWidth:icon.width
            implicitHeight: icon.height

            radius: 5

            color:"white"
                Image{
                    id: icon
                    anchors.centerIn: parent
                    source: "qrc:/images/resize.png"
            }
        }

        onClicked: {
            item.state = item.state === "full" ? "normal" : "full";
        }
    }

    states:[
        State {
            name: "normal"

            PropertyChanges{
                target: mapItem
                height: item.height
                width: item.width
            }
        },
        State{
            name: "full"
            PropertyChanges{
                target: mapItem
                height: app.height
                width: app.width
            }
        }

    ]*/




    Map {
        id: mapItem
        plugin: mapPlugin
        zoomLevel: 16
        width: item.width
        height:item.height
        center {
        latitude: 59.9485
        longitude: 10.7686
    }

        MapItemView {
            model: searchModel
            delegate: MapQuickItem {
                coordinate: mapItem.center

                anchorPoint.x: image.width * 0.5
                anchorPoint.y: image.height

                sourceItem: Column {
                    Image { id: image; source: "marker.png" }
                    Text { text: title; font.bold: true }
                }
        }
        }
        MouseArea {
        anchors.fill: parent
        onPressed: {
            console.debug("1")
                var currentPosition = mapItem.toCoordinate(Qt.point(mouse.x,mouse.y))
            mapItem.center = currentPosition
            lastSearchPosition = currentPosition
            searchModel.searchArea = QtPositioning.circle(currentPosition)
            searchModel.update()
        }
        }
    }

    Timer {
        interval: 100; running: true; repeat: false
        onTriggered: {
            for(var i = 0;
                i < mapItem.supportedMapTypes.length;
                ++i){
                if(mapItem.supportedMapTypes[i].style
                        === MapType.CustomMap){
                    mapItem.activeMapType = mapItem.supportedMapTypes[i];
                }
            }
        }
    }


    /*GeocodeModel {
        id: geocodeModel
        plugin: map.plugin
        onStatusChanged: {
            if ((status == GeocodeModel.Ready) || (status == GeocodeModel.Error))
                map.geocodeFinished()
        }
        onLocationsChanged:
        {
            if (count == 1) {
                map.center.latitude = get(0).coordinate.latitude
                map.center.longitude = get(0).coordinate.longitude
            }
        }
    }

    MapItemView {
        model: geocodeModel
        delegate: pointDelegate
    }

    Component {
        id: pointDelegate

        MapCircle {
            id: point
            radius: 1000
            color: "#46a2da"
            border.color: "#190a33"
            border.width: 2
            smooth: true
            opacity: 0.25
            center: map.center
        }
    }

    Address {
        id :fromAddress
        street: "Sandakerveien 116"
        city: "Oslo"
        country: "Norway"
        state : ""
        postalCode: "0484"
    }

        MouseArea {
        anchors.fill: parent
        onPressed: {
            console.debug("1")
            geocodeModel.query = fromAddress
            geocodeModel.update()
        }
        }*/


    Button{
        anchors{
            right: parent.right
            top:parent.top
            margins: 20
        }

        background:Rectangle{

            anchors.centerIn: parent
            implicitWidth:icon.width
            implicitHeight: icon.height

            radius: 5

            color:"white"
                Image{
                    id: icon
                    anchors.centerIn: parent
                    source: "qrc:/images/resize.png"
            }
        }

        onClicked: {
            item.state = item.state === "full" ? "normal" : "full";
        }
    }

    states:[
        State {
            name: "normal"

            PropertyChanges{
                target: mapItem
                height: item.height
                width: item.width
            }
        },
        State{
            name: "full"
            PropertyChanges{
                target: mapItem
                height: app.height
                width: app.width
            }
        }

    ]


    state: "full"


}
