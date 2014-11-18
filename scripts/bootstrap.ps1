# URLS

$puppet = "https://downloads.puppetlabs.com/windows/puppet-latest.msi"

function printHeader() {
}

function printForYNResponse(){
}


printHeader

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
msiexec /qn /i $($env:temp + "\brood\puppet.msi")

puppet module install ruby
puppet module install git
gem install librarian-puppet
# git clone here

