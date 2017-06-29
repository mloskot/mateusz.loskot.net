---
date: 2008-08-21 16:53:56
slug: wkb-hex-decoder-in-c
title: WKB hex decoder in C++
categories: [ "code" ]
---

In [PostGIS](http://www.postgis.org/) world, I often need to construct geometry from Well-Known-Binary (WKB) or [PostGIS EWKB](http://www.postgis.org/documentation/manual-1.3/ch04.html) stream encoded as hex stream. It's easy to do if I have access to PostgreSQL/PostGIS client which accepts SQL queries:

    
    <code>SELECT
       ST_AsText(
          ST_GeomFromWKB(
             decode('0101000000e5d022dbf93e2e40dbf97e6abc743540', 'hex'),
             4326))</code>








I often need to do the same directly in C++ code - parse hex encoded binary stream to raw stream of bytes. Here is simple hex decoder I use:


    
    <code>#include <sstream>
    #include <string>
    #include <vector>
    typedef std::vector<unsigned char> ewkb_t;
    
    // bytes [out] - buffer for binary output
    void hex_to_bytes(std::string const& hexstr, ewkb_t& bytes)
    {
        bytes.clear();
        for(std::string::size_type i = 0; i < hexstr.size() / 2; ++i)
        {                   
            std::istringstream iss(hexstr.substr(i * 2, 2));
            unsigned int n;
            iss >> std::hex >> n;
            bytes.push_back(static_cast<unsigned char>(n));
        }
    }
    </code>








For example, I use it to build [FDO geometry objects](http://trac.osgeo.org/fdo/browser/trunk/Providers/PostGIS/Src/Provider/PgGeometry.h) using another utility [CreateGeometryFromExtendedWkb](http://trac.osgeo.org/fdo/browser/trunk/Providers/PostGIS/Src/Provider/PgGeometry.cpp?rev=3904#L284) defined in FDO provider for PostGIS:

    
    <code>// POINT (1.234 5.678)
    std::string ewkbhex("01010000005839B4C876BEF33F83C0CAA145B61640");
    ewkb_t ewkb;
    hex_to_bytes(ewkbhex, ewkb);
    if (!ewkb.empty())
    {
       FdoPtr<fdoigeometry> g = CreateGeometryFromExtendedWkb(ewkb);
       // ... use geometry
    }</code>




