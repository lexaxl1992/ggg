function get_data(url) {
    var Httpreq = new XMLHttpRequest();
    Httpreq.open('GET', url, false);
    Httpreq.send(null);
    return JSON.parse(Httpreq.responseText);
}