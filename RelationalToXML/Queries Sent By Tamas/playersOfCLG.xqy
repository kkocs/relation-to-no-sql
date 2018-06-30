for $x in doc("file.xml")/esport/teams/team
where $x/teamName = "CLG"
return <h1>{
    for $y in $x/players/player/name
    return <li>{data($y)}</li>
}</h1>