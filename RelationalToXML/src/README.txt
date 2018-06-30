

Megoldás Magyarázása Dátumok Feldolgozásához
------------------------------------------------------------
Mivel alapértelmezetten a dátumok megjelenítése nem támogatott a Marshall osztály által,
ezért szükségünk van egy saját XmlAdapter  származtatott osztály létrehozására, esetünkben a (DataAdapter).

Ennek elvégzéséhez az alábbi példából indultunk ki:
https://gist.github.com/troyharvey/1181290

Létrehozás után a model osztályokkal azonos csomagba helyeztünk package-info.java leíróállományokat amelyben meghatároztuk
 hogy a Date osztályokat a marshaller objektum a DataAdapter segítségével kezelje. 
------------------------------------------------------------
Egy másik példa, általunk nem használt:
http://blog.bdoughan.com/2011/05/jaxb-and-joda-time-dates-and-times.html