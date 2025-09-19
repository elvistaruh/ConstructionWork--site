Param()

$ErrorActionPreference = "Stop"
# Ensure TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$PSScriptRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
$img = Join-Path $PSScriptRoot "assets/img"
New-Item -ItemType Directory -Force -Path $img | Out-Null

$headers = @{
  "User-Agent" = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0 Safari/537.36"
  "Accept"     = "*/*"
  "Referer"    = "https://unsplash.com/"
}

$photos = @{
  "hero.jpg"                = "https://unsplash.com/photos/cKjaZ68gSrc/download?force=true";
  "service-design.jpg"      = "https://unsplash.com/photos/m9qMoh-scfE/download?force=true";
  "service-supervision.jpg" = "https://unsplash.com/photos/r5BOfNgTVxo/download?force=true";
  "service-construction.jpg"= "https://unsplash.com/photos/xeF8HHExwHU/download?force=true";
  "service-green.jpg"       = "https://unsplash.com/photos/73JOOymZQTQ/download?force=true";
  "about-bg.jpg"            = "https://unsplash.com/photos/NxtKALyY6po/download?force=true";
  "offices-bg.jpg"          = "https://unsplash.com/photos/866LKn6Uc-o/download?force=true";
}

function Download-File($url, $outPath) {
  $max = 3
  for($i=1; $i -le $max; $i++){
    try{
      Invoke-WebRequest -Uri $url -Headers $headers -MaximumRedirection 5 -OutFile $outPath
      if(Test-Path $outPath){ return }
    } catch {
      if($i -eq $max){ throw $_ }
      Start-Sleep -Seconds 2
    }
  }
}

foreach($kvp in $photos.GetEnumerator()){
  $name = $kvp.Key
  $url  = $kvp.Value
  Write-Host "Downloading $name ..."
  $dest = Join-Path $img $name
  Download-File $url $dest
}

Write-Host "Done."
