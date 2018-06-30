let $max := (
    for $x in doc("file.xml")
    return max(
        for $y in $x/esport/contests/contest/participantTeamsCodes
        return count($y/participantTeamsCode)
    ))

for $z in doc("file.xml")/esport/contests/contest
where count($z/participantTeamsCodes/participantTeamsCode) = $max
return data($z/location/locationName)