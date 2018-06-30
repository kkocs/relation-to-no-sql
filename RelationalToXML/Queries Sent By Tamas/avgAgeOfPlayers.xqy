let $ages := for $x in doc("file.xml")/esport/teams/team
return 
    for $y in $x/players/player
    return data($y/age)
return avg($ages)