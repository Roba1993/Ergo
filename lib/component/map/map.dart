library Ergo.component.map;

import 'dart:html';

import 'package:angular/angular.dart';
import 'package:google_maps/google_maps.dart';
import 'package:Ergo/model/flatModel.dart';

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
  final Http _http;
  String _place = "Köln";
  var map;
  List<FlatModel> flats = new List<FlatModel>();

  /// Constructor EMthod for this class
  MapComponent(this._http);

  /// This function centers the map of the actual typed location.
  /// It's called at every change of place autocratically
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

  /// get the place
  get place => _place;

  /// This function starts when the html is loaded
  @override
  onShadowRoot(ShadowRoot shadowRoot) {
    setMap();
    addFlats();
  }

  /// This function set's the map
  setMap() {
    // set the map options
    final mapOptions = new MapOptions()
      ..zoom = 12
      ..center = new LatLng(50.936039090088215, 6.96121215820312)
      ..mapTypeId = MapTypeId.ROADMAP
    ;
    map = new GMap(querySelector("#map_canvas"), mapOptions);

    // bin the map to the div element
    querySelector("#map_canvas").style.height = (window.innerHeight - 50).toString()+"px";
    // resize the map
    querySelector("#place").style.top = (window.innerHeight - 50).toString()+"px";
  }

  /// this faction add the flats from the flats.json to the map
  addFlats() {
    // get the flats from the json
    _http.get('flats.json').then((HttpResponse response) {
      flats =  response.data.map((d) => new FlatModel.fromJson(d)).toList();

      // loop over all maps
      for(FlatModel f in flats) {
        // get the coordinates of the location
        final request = new GeocoderRequest()
          ..address = f.location
        ;

        new Geocoder().geocode(request, (List<GeocoderResult> results, GeocoderStatus status) {
          if (status == GeocoderStatus.OK) {
            // set the marker
            final marker = new Marker(new MarkerOptions()
              ..map = map
              ..position = results[0].geometry.location
              ..title = f.name
            );

            // set info window
            var buttons = '<a href="' + f.url + '" class="btn btn-default" role="button">Watch this flat</a>' +
            '<a href="#/map/insurance/' + f.id + '" class="btn btn-default pull-right" role="button">Calculate Insurance</a>';
            final infowindow = new InfoWindow(new InfoWindowOptions()
              ..content = f.content + buttons
            );

            // set click event
            marker.onClick.listen((e) {
              infowindow.open(map, marker);
            });
          }
        });
      }
    })
    .catchError((e) {
      print(e);
    });

  }

}