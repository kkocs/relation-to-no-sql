for $x in doc("file.xml")/esport/contests/contest
return <li>{data($x/location/locationName)}</li>