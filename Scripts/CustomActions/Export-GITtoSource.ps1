Load-ModelTools -SetupParameters $SetupParameters
$ObjectFileName = (Join-Path $SetupParameters.workFolder 'Source.txt')
if (Test-Path $ObjectFileName)
{
    Remove-Item -Path $ObjectFileName  -Force
}
$ObjectsPath = Build-Solution -SetupParameters $SetupParameters -BranchSettings $BranchSettings -ObjectsPath $SetupParameters.ObjectsPath
Join-NAVApplicationObjectFile -Source (Join-Path $ObjectsPath '*.txt') -Destination $ObjectFileName -Force
UnLoad-ModelTools
