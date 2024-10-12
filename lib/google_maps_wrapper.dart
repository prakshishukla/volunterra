// File: lib/google_maps_wrapper.dart

import 'dart:html';
import 'dart:js' as js;
import 'dart:js_util' as js_util;
import 'package:js/js.dart';

@JS('google.maps')
library google_maps;

@JS()
class Map {
  external Map(Element element, MapOptions options);
}

@JS()
@anonymous
class MapOptions {
  external factory MapOptions({
    double zoom,
    LatLng center,
  });
}

@JS()
class LatLng {
  external LatLng(double lat, double lng);
}

// File: lib/main.dart

import 'dart:html';
import 'package:your_project_name/google_maps_wrapper.dart';

void main() {
  final script = ScriptElement()
    ..type = 'text/javascript'
    ..src = 'https://maps.googleapis.com/maps/api/js?key=AIzaSyBvMc1kAu_VOHZdq1xXg698rWuv0h5DDz4';
  
  document.head!.appendChild(script);

  script.onLoad.listen((_) {
    final mapOptions = MapOptions(
      zoom: 8,
      center: LatLng(37.5, -122.0),
    );

    final mapElement = document.getElementById('map');
    Map(mapElement!, mapOptions);
  });
}