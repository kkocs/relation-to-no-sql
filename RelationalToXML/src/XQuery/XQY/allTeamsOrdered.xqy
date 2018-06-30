for $x in doc("file.xml")/esport/teams/team
order by data($x/teamName)
return <li>{data($x/teamName)}</li>