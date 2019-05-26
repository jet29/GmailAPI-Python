$taskTime = $args[0]

$action = New-ScheduledTaskAction -Execute 'C:\Users\AlchenTheCat\AppData\Local\Programs\Python\Python37-32\python.exe' -Argument 'C:\Users\AlchenTheCat\Documents\Python\GmailAPI\quickstart.py'
#$action = New-ScheduledTaskAction -Execute 'Powershell.exe'

$trigger =  New-ScheduledTaskTrigger -Once -At $taskTime

$taskName = "EnviarMensaje"
$taskDesc= "Envio un mensaje pst!"

$exists = Get-ScheduledTask | Where-Object {$_.TaskName -like $taskName}

if($exists)
{
    Unregister-ScheduledTask -TaskName $taskName
}

Register-ScheduledTask -Action $action -Trigger $trigger -TaskName $taskName -Description $taskDesc