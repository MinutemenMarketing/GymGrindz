# Minimal static file server for local preview (no Node/Python required).
# Usage: powershell -NoProfile -ExecutionPolicy Bypass -File serve.ps1
$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$port = 8412
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:$port/")
$listener.Start()
Write-Output "Serving $root at http://localhost:$port/"

$mime = @{
  ".html" = "text/html; charset=utf-8"
  ".css"  = "text/css; charset=utf-8"
  ".js"   = "application/javascript; charset=utf-8"
  ".svg"  = "image/svg+xml"
  ".jpg"  = "image/jpeg"
  ".png"  = "image/png"
  ".ico"  = "image/x-icon"
  ".webmanifest" = "application/manifest+json"
}

while ($listener.IsListening) {
  $context = $listener.GetContext()
  $reqPath = $context.Request.Url.AbsolutePath.TrimStart("/")
  if ([string]::IsNullOrEmpty($reqPath)) { $reqPath = "index.html" }
  $file = Join-Path $root $reqPath
  try {
    if (Test-Path $file -PathType Leaf) {
      $bytes = [System.IO.File]::ReadAllBytes($file)
      $ext = [System.IO.Path]::GetExtension($file).ToLower()
      if ($mime.ContainsKey($ext)) { $context.Response.ContentType = $mime[$ext] }
      $context.Response.ContentLength64 = $bytes.Length
      $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    } else {
      $context.Response.StatusCode = 404
      $msg = [System.Text.Encoding]::UTF8.GetBytes("404 - not found: /$reqPath")
      $context.Response.OutputStream.Write($msg, 0, $msg.Length)
    }
  } catch {
    $context.Response.StatusCode = 500
  } finally {
    $context.Response.OutputStream.Close()
  }
}
