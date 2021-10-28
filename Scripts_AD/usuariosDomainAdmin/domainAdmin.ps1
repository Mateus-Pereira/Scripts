Clear-Host

(Get-ADGroupMember "Domain Admins" | Where-Object { $_.ObjectClass -eq "user" }).count
(Get-ADGroupMember "Domain Admins" | Where-Object { $_.ObjectClass -ne "user" }).count





# $users = Get-ADGroupMember "Domain Admins"
# $countuser = 0
# $countobj = 0
# foreach($user in $users)
# {

#     $user.name
#     $tipo = (Get-ADObject $key).ObjectClass
   
#     Switch ($tipo)
#     {
#         "user"{$countuser++;Break}

#         default {$countobj++}


#     }

# }
# #write-host $user.name "-" (Get-ADObject $key).ObjectClass
# write-host "Tottal de users:" $countuser
# write-host "Tottal de objetos desconhecidos:" $countobj
