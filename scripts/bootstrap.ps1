# Variables
$puppet_version = "3.7.3"

function getRepo() {
  return "https://github.com/hatchery/my-brood"
}

function printHeader() {
}

function printForYNResponse(){
}

function getAssets() {
}

function setupProxy() {
}


printHeader
$repo = getRepo
$brood = $repo + "/manifests/site.pp"
$puppet = "https://downloads.puppetlabs.com/windows/puppet-" + $puppet_version + ".msi"

# Setup Downloader
$downloader = New-Object System.Net.WebCLient
$downloader.UseDefaultCredentials = $true

## Setup Proxy
$hasProxy = printForYNResponse "Do you have a HTTP proxy? [y/N]: "
if ($hasProxy) {
  $proxyAddress = Read-Host -Prompt "Enter the proxy address:port without http:// "
  $proxy = New-Object System.Net.WebProxy($proxyAddress, $true)
  $proxyNeedsAuth = printForYNResoinse "Does your proxy need Auth? [y/N]: "
  
  if ($proxyNeedsAuth) {
    $proxyUser = Read-Host -Prompt "Enter the user name for the proxy: "
    $proxyPass = Read-Host -Prompt "Enter the password for the proxy: " -AsSecureString
    $proxy.Credentials = New-Object System.Management.Automation.PSCredential($proxyUser, $proxyPass)
  }
  
  $downloader.Proxy = $proxy
}

# Somewhere here, need to set env vars

$downloader.DownloadFile($puppet, $($env:temp + "\brood\puppet.msi"))
$downloader.DownloadFile($brood, $($env:temp + "\brood\site.pp")
msiexec /qn /i $($env:temp + "\brood\puppet.msi")

# Update environment variables or call the script again in a new powershell or something

puppet module install dna-abathur
puppet apply $($env:temp + "\brood\site.pp")
abathur
