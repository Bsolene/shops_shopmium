function onPlaceChanged() {
  var place = this.getPlace();

  var shopAddress = document.getElementById('shop_address');
  shopAddress.blur();
  shopAddress.value = components.address;
}


document.addEventListener("DOMContentLoaded", function() {
  var shopAddress = document.getElementById('shop_address');

  if (shopAddress) {
    var autocomplete = new google.maps.places.Autocomplete(shopAddress, { types: ['geocode'] });
    google.maps.event.addListener(autocomplete, 'place_changed', onPlaceChanged);
    google.maps.event.addDomListener(shopAddress, 'keydown', function(e) {
      if (e.key === "Enter") {
        e.preventDefault(); // Do not submit the form on Enter.
      }
    });
  }
});
