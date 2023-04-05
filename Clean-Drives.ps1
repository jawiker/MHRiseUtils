#Cleans out Xvd and Volume disks.
$devices = Get-PnpDevice | Where-Object {$_.Name -eq "Xvd" -or $_.Name -eq "Volume"}

foreach ($dev in $devices) {

    &"pnputil" /remove-device $dev.InstanceId /force
    &"pnputil" /scan-devices
}