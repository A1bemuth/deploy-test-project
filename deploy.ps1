$sourcePath = 'ContosoUniversity\'
$destination = '.deploy'

$foldersToCopy = @('bin', 'Content', 'fonts', 'Scripts', 'Views')
$filesToCopy = @('favicon.ico', 'Global.asax', 'packages.config', 'Web.config.template')

if(Test-Path $destination){
    Remove-Item $destination -Recurse
}
New-Item -Name $destination -ItemType Directory

foreach($folder in $foldersToCopy){
    Copy-Item ($sourcePath + $folder) ($destination) -Recurse
}
foreach($file in $filesToCopy){
    Copy-Item ($sourcePath + $file) ($destination+ '\' +$file -replace '\.template')
}