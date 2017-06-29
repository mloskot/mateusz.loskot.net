---
date: 2007-11-06 10:04:27
slug: ogr-geojson-driver
title: OGR GeoJSON Driver
categories: [ "code" ]
---

**Update on  Nov 6th, 2007 at 3:23 pm**: [GeoJSON Driver Errata](/2007/11/06/geojson-driver-errata/)





During last couple of days I was trying to run away in fear of [Halloween](http://en.wikipedia.org/wiki/Halloween) monsters, so I locked myself with laptop in my wardrobe and decided to spent this time on programming a new driver for [OGR](http://gdal.org/ogr/). I ended up with usable implementation of [GeoJSON](http://geojson.org/) driver for OGR and I'd like to introduce it here and now.





Motivation was simple...to avoid zombies but not only. In the [MOSS4G](http://moss4g.telascience.org/) project, we need a way to talk to remote geospatial data services. from mobile devices. We've started development of [WFS](http://www.opengeospatial.org/standards/wfs) client but it's not a trivial task and we don't want to hurry with that. Also, WFS and parsing GML seems to be a heavy task for mobile solutions, but we will check it later :-). In the meantime, we have something light and fast - GeoJSON.

  
 



The GeoJSON is a new _dialect_ based on [JSON](http://json.org/) format. The JavaScript Object Notation (JSON) is a lightweight plain text format for data interchange and GeoJSON is nothing other than its specialization for geographic content. The GeoJSON format fits very well the same niches as GML, like geospatial data interchange over network. Currently, GeoJSON is supported as output format of services implemented by [FeatureServer](http://featureserver.org/), [GeoServer](http://docs.codehaus.org/display/GEOSDOC/GeoJSON+Output+Format) and [CartoWeb](http://exportgge.sourceforge.net/kml/).





It's correct to assume that every valid GeoJSON encoded data is valid JSON content, so it's possible to process GeoJSON data using any JSON parser you like. Internally, the OGR GeoJSON driver uses [JSON-C](http://oss.metaparadigm.com/json-c/) library as a JSON [parser](http://en.wikipedia.org/wiki/Parsing). The JSON-C is a small and fast validating parser of JSON format implemented in portable C language by Michael Clark from [Metaparadigm Pte. Ltd.](http://metaparadigm.com/) The library is an [Open Source Software](http://www.opensource.org/) and available under the terms of the [MIT License](http://www.opensource.org/licenses/mit-license.php).





The OGR GeoJSON driver is available in [SVN repository](http://trac.osgeo.org/moss4g/) of [MOSS4G](http://moss4g.telascience.org/) project in module [trunk/libs/gdal/extensions/ogr](http://trac.osgeo.org/moss4g/browser/trunk/libs/gdal/extensions/ogr). In near future, I'd like to add this driver to the official [GDAL/OGR repository](http://trac.osgeo.org/gdal/). For now, I've included patched GDAL makefiles so it should be feasible to build the driver using GDAL sources. The OGR GeoJSON driver is also available under the MIT License.





The OGR GeoJSON driver provides implementation of functions transforming GeoJSON encoded data to objects of [OGR Simple Features model](http://gdal.org/ogr/ogr_arch.html): Datasource, Layer, Feature, Geometry. The implementation is based on [GeoJSON Specification draft, v5.0](http://wiki.geojson.org/GeoJSON_draft_version_5).





At the moment, the GeoJSON driver provides read-only access to all types of supported datasources (see below):

    
    
    $ ogrinfo --formats
    Supported Formats:
    ...
      -> "GeoJSON" (readonly)
    


In near future, I'm going to add ability to insert and delete features, but it will be only available for **FeatureServer** connections.






### Datasource





The OGR GeoJSON driver accepts three types of sources of data:




  * Uniform Resource Locator ([URL](http://en.wikipedia.org/wiki/URL)) - a Web address to perform [HTTP](http://en.wikipedia.org/wiki/HTTP) request


  * Plain text file with GeoJSON data


  * Text passed directly and encoded in GeoJSON








I should indicate that the _FeatureServer_ is the only [Web Service](http://en.wikipedia.org/wiki/Web_service) provider of GeoJSON data I've used during tests.





### Layer





Currently, there is no support of multiple layer datasource. It means, that if we open a datasource the driver will always produce single OGR layer. It isn't clear how to categorize GeoJSON objects into separate layers and there is no concept like GetCapabilities request from [OGC Web Services](http://en.wikipedia.org/wiki/Open_Geospatial_Consortium). Another assumption is that GeoJSON is medium and server independent format, what means GeoJSON data can be stored in a file, a table in database or read from a Web Service. The FeatureServer provides HTTP request to access list of available layers but it sends response encoded in JSON but not GeoJSON format. I tried to stick to GeoJSON Specification and avoid features specific to FeatureServer (or any other server). Anyway, if this subject will be solved in the GeoJSON Specification somehow, I will implement multi-layers support.





As there are no layer objects in the GeoJSON Specification, there are also no names of layers. Because the driver generates single OGRLayer object per datasource, I enforce the driver to use pre-defined name **OGRGeoJSON**, like this:

    
    
    ogrinfo -ro http://featureserver/data/.geojson OGRGeoJSON
    








When a Web Service (ie. FeatureServer datasource) is used as datasource, each request will produce new layer. This behavior conforms to stateless nature of HTTP transaction. Just to give a simple analogy:




  * Using an URL in a Web browser you can request and load single Web page. If you want another Web page, you need to use another URL.


  * Using an URL to GeoJSON datasource you can generate single layer. If you want another layer, you need to use new URL. 

I hope it makes sense and clarifies behavior of the OGR GeoJSON driver a little.






The GeoJSON Specification lists following types of objects that may occur in data: _Point_, _LineString_, _Polygon_, _MultiPoint_, _MultiLineString_, _MultiPolygon_, _GeometryCollection_, _Feature_, or _FeatureCollection_. The **3 types** of the _Multi*_ geometries are not supported at this moment, but it's not a big deal, I just need to find 2-3 hours gap in my schedule :-).





If a top-level member of GeoJSON data is of any other type than _FeatureCollection_, the driver will produce a layer with only  one feature. Otherwise, a layer will consists of a set of features.





### Feature





The OGR GeoJSON driver maps each object of following types to new _OGRFeature_ object: Point, LineString, Polygon, GeometryCollection, Feature.





According to the _GeoJSON Specification_, only the _Feature_ must have a member with the name _properties_. Each member of _properties_ is translated to OGR object of type of OGRField and added to corresponding OGRFeature object.





The _GeoJSON Specification_ does not require all _Feature_ objects in a collection must have the same schema of properties. If _Feature_ objects in a set defined by _FeatureCollection_ object have different schema of properties, then resulting schema of fields in OGRFeatureDefn is generated as [union](http://en.wikipedia.org/wiki/Union_(set_theory)) of all _Feature_ properties.





For example, for given two features with different set of properties:

    
    
    F1 = { a b c }
    F2 = { b c d }
    


schema of resulting _OGRLayer_ will include following attributes:

    
    
    L1 = { a b c d e }
    


and attribute **d** for **F1** is null and attribute **a** for feature **F2** is also _null_.





I was also thinking about implementing support to request only attributes common for all features, an [intersection](http://en.wikipedia.org/wiki/Intersection_(set_theory)), but I've put this concept away for a while. Intersecting attributes of big set of features might be a very slow process. Anyway, I'd like to ask for comments and ideas. Feel free to drop yours in the comments below.

 



It is possible to tell the driver to not to process attributes. Just set environment variable **ATTRIBUTES_SKIP=YES**. Default behavior is to preserve all attributes (an union), what is equal to setting **ATTRIBUTES_SKIP=NO**.





At the moment, it's not possible to pass additional options to _OGRSFDriver::Open()_ from the OGR API, so setting environment is just a simple workaround. This situation will probably change in future, because there is a plan to implement extension to the OGR API to handle extra options on open action. For details, check this document [RFC 10: OGR Open Parameters](http://trac.osgeo.org/gdal/wiki/rfc10_ogropen).



### Geometry





Similarly to the issue with mixed-properties features, the _GeoJSON Specification_ draft does not require that all _Feature_ objects in a collection must have geometry of the same type. Unfortunately, OGR objects model does not allow to have geometries of different types in single layer (see [GeoJSON Driver Errata](/2007/11/06/geojson-driver-errata/)). To handle this limitation I decided to use _OGRGeometryCollection_ as a meta geometry. By default, the OGR GeoJSON driver preserves type of geometries. To avoid problems with handling mixed-geometry in GeoJSON data, then you can set another environment variable, **GEOMETRY_AS_COLLECTION=YES** (default is **NO**) to tell the driver to wrap all geometries with OGRGeometryCollection type. Again, if you see a better solution, please don't hesitate to share it with me.





Here is sample output from ogrinfo presenting this feature in action, with default 
setting **GEOMETRY_AS_COLLECTION=NO** (default):

    
    
    OGRFeature(OGRGeoJSON):0
      name (String) = Pierwszy
      POINT (0 0)
    
    OGRFeature(OGRGeoJSON):1
      name (String) = Drugi
      POINT (10 10)
    



and with **GEOMETRY_AS_COLLECTION=YES**:

    
    
    OGRFeature(OGRGeoJSON):0
      name (String) = Pierwszy
      GEOMETRYCOLLECTION (POINT (0 0))
    
    OGRFeature(OGRGeoJSON):1
      name (String) = Drugi
      GEOMETRYCOLLECTION (POINT (10 10))
    








Here are a few examples of GeoJSON driver in action:




    
  * Reading GeoJSON from a file with raw _Point_ object:



    
    
    $ cat point.geojson 
    {
       "type": "Point",
       "coordinates": [100.0, 0.0]
    }
    
    $ ogrinfo -ro point.geojson
    
    Layer name: OGRGeoJSON
    Geometry: Point
    Feature Count: 1
    Extent: (100.000000, 0.000000) - (100.000000, 0.000000)
    Layer SRS WKT:
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.257223563,
                AUTHORITY["EPSG","7030"]],
            AUTHORITY["EPSG","6326"]],
        PRIMEM["Greenwich",0,
            AUTHORITY["EPSG","8901"]],
        UNIT["degree",0.01745329251994328,
            AUTHORITY["EPSG","9122"]],
        AUTHORITY["EPSG","4326"]]
    OGRFeature(OGRGeoJSON):0
      POINT (100 0)
    


    



    
  * Querying features from FeatureServer using attributes filter:


    
    
    
    $ ogrinfo -ro http://featureserver/cities/.geojson OGRGeoJSON -where "name=Warsaw"
    
    Layer name: OGRGeoJSON
    Geometry: Point
    Feature Count: 5
    Extent: (10.000000, 10.000000) - (10.000000, 10.000000)
    Layer SRS WKT:
    GEOGCS["WGS 84",
        DATUM["WGS_1984",
            SPHEROID["WGS 84",6378137,298.257223563,
                AUTHORITY["EPSG","7030"]],
            AUTHORITY["EPSG","6326"]],
        PRIMEM["Greenwich",0,
            AUTHORITY["EPSG","8901"]],
        UNIT["degree",0.01745329251994328,
            AUTHORITY["EPSG","9122"]],
        AUTHORITY["EPSG","4326"]]
    name: String (0.0)
    OGRFeature(OGRGeoJSON):1
      name (String) = Warsaw
      POINT (10 10)
    


    



    
  * Translating FeatureServer datasource to [ESRI Shapefile](http://en.wikipedia.org/wiki/Shapefile):



    
    
    $ ogr2ogr -f "ESRI Shapefile" cities.shp http://featureserver/cities/.geojson OGRGeoJSON
    









### The plan






  * Add the OGR GeoJSON Driver to the official set of OGR drivers


  * Implement Multi* geometries support


  * Implement insert and delete operations in terms of FeatureServer


  * Perhaps, add reading of FeatureServer layers manifest and then implement support of multi-layers per datasource, but I'm still not convinced to this concept. Have to talk to GeoJSON gurus and ask them if they have any plan for _layering_


  * Develop small GeoJSON client for mobile devices


  * Collect comments, new ideas and bug reports from you :-)







I'd like to thank [Christopher Schmidt](http://crschmidt.net/) and [Howard Butler](http://hobu.net/) for their help (yes, fortunately there was some WiFi signal in the closet, so I could chat with these great friends on the IRC ;-)) in understanding elements of GeoJSON and FeatureServer.
