$neovimDir = "$env:LOCALAPPDATA\nvim"

if (!(Test-Path -PathType Container $neovimDir)) {
    Write-Host "Creating directory $neovimDir"
    New-Item -ItemType Directory -Force -Path $neovimDir | Out-Null
}

Write-Host "Copying .vim files to $neovimDir"
Copy-Item -Path ".\*" -Destination $neovimDir -Recurse -Include ".lua"

& git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

if (!(Get-Command "nvim" -errorAction SilentlyContinue)) {
    Write-Host "Neovim is not added to PATH, cannot install plugins"
    exit 1
}

& nvim -c "PackerSync"

Write-Host "Script finished"

exit 0
