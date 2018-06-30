for $x in doc("file.xml")/esport/teams/team
return <li><p>{data($x/manager/name)} - {data($x/teamName)}</p></li>