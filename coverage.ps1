param($linerate)

function WriteXmlToScreen ([xml]$xml)
{
    $StringWriter = New-Object System.IO.StringWriter;
    $XmlWriter = New-Object System.Xml.XmlTextWriter $StringWriter;
    $XmlWriter.Formatting = "indented";
    $xml.WriteTo($XmlWriter);
    $XmlWriter.Flush();
    $StringWriter.Flush();
    Write-Output $StringWriter.ToString();
}

Write-Host "---------------------------------"
Write-Host "Code Coverage report ..." 
Write-Host "---------------------------------"
[xml]$doc = Get-Content -Path UnitTestProject\TestResults\*\coverage.cobertura.xml

WriteXmlToScreen $doc

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
    Write-Host "Coverage Check: Passed" -ForegroundColor green 
}
else{
    Write-Host "Coverage Check: failed" -ForegroundColor red 
}
exit $result
