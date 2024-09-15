$Password = Read-Host "Enter the new password" -AsSecureString
$users = Read-Host -Prompt "Number of users"
$c = 0

while ($users -igt $c)
{
    $temp = Read-Host -Prompt "Set User Password Name"
    $UserAccount = Get-LocalUser -Name $temp
    $UserAccount | Set-LocalUser -Password $Password
    $UserAccount | Set-LocalUser
    Set-LocalUser -Name $temp -PasswordNeverExpires $false
    net user $temp /logonpasswordchg:yes
    $c++
}

