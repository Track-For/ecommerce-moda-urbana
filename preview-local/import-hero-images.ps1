Add-Type -AssemblyName System.Drawing
$entries = Get-Content -LiteralPath 'preview-local/artifacts/hero-official-sources.json' -Raw | ConvertFrom-Json
$encoder = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq 'image/jpeg' }
foreach ($entry in $entries) {
  $source = [System.Drawing.Image]::FromFile($entry.source)
  $width = if ($entry.name -like '*mobile*') { 820 } else { 1580 }
  $height = if ($entry.name -like '*mobile*') { 1000 } else { 600 }
  $bitmap = New-Object System.Drawing.Bitmap($width, $height)
  $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
  $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
  $graphics.DrawImage($source, 0, 0, $width, $height)
  $parameters = New-Object System.Drawing.Imaging.EncoderParameters(1)
  $parameters.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]95)
  $destination = Join-Path (Get-Location) ('static/images/hero/' + $entry.name + '.jpg')
  $bitmap.Save($destination, $encoder, $parameters)
  $parameters.Dispose()
  $graphics.Dispose()
  $bitmap.Dispose()
  $source.Dispose()
  Write-Output ('Imported: ' + $entry.name)
}
