import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';
import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';
import { fromLonLat } from 'ol/proj';

import 'ol/ol.css';

const osmLayer = new TileLayer({
  source: new OSM()
});

const countriesLayer = new ImageLayer({
  name: 'Countries',
  source: new ImageWMS({
    url: `/geoserver/wms`,
    params: {
      'LAYERS': 'FOSSGIS:COUNTRIES'
    },
    serverType: 'geoserver',
    crossOrigin: 'anonymous'
  })
});

const map = new Map({
  layers: [
    osmLayer,
    countriesLayer
  ],
  target: 'map',
  view: new View({
    center: fromLonLat([0, 0]),
    zoom: 0
  })
});

map.on('singleclick', evt => {
  document.getElementById('info').innerHTML = '';

  const view = map.getView();
  const viewResolution = view.getResolution();
  const url = countriesLayer.getSource().getFeatureInfoUrl(
    evt.coordinate,
    viewResolution,
    view.getProjection(),
    {
      'INFO_FORMAT': 'text/html'
    }
  );

  if (url) {
    fetch(url)
      .then(response => response.text())
      .then(html => {
        openNav();
        document.getElementById('info').innerHTML = html;
      });
  }
});

const openNav = () => {
  document.getElementById('info-drawer').style.width = '25%';
};

const closeNav = () => {
  document.getElementById('info-drawer').style.width = '0';
};

document.getElementsByClassName('close-btn')[0].addEventListener('click', closeNav);
