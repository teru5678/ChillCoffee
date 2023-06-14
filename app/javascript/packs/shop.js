function initMap(){
    let map = new google.maps.Map(document.getElementById('map'), {
      center: {lat: <%= @shop.latitude %>,lng: <%= @shop.longitude %> },
    zoom: 15
    });
}