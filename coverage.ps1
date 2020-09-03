
Write-Host "Start" 
[xml]$doc = Get-Content -Path C:\Codebase\Philips\BootcampRepositories\OddOrEven\UnitTestProject\TestResults\7e105305-04a1-445b-931c-99c883232a3a\coverage.cobertura.xml


$result = 1

Write-Host "Line Coverage: ["$doc.coverage.'line-rate'"] Branch Coverage: ["$doc.coverage.'branch-rate'"]"
Write-Host ""
 foreach ($pkg in $doc.coverage.packages.package) {
    Write-Host "Package:"  $pkg.name "Line Coverage:["$pkg.'line-rate'"]"

    if($pkg.'line-rate' -ne 1){
        $result= 0
       }
    }
Write-Host "ExitCode:" $result
 exit $result
