# Create nvim directory if it does not exist

$neovimDir = "$env:LocalAppdata\nvim"

if (!(Test-Path -PathType Container $neovimDir)) {
    Write-Host "Creating directory $neovimDir"
    New-Item -ItemType Directory -Force -Path $neovimDir | Out-Null
}

# Copy .vim files

Write-Host "Copying .vim files to $neovimDir"
Copy-Item -Path ".\*" -Destination $neovimDir -Recurse -Include "*.vim"

# Create autoload\plug.vim if it does not exist

$autoloadPlug = "$env:LocalAppdata\nvim\autoload\plug.vim"

if (!(Test-Path $autoloadPlug)) {
    Write-Host "Creating autoload\plug.vim"

    mkdir ~\AppData\Local\nvim\autoload | Out-Null

    $uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    (New-Object Net.WebClient).DownloadFile(
        $uri,
        $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
            $autoloadPlug
        )
    )
}

# Check if NodeJS exists, since it is a dependency for CoC

if (!(Get-Command "node" -errorAction SilentlyContinue)) {
    # TODO: automate installing NodeJS
    Write-Host "NodeJS is not installed, please download it and try again: https://nodejs.org/en/"
    exit 1
}

# Install plugins

& nvim -c "PlugInstall"

Write-Host "--- Script finished ---"

exit 0
