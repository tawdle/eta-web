$(document).on("page:change", function() {
  if ($("#meeting_location").length == 0) return;
  var autocomplete = new google.maps.places.Autocomplete(document.getElementById('meeting_location'));
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    var place = autocomplete.getPlace();
    console.log(place.formatted_address);
  });
});
