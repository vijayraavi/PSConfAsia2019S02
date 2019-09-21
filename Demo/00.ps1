# terminating / non-terminating

$Error.Clear()

try {
    Get-Item -Path c:\Windows
}
catch {
    'no biggie!'
}

# be aware of error that are terminating and which are not, do not assume!

try {
    Get-Item -Path c:\Windows -ErrorAction Stop
}
catch {
    'no biggie!'
}

# investigate error
$error[0]
$error[0] | Select-Object *


# catch specific errors to handle other code paths

try {
    Get-Item -Path c:\Windows -ErrorAction Stop
}
catch [System.Management.Automation.DriveNotFoundException] {
    'Are you running on Mac?'
}
catch {
    'no biggie!'
}
