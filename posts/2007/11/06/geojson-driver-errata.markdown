---
comments: true
date: 2007-11-06 15:23:57
layout: post
slug: geojson-driver-errata
title: GeoJSON Driver Errata
wordpressid: 225
categories: open source
tags: gdal ogr json geojson driver format gis geospatial feat
---

In my today announcement of the [OGR GeoJSON Driver](/2007/11/06/ogr-geojson-driver/), I stated as follows:



> Unfortunately, OGR objects model does not allow to have geometries of different types in single layer.



Actually, this is not true or imprecise enough. The OGR model **does support**  mixed geometry types in single layer. Such layer is defined as of type of _wkbUnknown_ and it behaves similarly as, for instance, PostGIS layer (table) with geometry column defined as _GEOMETRY_ type. The wkbUnknown means that a layer is ust fine and all geometry types are allowed in this layer.





In my previous post, I incorrectly said mixed types are not supported because I considered wkbUnknown as not valid type of layer, as something undefined or defined as unusable. Thanks to Frank and Chris who clarified me this subject.





Anyway, as a matter of fact I've correctly implemented support of mixed geometry types as defined in the OGR model. It means, that if you are accessing GeoJSON datasource serving features of mixed geometry types, the driver will preserve these types **by default**. Eventually, you can request to wrap geometries  with OGRGeometryCollection type by setting GEOMETRY_AS_COLLECTION=YES variable.





Below, you can see how OGR GeoJSON handles collection of features with geometries of mixed types:



  * Here is sample _featurecollection.geojson_ file with GeoJSON data:


    
    
    {
      "type": "FeatureCollection",
      "crs": {
        "type": "URL",
        "properties": { 
          "url": "http://spatialreference.org/ref/epsg/2001/proj4/",
            "type": "proj4"
          }
      },
      "features": [
      {
        "type": "Feature",
        "id": "id0",
        "geometry": {
          "type": "LineString",
          "coordinates": [
            [102.0, 0.0], [103.0, 1.0], [104.0, 0.0], [105.0, 1.0]
          ]
        },
        "properties": {
        "prop0": "value0",
        "prop1": "value1"
        }
      },
      {
        "type": "Feature",
        "id": "id1",
        "geometry": {
          "type": "Polygon",
          "coordinates": [
            [
              [100.0, 0.0], [101.0, 0.0], [101.0, 1.0], [100.0, 1.0], [100.0, 0.0]
            ]
          ]
        },
        "properties": {
        "prop0": "value0",
        "prop1": "value1"
        }
      }
    ]
    }
    





  * and this is ogrinfo output for this file (notice the _Geometry: Unknown (any)_)


    
    
    ogrinfo -ro ../data/featurecollection.geojson  ogrgeojson
    
    INFO: Open of `../data/featurecollection.geojson'
          using driver `GeoJSON' successful.
    
    Layer name: OGRGeoJSON
    Geometry: Unknown (any)
    Feature Count: 2
    Extent: (100.000000, 0.000000) - (105.000000, 1.000000)
    Layer SRS WKT:
    (unknown)
    prop0: String (0.0)
    prop1: String (0.0)
    OGRFeature(OGRGeoJSON):0
      prop0 (String) = value0
      prop1 (String) = value1
      LINESTRING (102 0 0,103 1 0,104 0 0,105 1 0)
    
    OGRFeature(OGRGeoJSON):1
      prop0 (String) = value0
      prop1 (String) = value1
      POLYGON ((100 0 0,101 0 0,101 1 0,100 1 0,100 0 0))
    








I hope it's clarifies what I messed previously.
