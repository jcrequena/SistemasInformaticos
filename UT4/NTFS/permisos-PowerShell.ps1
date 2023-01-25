#Escenario:
  #Nombre del equipo: Cliente-VPN
  #usuario: jcrequena

#Get Folder for modify permisssions
$Path = "C:\Publico"

#Check if the directory exists. If it doesn't exist, we create it.
IF (!(test-path $Path))
{
   New-Item -Path $Path -type directory -Force
}

# Get ACL on Folder
$GetACL = Get-Acl $Path

# Set up AccessRule
$accessControlType=[System.Security.AccessControl.AccessControlType]::Allow 
$objectUG=New-Object System.Security.Principal.NTAccount("Cliente-VPN\DepLogistica") 
$Allinherit = [system.security.accesscontrol.InheritanceFlags]"ContainerInherit, ObjectInherit"
$Allpropagation = [system.security.accesscontrol.PropagationFlags]"None"
$Permissions = [System.Security.AccessControl.FileSystemRights]"Read,Write"

$AccessRule = New-Object system.security.AccessControl.FileSystemAccessRule($objectUG, $Permissions, $AllInherit, $Allpropagation, $accessControlType)
# Check if Access Already Exists
if ($GetACL.Access | Where { $_.IdentityReference -eq $objectUG}) {
  Write-Host "Modifying Permissions For: $objectUG" -ForeGroundColor Yellow
  $AccessModification = New-Object system.security.AccessControl.AccessControlModification
  $AccessModification.value__ = 2
  $Modification = $False
  $GetACL.ModifyAccessRule($AccessModification, $AccessRule, [ref]$Modification) | Out-Null
} else {
      Write-Host "Adding Permission: $Permission For: $objectUG"
      $GetACL.AddAccessRule($AccessRule)
}
Set-Acl -aclobject $GetACL -Path $Path
Write-Host "Permission: $Permission Set For: $objectUG" -ForeGroundColor Green

