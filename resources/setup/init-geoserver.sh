#!/bin/bash

GEOSERVER_HOST=http://localhost:8082
GEOSERVER_WORKSPACE=FOSSGIS
GEOSERVER_DATASTORE=POSTGIS
GEOSERVER_LAYER_NAME=COUNTRIES
GEOSERVER_STYLE_NAME=COUNTRIES
GEOSERVER_ADMIN_USER=admin
GEOSERVER_ADMIN_PASS=geoserver

echo "Creating workspace $GEOSERVER_WORKSPACE"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -X POST \
  -H "Content-type: application/xml" \
  -d "<workspace>
        <name>$GEOSERVER_WORKSPACE</name>
      </workspace>" \
   "$GEOSERVER_HOST/geoserver/rest/workspaces"

echo "Creating datastore $GEOSERVER_DATASTORE"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -X POST \
  -H "Content-type: application/xml" \
  -d "<dataStore>
      <name>$GEOSERVER_DATASTORE</name>
      <connectionParameters>
        <host>fossgis-postgis</host>
        <port>5432</port>
        <database>fossgis</database>
        <schema>public</schema>
        <user>fossgis</user>
        <passwd>fossgis</passwd>
        <dbtype>postgis</dbtype>
      </connectionParameters>
      </dataStore>" \
   "$GEOSERVER_HOST/geoserver/rest/workspaces/$GEOSERVER_WORKSPACE/datastores"

echo "Creating feature type $GEOSERVER_LAYER_NAME"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -X POST \
  -H "Content-type: application/xml" \
  -d "<featureType>
        <name>$GEOSERVER_LAYER_NAME</name>
        <nativeName>countries</nativeName>
        <nativeCRS>EPSG:3857</nativeCRS>
        <enabled>true</enabled>
      </featureType>" \
  "$GEOSERVER_HOST/geoserver/rest/workspaces/$GEOSERVER_WORKSPACE/datastores/$GEOSERVER_DATASTORE/featuretypes"

echo "Creating style $GEOSERVER_STYLE_NAME"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -X POST \
  -H "Content-type: application/xml" \
  -d "<style>
        <name>$GEOSERVER_STYLE_NAME</name>
        <filename>$GEOSERVER_STYLE_NAME.sld</filename>
      </style>" \
  "$GEOSERVER_HOST/geoserver/rest/workspaces/$GEOSERVER_WORKSPACE/styles"

echo "Uploading the style to $GEOSERVER_STYLE_NAME"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -X PUT \
  -H "Content-type: application/vnd.ogc.sld+xml" \
  -d '<?xml version="1.0" encoding="ISO-8859-1"?>
      <StyledLayerDescriptor version="1.0.0"
          xsi:schemaLocation="http://www.opengis.net/sld StyledLayerDescriptor.xsd"
          xmlns="http://www.opengis.net/sld"
          xmlns:ogc="http://www.opengis.net/ogc"
          xmlns:xlink="http://www.w3.org/1999/xlink"
          xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
        <NamedLayer>
          <Name>'$GEOSERVER_STYLE_NAME'</Name>
          <UserStyle>
            <Title>Countries</Title>
            <FeatureTypeStyle>
              <Rule>
                <PolygonSymbolizer>
                  <Fill>
                    <CssParameter name="fill">#EF7F00</CssParameter>
                    <CssParameter name="opacity">0.2</CssParameter>
                  </Fill>
                  <Stroke>
                    <CssParameter name="stroke">#EF7F00</CssParameter>
                    <CssParameter name="stroke-width">2</CssParameter>
                  </Stroke>
                </PolygonSymbolizer>
              </Rule>
              <Rule>
                <MaxScaleDenominator>100000000</MaxScaleDenominator>
                <TextSymbolizer>
                  <Label>
                    <ogc:PropertyName>name</ogc:PropertyName>
                  </Label>
                  <Font>
                    <CssParameter name="font-family">DejaVu Sans</CssParameter>
                    <CssParameter name="font-size">14</CssParameter>
                    <CssParameter name="font-style">normal</CssParameter>
                    <CssParameter name="font-weight">bold</CssParameter>
                  </Font>
                  <LabelPlacement>
                    <PointPlacement>
                      <AnchorPoint>
                        <AnchorPointX>0.5</AnchorPointX>
                        <AnchorPointY>0.0</AnchorPointY>
                      </AnchorPoint>
                    </PointPlacement>
                  </LabelPlacement>
                  <Halo>
                    <Radius>1</Radius>
                    <Fill>
                      <CssParameter name="fill">#EF7F00</CssParameter>
                    </Fill>
                  </Halo>
                  <Fill>
                    <CssParameter name="fill">#FFFFFF</CssParameter>
                  </Fill>
                </TextSymbolizer>
              </Rule>
            </FeatureTypeStyle>
          </UserStyle>
        </NamedLayer>
      </StyledLayerDescriptor>' \
  "$GEOSERVER_HOST/geoserver/rest/workspaces/$GEOSERVER_WORKSPACE/styles/$GEOSERVER_STYLE_NAME"

echo "Setting the style $GEOSERVER_STYLE_NAME to layer $GEOSERVER_LAYER_NAME"

curl \
  -S \
  -s \
  -o /dev/null \
  -u "$GEOSERVER_ADMIN_USER:$GEOSERVER_ADMIN_PASS" \
  -XPUT \
  -H "Content-type: application/xml" \
  -d "<layer>
        <defaultStyle>
          <name>$GEOSERVER_STYLE_NAME</name>
          <workspace>$GEOSERVER_WORKSPACE</workspace>
        </defaultStyle>
      </layer>" \
  "$GEOSERVER_HOST/geoserver/rest/layers/$GEOSERVER_WORKSPACE:$GEOSERVER_LAYER_NAME"
