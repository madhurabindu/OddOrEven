param($linerate)

[xml]$doc = Get-Content -Path UnitTestProject\TestResults\*\coverage.cobertura.xml
Write-Host "---------------------------------"
Write-Host "Code Coverage report ..." 
Write-Host "---------------------------------"

Write-Host ""
Write-Host "---------------------------------"
Write-Host "Code Coverage report Analysis..." 
Write-Host "---------------------------------"

$result = 0

Write-Host "Line-Coverage: ["$doc.coverage.'line-rate'"] Branch-Coverage: ["$doc.coverage.'branch-rate'"]"
Write-Host ""
 foreach ($pkg in $doc.coverage.packages.package) {
    Write-Host "Package:"  $pkg.name "Line-Coverage:"$pkg.'line-rate'

    if($pkg.'line-rate' -le $linerate){
        $result= 1
       }
    }

if($result -eq 1){
    Write-Host "Coverage Check: failed" -ForegroundColor red 
}
else{
    Write-Host "Coverage Check: Passed" -ForegroundColor green 
}
exit $result
