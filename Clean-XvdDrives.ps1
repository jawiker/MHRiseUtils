#Just cleans out xvd disks that can cause MH Rise to Crash.
$devices = Get-PnpDevice | Where-Object {$_.Name -eq "Xvd"}

foreach ($dev in $devices) {

    &"pnputil" /remove-device $dev.InstanceId /force
    &"pnputil" /scan-devices
}