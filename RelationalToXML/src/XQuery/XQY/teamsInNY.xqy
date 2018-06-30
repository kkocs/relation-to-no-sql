for $x in doc("file.xml")/esport/contests/contest
where $x/location/locationName="New York"
return <h1>{
    for $y in data($x/participantTeamsCodes/participantTeamsCode)
    return <li>{
        for $z in doc("file.xml")/esport/teams/team
        where data($z/teamCode) = $y
        return data($z/teamName)
    }</li>
}</h1>

