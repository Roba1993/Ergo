library Ergo.component.map;

import 'package:angular/angular.dart';
import 'dart:html';
import 'dart:js';

/**
 * A component with a simple template which the Javascript Google Maps API
 * will use to install a map inside the ShadowRoot.
 */
@Component(
    selector: 'map',
    templateUrl: 'packages/Ergo/component/map/map.html',
    cssUrl: 'map.css')
class MapComponent implements ShadowRootAware {
  var map;

  onShadowRoot(root) {
    // From https://code.google.com/p/dart/source/browse/branches/bleeding_edge/dart/samples/google_maps/web/index.dart
    final gmaps = context['google']['maps'];
    var london = new JsObject(gmaps['LatLng'], [51.5, 0.125]);
    var mapOptions = new JsObject.jsify({
        "center": london,
        "zoom": 8,
    });

    map = new JsObject(gmaps['Map'], [root.querySelector('div'), mapOptions]);
  }
}