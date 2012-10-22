---
comments: true
date: 2010-02-26 23:53:29
layout: post
slug: sqlgeometry-and-point-empty-in-wkb
title: SqlGeometry and POINT EMPTY in WKB
wordpressid: 1914
categories: open source,programming
tags: .net,database,dbms,geospatial,ide,microsoft,ogc,postgis,programming,project,spatial,visual
  c++,visual studio
---

Inspired by question [Paul Ramsey](http://www.cleverelephant.ca/index.html) asked today morning on IRC, I've inspected what kind of Well-Known-Binary output gives [SqlGeometry](http://msdn.microsoft.com/en-us/library/microsoft.sqlserver.types.sqlgeometry%28SQL.105%29.aspx) for `EMPTY` geometries of all the seven geometry types as specified in OGC SFS. The `SqlGeometry` class is available from [SQL Server System CLR Types](http://www.microsoft.com/downloads/details.aspx?FamilyId=228DE03F-3B5A-428A-923F-58A033D316E1) for .NET Framework. Here we go.





I checked Well-Known-Binary output as returned by the SqlGeometry method [STAsBinary()](http://msdn.microsoft.com/en-us/library/microsoft.sqlserver.types.sqlgeometry.stasbinary%28SQL.105%29.aspx). Here is a small test program written in C#:




    
    <code>using System;
    using System.Linq;
    using Microsoft.SqlServer.Types;
    namespace SqlGeometryEmpty
    {
      class Test
      {
        static void Main(string[] args)
        {
          foreach (string type in
             Enum.GetNames(typeof(OpenGisGeometryType)))
          {
            string wkt = type.ToUpper() + " EMPTY";
            SqlGeometry geom = SqlGeometry.Parse(wkt);
            byte[] wkb = geom.STAsBinary().Buffer;
            string wkbhex = string.Join("",
              wkb.Select(
                b => b.ToString("X2")).ToArray());
            
            Console.WriteLine("{0}\n{1} ({2} bytes)\n",
              wkt, wkbhex, wkb.Length);
          }
        }
      }
    }</code>





The first observation is that WKB of `EMPTY` geometry for all types is returned as a a slightly different binary. All the binary forms are truncated to **nine bytes**. The **first byte** indicates endianness as expected. The **second** chunk of **four bytes** indicate geometry type. It is exactly as defined in OGC specifications. The **third** chunk of remaining **four bytes** are set to Zero and seem to play a role of size specifier: number of points in `LINESTRING` or number of rings in `POLYGON`, number of points in `MULTIPOINT`, and so on. This makes another observation that WKB for EMPTY is reported as a collection of primitive components.





The difference in binary of WKB of EMPTY geometry I mentioned is in that the actual type of input geometry is preserved, so there seems to be no implicit translation to geometry of some other type.





So far so good but not for too long. In fact, `SqlGeometry` implicitly _casts_ `POINT EMPTY` to `MULTIPOINT EMPTY` geometry with the WKB of the following form (in hex):




    
    010400000000000000





Here is complete output of the test program above:




    
    POINT EMPTY
    010400000000000000 (9 bytes)
    
    LINESTRING EMPTY
    010200000000000000 (9 bytes)
    
    POLYGON EMPTY
    010300000000000000 (9 bytes)
    
    MULTIPOINT EMPTY
    010400000000000000 (9 bytes)
    
    MULTILINESTRING EMPTY
    010500000000000000 (9 bytes)
    
    MULTIPOLYGON EMPTY
    010600000000000000 (9 bytes)
    
    GEOMETRYCOLLECTION EMPTY
    010700000000000000 (9 bytes)





A word about how [PostGIS](http://www.postgis.org/) behaves. PostGIS reports `GEOMETRYCOLLECTION EMPTY`, regardless of actual type of input `EMPTY` geometry. It is in hex form:




    
    010700000000000000





Generally, there is not many choices of how to report EMPTY geometry in clear and usable way and a form of collection with size equal to Zero seems to be the most appropriate choice. `POINT EMPTY` reported with type set to `POINT` (010100000000000000) would be ambiguous as _feels_ like truncated or invalid form of `POINT(0 0)`, especially in programming languages like C where native dynamic allocated arrays do not carry information about their size. IOW, geometry type is not enough information to process binary form of `POINT EMPTY` properly.





Reporting `EMPTY` geometries as a collection is a useful convention that seems to work well. PostGIS behaves about it in the very consistent manner reporting one type for all _empties_. SqlGeometry, so SQL Server, forces programmers to write a few more lines of code to handle all the possible cases. Yet another <del>original</del> exotic solution from Microsoft.





Consistent API is a bless!




Update: consistent specification of interface is even better.
