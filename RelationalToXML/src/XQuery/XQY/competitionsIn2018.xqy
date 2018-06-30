for $x in doc("file.xml")/esport/contests/contest
where "2018" = substring(data($x/startDate),1,4)
return <li>{data($x/location/locationName)}</li>