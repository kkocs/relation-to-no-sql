for $x in doc("C://EGYETEM//Otodik felev//Tevezoi es fejlesztoi kornyezetek//kkim1438//RelationalToXml//file.xml")/esport/contests/contest
where $x/location/locationName="New York"
return <h1>
         {for $b in data($x//participantTeamsCodes/participantTeamsCode)
         return <li>{$b}</li>}
		</h1>

