

Megold�s Magyar�z�sa D�tumok Feldolgoz�s�hoz
------------------------------------------------------------
Mivel alap�rtelmezetten a d�tumok megjelen�t�se nem t�mogatott a Marshall oszt�ly �ltal,
ez�rt sz�ks�g�nk van egy saj�t XmlAdapter  sz�rmaztatott oszt�ly l�trehoz�s�ra, eset�nkben a (DataAdapter).

Ennek elv�gz�s�hez az al�bbi p�ld�b�l indultunk ki:
https://gist.github.com/troyharvey/1181290

L�trehoz�s ut�n a model oszt�lyokkal azonos csomagba helyezt�nk package-info.java le�r��llom�nyokat amelyben meghat�roztuk
 hogy a Date oszt�lyokat a marshaller objektum a DataAdapter seg�ts�g�vel kezelje. 
------------------------------------------------------------
Egy m�sik p�lda, �ltalunk nem haszn�lt:
http://blog.bdoughan.com/2011/05/jaxb-and-joda-time-dates-and-times.html