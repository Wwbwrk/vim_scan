# msvc.ps1

# set VS2022 environment for cl.exe (compiler)/nmake.exe (build) using CMD.exe for PowerShell
# https://learn.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170
# https://stackoverflow.com/questions/2124753/how-can-i-use-powershell-with-the-visual-studio-command-prompt

# set MSVS Build Directory
$vsbuild = "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build"

pushd $vsbuild
#clear

# run .bat (for x64 arch) in command line then use SET command to show all environment variables
#   and convert to environment variables in Powershell
#cmd /c "vcvarsall.bat x64&set" | foreach {
cmd /c "vcvarsall.bat x86&set" | foreach {
  $_
  if ($_ -match "=") {
    $v = $_.split("=", 2); set-item -force -path "ENV:\$($v[0])"  -value "$($v[1])"
  }
}

popd

#write-Host "`nVisual Studio 2022 Command Prompt variables set." -ForegroundColor Yellow
echo "`nVisual Studio 2022 Command Prompt variables set."


