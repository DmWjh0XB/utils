<#
Create a user list (username;firstname;lastname;department;password) from a list (firstname;lastname;department)
#>
$usr_list = @(); $usr_count = @{}; $mdp_pattern = @("0","0","1","1","2","2","2","2");
$mdp_maps = @{"0" = @("A","Z","E","R","T","Y","U","I","O","P","Q","S","D","F","G","H","J","K","L","M","W","X","C","V","B","N");"1"= @("1","2","3","4","5","6","7","8","9");"2"= @("a","z","e","r","t","y","u","i","o","p","q","s","d","f","g","h","j","k","l","m","w","x","c","v","b","n")};

foreach($ligne in Get-Content "C:\script\liste-utilisateurs.csv") {
    # Match line without comment before
    if($ligne –match '^[^#](.*);(.*);(.*)$') {
    	# is the department already in the count list if no = 1
        if ($matches[3] -notin $usr_count.Keys){ $usr_count[$matches[3]] = 1; } else{ $usr_count[$matches[3]] += 1; }
        # generate password every user containing 020 in the userame with hardcode password => rule from the exercice in other case generate random password of 8 char in random position with 2 uppercase, 2 lowercase, 4 cipher
        $password = if (($matches[3][0]+$matches[3][-1]+([String]($usr_count[$matches[3]])).PadLeft(4,"0")).Contains("020")) {("P","@","s","s","w","0","r","d") } else {(($mdp_pattern | % {($mdp_maps[$_][(Get-Random -Maximum $mdp_maps[$_].Length)])}) | Sort-Object {Get-Random})};
        # add the row formated to the list
        $usr_list +=  ($matches[3][0]+$matches[3][-1]+([String]($usr_count[$matches[3]])).PadLeft(4,"0") + ";" + [system.String]::Join("", $password) + ';'+ $matches[0]); 
    }
 }
 
# show result 
Write-Output $usr_list;
