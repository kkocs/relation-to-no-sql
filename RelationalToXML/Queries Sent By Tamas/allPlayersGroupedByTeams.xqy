for $x in doc("file.xml")/esport/teams/team
return <body> <h1>{data($x/teamName)}</h1> {
    for $y in $x/players/player
    return <li>{data($y/name)}</li>
} </body>