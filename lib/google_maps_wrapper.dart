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

