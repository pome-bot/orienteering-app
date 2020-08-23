// let map;

// function initMap() {
//   map = new google.maps.Map(document.getElementById("map"), {
//     center: { lat: -34.397, lng: 150.644 },
//     zoom: 8
//   });
// }

// function initMap() {
//   var uluru = {lat: -25.344, lng: 131.036};
//   var map = new google.maps.Map(
//       document.getElementById('map2'), {zoom: 4, center: uluru});
//   var marker = new google.maps.Marker({position: uluru, map: map});
// }

// var locations = [
//   {lat: -31.563910, lng: 147.154312},
//   {lat: -33.718234, lng: 150.363181},
//   {lat: -33.727111, lng: 150.371124},
//   {lat: -42.735258, lng: 147.438000},
//   {lat: -43.999792, lng: 170.463352}
// ]

// function initMap() {

//   var map = new google.maps.Map(document.getElementById('map'), {
//     zoom: 3,
//     center: {lat: -28.024, lng: 140.887}
//   });

//   // Create an array of alphabetical characters used to label the markers.
//   var labels = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

//   // Add some markers to the map.
//   // Note: The code uses the JavaScript Array.prototype.map() method to
//   // create an array of markers based on a given "locations" array.
//   // The map() method here has nothing to do with the Google Maps API.
//   var markers = locations.map(function(location, i) {
//     return new google.maps.Marker({
//       position: location,
//       map: map, // add
//       label: labels[i % labels.length]
//     });
//   });

//   // Add a marker clusterer to manage the markers.
//   var markerCluster = new MarkerClusterer(map, markers,
//       {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
// }


// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.
// var map, infoWindow;
// function initMap() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: -34.397, lng: 150.644},
//     zoom: 10
//   });
//   infoWindow = new google.maps.InfoWindow;

//   // Try HTML5 geolocation.
//   if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function(position) {
//       var pos = {
//         lat: position.coords.latitude,
//         lng: position.coords.longitude
//       };

//       infoWindow.setPosition(pos);
//       infoWindow.setContent('Location found.');
//       infoWindow.open(map);
//       map.setCenter(pos);
//     }, function() {
//       handleLocationError(true, infoWindow, map.getCenter());
//     });
//   } else {
//     // Browser doesn't support Geolocation
//     handleLocationError(false, infoWindow, map.getCenter());
//   }
// }
// function handleLocationError(browserHasGeolocation, infoWindow, pos) {
//   infoWindow.setPosition(pos);
//   infoWindow.setContent(browserHasGeolocation ?
//                         'Error: The Geolocation service failed.' :
//                         'Error: Your browser doesn\'t support geolocation.');
//   infoWindow.open(map);
// }


// var map;
// var marker;
// function initMap() {
//   var opts = {
//     zoom: 15,
//     center: new google.maps.LatLng(35.7154699,139.7740734)
//   };

//   map = new google.maps.Map(document.getElementById("map"), opts);

//   marker = new google.maps.Marker({position: map.getCenter(), map: map});
//   marker.setDraggable(true);

//   map.addListener('center_changed', dispLatLng);
// }

// function dispLatLng(){
//   marker.setMap(null);
//   marker = new google.maps.Marker({position: map.getCenter(), map: map});
//   // marker.setDraggable(true);

//   var latlng = map.getCenter();

//   $("#control_position_x").val(latlng.lng());
//   $("#control_position_y").val(latlng.lat());

//   var str = "中心：" + latlng.lat() + "," + latlng.lng() + "<br>";

//   var latlngBounds = map.getBounds();
//   var swLatlng = latlngBounds.getSouthWest();
//   str = str + "左下：" + swLatlng.lat() + "," + swLatlng.lng() + "<br>";

//   var neLatlng = latlngBounds.getNorthEast();
//   str = str + "右上：" + neLatlng.lat() + "," + neLatlng.lng();

//   document.getElementById("latlng").innerHTML = str;
// }
 




