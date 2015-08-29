$brood = "hatchery/my-brood"
$is_github = $true

function getRepo() {
  return "https://raw.githubusercontent.com/" + $script:brood + "/master"
}

function printHeader() {
    Write-Host "############################################################"
    Write-Host "This could take some time, please don't close this window..."
    Write-Host "############################################################"
}

function printForYNResponse($prompt){
    $gotAnswer = $false
    while (-not $gotAnswer) {
        $answer = Read-Host $prompt
        if (($answer -eq "y") -Or ($answer -eq "n")) {
            $gotAnswer = $true
        }
    }
    
    if ($answer -eq "y") {
        return $true
    }
    else {
        return $false
    }
}

function getAssets() {
    $script:downloader.DownloadFile($puppet, $($env:temp + "\brood\puppet.msi"))
    $script:downloader.DownloadFile($manifest, $($env:temp + "\brood\site.pp"))
}

function setupDownloader() {
    $script:downloader = New-Object System.Net.WebCLient
    $script:downloader.UseDefaultCredentials = $true
}


function setupProxy() {
    $hasProxy = printForYNResponse "Do you have a HTTP proxy? [y/N]: "
    if ($hasProxy) {
      $proxyAddress = Read-Host -Prompt "Enter the proxy address:port without http:// "
      $proxy = New-Object System.Net.WebProxy($proxyAddress, $true)
      $proxyNeedsAuth = printForYNResponse "Does your proxy need Auth? [y/N]: "
      
      if ($proxyNeedsAuth) {
        $proxyUser = Read-Host -Prompt "Enter the user name for the proxy: "
        $proxyPass = Read-Host -Prompt "Enter the password for the proxy: " -AsSecureString
        $proxy.Credentials = New-Object System.Management.Automation.PSCredential($proxyUser, $proxyPass)
      }
      
      $script:downloader.Proxy = $proxy
    }
}

function installPuppet() {
    msiexec /qn /i $($env:temp + "\brood\puppet.msi")
}

function printExit() {
    Write-Host "########################################################"
    Write-Host "Everything is complete. It is safe to close this window."
    Write-Host "########################################################"
}



##### MAIN SCRIPT BODY ######

printHeader
$repo = getRepo
$manifest = $repo + "/manifests/site.pp"
$puppet = "https://downloads.puppetlabs.com/windows/puppet-" + $puppet_version + ".msi"
setupDownloader
setupProxy
getAssets
installPuppet
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
puppet module install dna-abathur
puppet apply $($env:temp + "\brood\site.pp")
printExit
