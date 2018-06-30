let $teamID := (
    for $x in doc("file.xml")/esport/teams/team
    where index-of((
        for $y in $x/players/player
        return $y/name
    ),"Roger") > 0
    return data($x/teamCode)
)

for $x in doc("file.xml")/esport/contests/contest
where index-of((
    for $y in $x/participantTeamsCodes/participantTeamsCode
    return data($y)
), $teamID) > 0
return data($x/location/locationName)

