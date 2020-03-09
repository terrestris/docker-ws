import 'ol/ol.css';

import Map from 'ol/Map';
import View from 'ol/View';
import TileLayer from 'ol/layer/Tile';
import ImageLayer from 'ol/layer/Image';
import OSM from 'ol/source/OSM';
import ImageWMS from 'ol/source/ImageWMS';
import { fromLonLat } from 'ol/proj';

const osmLayer = new TileLayer({
  source: new OSM()
});

const stadtteileLayer = new ImageLayer({
  name: 'Stadtteile',
  source: new ImageWMS({
    url: '/geoserver/wms',
    params: {
      'LAYERS': 'FOSSGIS:STADTTEILE'
    },
    serverType: 'geoserver',
    crossOrigin: 'anonymous'
  })
});

const map = new Map({
  layers: [
    osmLayer,
    stadtteileLayer
  ],
  target: 'map',
  view: new View({
    center: fromLonLat([7.8377563, 47.9975796]),
    zoom: 1,
    resolutions: [
      76.4370282851763,
      38.2185141425881,
      19.1092570712941,
      9.55462853564703,
      4.77731426782352,
      2.38865713391176,
      1.19432856695588,
      0.597164283477939,
      0.29858214173897
    ]
  })
});

map.on('singleclick', evt => {
  document.getElementById('info').innerHTML = '';

  const view = map.getView();
  const viewResolution = view.getResolution();
  const url = stadtteileLayer.getSource().getFeatureInfoUrl(
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
