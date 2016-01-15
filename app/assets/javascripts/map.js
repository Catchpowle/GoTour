var map;
var directionsDisplay;
var directionsService;
var bounds;

function initMap() {
  directionsService = new google.maps.DirectionsService();
  directionsDisplay = new google.maps.DirectionsRenderer();
  map = new google.maps.Map($('#map-canvas')[0], {
    center: {
      lat: -34.397,
      lng: 150.644
    },
    zoom: 8
  });
  directionsDisplay.setMap(map);
  bounds = new google.maps.LatLngBounds();

  fans = $('#map-canvas').data('fans');
  _(fans).each(function(fan) {
    var marker = createMarker(fan.latitude, fan.longitude, fan.city);
    // marker.addListener('click', function() {
    //   showModal(fan);
    // });
  });
}

function createMarker(lat, lng, city) {
  var latLng = new google.maps.LatLng(lat, lng);
  var marker = new google.maps.Marker({
    position: latLng,
    title: city,
    map: map
  });
  setBounds(latLng);

  return marker;
}

function setBounds(latLng){
  bounds.extend(latLng);
  map.fitBounds(bounds);
}

function setRoute(){
  var route = $('#map-route').data('route');
  var start = route.start;
  var finish = route.finish;
  var waypoints = setWayPoints(route.waypoints);
  var request = {
    origin: start,
    destination: finish,
    waypoints: waypoints,
    optimizeWaypoints: true,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(result, status) {
    if (status == google.maps.DirectionsStatus.OK) {
      directionsDisplay.setDirections(result);
    }
  });
}

function setWayPoints(waypoints){
  var waypointsArray = [];
  _(waypoints).each(function(waypoint) {
    var element = { location: waypoint, stopover: true };
    waypointsArray.push(element);
  });
  return waypointsArray;
}
