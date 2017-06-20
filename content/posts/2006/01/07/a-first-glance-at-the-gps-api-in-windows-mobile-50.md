---
date: 2006-01-07 04:31:14
slug: a-first-glance-at-the-gps-api-in-windows-mobile-50
title: A first glance at the GPS API in Windows Mobile 5.0
categories: none
---

![Windows Mobile Logo](/images/logos/windows-mobile-logo.jpg)In the middle of 2005 Microsoft [introduced](http://www.windowsfordevices.com/news/NS2937141620.html) new [Windows Mobile 5.0](http://www.microsoft.com/windowsmobile/default.mspx).
This is the next generation of [Windows CE](http://msdn.microsoft.com/embedded/windowsce/default.aspx) platform. It was prepared to provide access to new features of latest mobile devices such as better multimedia support, better screen with 2D & 3D drawing capabilities, integration with cameras as well as integration with [Global Positioning System](http://tycho.usno.navy.mil/gps.html). More and more mobile devices appearing on the market are equipped with GPS receiver, built-in or as an attachment.






**Update:** Today, I published this article on [Pocket PC Developer Network](http://www.pocketpcdn.com/articles/articles.php?&atb.set(c_id)=45&atb.set(a_id)=6509&atb.perform(details)=&). Thanks to [Joao Paulo Figueira](http://www.primeworks.pt) for encouraging me to do it.







There are many aspects involved in accessing GPS capabilities, so developers need to solve quite complex problems: communicating serial port, parsing [NMEA](http://www.nmea.org) sentences and running separate threads. So, latest Windows Mobile 5.0 brings dedicated API for accessing GPS receiver in more straightforward way. It is called [GPS Intermediate Driver](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/mobilesdk5/html/mob5grfGPSIntermediateDriverReference.asp) (GPSID). Let's take a closer look at it.







Internally, GPSID is a common device driver. From user's point GPSID is, as you may guess, a kind of glue - intermediate layer - between GPS hardware and client application accessing GPS. GPSID is the first step to unify access to all GPS receivers by indirection.







Among others, the main advantages is that the same code will work with any GPS hardware. Second advantage is that GPSID allows multiple applications to query GPS at the same time. It seems like cloning hardware virtually. Third, GPSID will parse [NMEA sentences](http://aprs.gids.nl/nmea/) for you, so you can obtain GPS position (and more) by simple API. Nice, isn't it :-)







Along the new APIs, GPSID provides access to GPS hardware using old-good serial API. Shortly, there are two GPS access modes: [Parsed Mode](http://msdn.microsoft.com/library/en-us/mobilesdk5/html/wce51conAccessingParsedGPSData.asp) - fully based on the GPSID API and [Raw Mode](http://msdn.microsoft.com/library/en-us/mobilesdk5/html/wce51conAccessingRawGPSData.asp) - in which you can access GPS data using well known _CreateFile_, _ReadFile_, etc.







Using GPS Intermediate Driver you are able to access internal GPS device or attached to one of mobile device I/O ports. In order to be able to work with wide range of GPS receivers GPSID is very configurable by dedicated registry settings. For more information follow this link [GPS Intermediate Driver Registry Settings](http://msdn.microsoft.com/library/en-us/mobilesdk5/html/wce51oriGPSIntermediateDriverRegistrySettings.asp)







**Note:** _Currently, GPS Intermediate Driver API targets native developers, but managed version is planned._







After the short introduction to GPS Intermediate Driver coming with Windows Mobile 5.0 I'd like to walk through GPSID API calls and see what we can do with this stuff. I also suggest you to take a look at the [API reference manual](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/mobilesdk5/html/mob5grfGPSIntermediateDriverReference.asp).







First two functions create and close connection do the GPS Intermediate Driver: _GPSOpenDevice_ and _GPSCloseDevice_.
Next function is called _GPSGetDeviceState_ which takes a pointer to a _GPS_DEVICE_ structure. This function allows you to retrive detailed information about the GPS hardware. You can query for e.g. GPSID state, hardware state, UTC time indicating when last data was received from GPS and GPS hardware identifications.







Now, let's look at the most interesting function called _GPSGetPosition_. As you may guess, it retrieves GPS location information. _GPSGetPosition_ takes four parameters:




`
DWORD GPSGetPosition(
  HANDLE            hGPSDevice,
  GPS_POSITION* pGPSPosition,
  DWORD            dwMaximumAge,
  DWORD            dwFlags
);
`



	
  * hGPSDevice - Handle to GPS Intermediate Driver returned by _GPSOpenDevice_

	
  * pGPSPosition - Pointer to a _GPS_POSITION_ structure

	
  * dwMaximumAge - Maximum age of information you want to retrieve, in milliseconds

	
  * dwFlags - Flags, currently must be set to 0






Most interesting parameter is pointer to a _GPS_POSITION_. This structure contains so called GPS data. It's a combination of parameters retrieved from NMEA sentences retrived and parsed by GPSID, and finally returned in user friendly form of _GPS_POSITION_ structure.






Because most of us usually works with [NMEA protocol](http://en.wikipedia.org/wiki/NMEA) directly (at least till now, when we get GPSID), thus I'll try to explain _GPS_POSITION_ members in relation to NMEA sentences. Certainly, I recommend you to visit [MSDN for reference](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/mobilesdk5/html/mob5grfGPSIntermediateDriverReference.asp) too.







So, let's walk through _GPS_POSITION_ members one-by-one:



	
  * **stUTCTime**  

[Universal time](http://en.wikipedia.org/wiki/Utc) according to Global Positioning System. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga) and [$GPGLL](http://aprs.gids.nl/nmea/#gll).


	
  * **dblLatitude**  

   [Latitude](http://en.wikipedia.org/wiki/Latitude) of position of GPS user. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga) and [$GPGLL](http://aprs.gids.nl/nmea/#gll).


	
  * **dblLongitude**  

   [Longtitude](http://en.wikipedia.org/wiki/Longitude) of position of GPS user. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga) and [$GPGLL](http://aprs.gids.nl/nmea/#gll).


	
  * **flSpeed**  

   Speed of moving, in [knots](http://en.wikipedia.org/wiki/Nautical_mile). NMEA sentence: [$GPRMC](http://aprs.gids.nl/nmea/#rmc) or [$GPVTG](http://aprs.gids.nl/nmea/#vtg).


	
  * **flHeading**  

   Direction in which GPS user is moving, in degrees units with respect to [true north](http://en.wikipedia.org/wiki/True_north). NMEA sentence: [$GPVTG](http://aprs.gids.nl/nmea/#vtg).


	
  * **dblMagneticVariation**  

   Angle between the direction ([bearing](http://en.wikipedia.org/wiki/Bearing_%28navigation%29)) to an object and a reference direction which is [magnetic North](http://en.wikipedia.org/wiki/Magnetic_north). NMEA sentence: [$GPVTG](http://aprs.gids.nl/nmea/#vtg).


	
  * **flAltitudeWRTSeaLevel**  

   [Altitude](http://en.wikipedia.org/wiki/Altitude) with respect to sea level, in meters. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga).


	
  * **flAltitudeWRTEllipsoid**  

   [Altitude](http://en.wikipedia.org/wiki/Altitude) with respect to [WGS84](http://en.wikipedia.org/wiki/WGS) ellipsoid, in meters. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga).


	
  * **FixQuality**  

   Value indicating quality of the [GPS fix](http://www.garmin.com/aboutGPS/glossary.html), which may be unknown, achived with utiliation of GPS or GPS + [DGPS](http://en.wikipedia.org/wiki/DGPS) stations. NMEA sentence: [$GPGGA](http://aprs.gids.nl/nmea/#gga).


	
  * **FixType**  

   Indicates how many satellites were used to calculate user's position: [2D](http://www.garmin.com/aboutGPS/glossary.html) - three satellites or [3D](http://www.garmin.com/aboutGPS/glossary.html) - four or more satellites. NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa).


	
  * **SelectionType**  

   This value relates to **FixType** and says whether [2D](http://www.garmin.com/aboutGPS/glossary.html) or [3D](http://www.garmin.com/aboutGPS/glossary.html) mode is selected automatically or manually. NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa).



Next three parameters describe constellation of satellites used to determine a position and they need longer explanation. This group of values is called as [Dilution of precision](http://en.wikipedia.org/wiki/Dilution_of_precision_%28GPS%29) (DOP) and [every value has it's own name and meaning](https://www.navigator.navy.mil/navigator/dops.htm).




	
  * **flPositionDilutionOfPrecision**  

_Position Dilution Of Precision_ (PDOP). NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa).


	
  * **flHorizontalDilutionOfPrecision**  

_Horizontal Dilution Of Precision_ (HDOP). NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa) or [$GPGGA](http://aprs.gids.nl/nmea/#gga).


	
  * **flVerticalDilutionOfPrecision**  

_Vertical Dilution Of Precision_ (VDOP). NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa).


	
  * **dwSatelliteCount**  

Number of satellites used to determine user's position. NMEA sentence: [$GPGSA](http://aprs.gids.nl/nmea/#gsa).


	
  * **dwSatellitesInView**  

   Number of satellites in view of GPS antena. NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).



Next four members represent arrays with number of elements equal to _GPS_MAX_SATELLITES_ constant.
_GPS_MAX_SATELLITES_ indicates maximum number of GPS satellites used by the GPS Intermediate Driver.




	
  * **rgdwSatellitesUsedPRNs**  

   Array of [Pseudo-Range Noise](http://www.directionsmag.com/article.php?article_id=228) numbers of satellites used to obtain position. Every satellite has its own unique PRN number which is an identifying signature of signal transmitted by each GPS satellite. PRN number is used to identify the particular satellites used to arrive at a position solution. NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).


	
  * **rgdwSatellitesInViewPRNs**  

   Array of _Pseudo-Range Noise_ numbers of satellites in view of GPS antena. NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).


	
  * **rgdwSatellitesInViewElevation**  

   Aray of [elevation](http://en.wikipedia.org/wiki/Elevation) values for all satellites in view,  in degrees, 90 is maximum. NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).


	
  * **rgdwSatellitesInViewAzimuth**  

   Array of values of [azimuth](http://en.wikipedia.org/wiki/Azimuth) from true north for all satellites in view, within range from 000 to 359. NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).


	
  * **rgdwSatellitesInViewSignalToNoiseRatio**  

   Array of values of _Signal to Noise Ratio_ (SNR), also called as signal level, measured in[dB](http://en.wikipedia.org/wiki/Decibel) (0-99). NMEA sentence: [$GPGSV](http://aprs.gids.nl/nmea/#gsa).










Unfortunately, I don't have any device running Windows Mobile 5.0 as well as I don't have Visual Studio 2005, yet.
So, I'm not able to present any working and interesting piece of code but I believe in the near future I will provide some.







I'm strongly curious what are your impressions about GPS Intermediate Driver, its performance and usability.
So, I'm looking forward your comments.






### References





[What's new for developers in Windows Mobile 5.0](http://www.windowsfordevices.com/articles/AT6478846371.html) by Jim Wilson  

[A View of Windows Mobile 5.0 from 10,000 Feet](http://msdn.microsoft.com/library/default.asp?url=/library/en-us/dntake/html/yctiwy_wm5.asp) by Jim Wilson  

[All About GPS](http://www.trimble.com/gps/index.html) by Trimble  

[GPS World](http://www.gpsworld.com) magazine  


