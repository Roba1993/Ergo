library Ergo.component.map;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:google_maps/google_maps.dart';

/**
 * A component with a simple template which the Javascript Google Maps API
 * will use to install a map inside the ShadowRoot.
 */
@Component(
    selector: 'map',
    templateUrl: 'packages/Ergo/component/map/map.html',
    cssUrl: 'map.css',
    useShadowDom: false)
class MapComponent implements ShadowRootAware {
  String _place = "Köln";
  var map;

  set place(String place) {
    _place = place;

    final request = new GeocoderRequest()
      ..address = _place
    ;

    new Geocoder().geocode(request, (List<GeocoderResult> results, GeocoderStatus status) {
      if (status == GeocoderStatus.OK) {
        map.center = results[0].geometry.location;
      }
    });
  }

  get place => _place;

  @override
  onShadowRoot(ShadowRoot shadowRoot) {
    updateMap();
  }

  updateMap() {
    final mapOptions = new MapOptions()
      ..zoom = 8
      ..center = new LatLng(50.936039090088215, 6.96121215820312)
      ..mapTypeId = MapTypeId.ROADMAP
    ;
    map = new GMap(querySelector("#map_canvas"), mapOptions);


    querySelector("#map_canvas").style.height = (window.innerHeight - 50).toString()+"px";
    querySelector("#place").style.top = (window.innerHeight - 50).toString()+"px";


    // try to get location
    if (window.navigator.geolocation != null) {
      window.navigator.geolocation.getCurrentPosition().then((position) {
        map.center = new LatLng(position.coords.latitude, position.coords.longitude);
      }, onError : (error) {
        window.console.log("Can't get geo location");
      });
    }
  }


}