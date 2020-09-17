import { Controller } from 'stimulus'
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

export default class extends Controller {
  static targets = ['map']

  connect() {
    this.initMapbox()
    // this.initAutocomplete()
    this.markers = []
    this.map = null
  }

  initMapbox() {
    if (this.mapTarget) { // only build a map if there's a div#map to inject into
      mapboxgl.accessToken = this.mapTarget.dataset.mapboxApiKey;
      this.markers = JSON.parse(this.mapTarget.dataset.markers);

      this.map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10',
        zoom: 10
      });


      this.showMarkers()
      this.fitMapToMarkers()
      this.map.scrollZoom.disable();
    }
  }

  showMarkers() {
    this.markers.forEach((marker) => {
      const custom = document.createElement('div')
      custom.classList.add('custom-marker')
      new mapboxgl.Marker(custom)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

}
