function initialize() {
    var myLatlng = new google.maps.LatLng(58.37825, 26.71467);
    var myOptions = {
        zoom: 8,
        center: myLatlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("openpi_map"), myOptions);

    var marker = new google.maps.Marker({
        position: myLatlng,
        map: map,
        title:"OpenPi Service Location!"
    });
}
