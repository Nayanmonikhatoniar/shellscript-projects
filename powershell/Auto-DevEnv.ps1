# Auto-DevEnv.ps1
# Author: YourName
# Description: Automates Git project setup with PowerShell

# Prompt project name
$projectName = Read-Host "📁 Enter your new project name"
$projectPath = Join-Path -Path (Get-Location) -ChildPath $projectName

# Create folder
New-Item -ItemType Directory -Path $projectPath -Force | Out-Null
Set-Location $projectPath

# Create README
"# $projectName`n`nCreated with Auto-DevEnv.ps1" | Out-File "README.md"
Write-Host "✅ README.md created"

# Initialize Git
git init | Out-Null
Write-Host "✅ Git initialized"

# Optional .gitignore
$addGitignore = Read-Host "➕ Add a .gitignore file? (y/n)"
if ($addGitignore -eq "y") {
    "# Ignore Python cache`n__pycache__/" | Out-File ".gitignore"
    Write-Host "📄 .gitignore added"
}

# Optional LICENSE
$addLicense = Read-Host "➕ Add an MIT License? (y/n)"
if ($addLicense -eq "y") {
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/github/choosealicense.com/gh-pages/_licenses/mit.txt" -OutFile "LICENSE"
    Write-Host "📜 MIT License added"
}

# Commit changes
git add .
git commit -m "Initial commit" | Out-Null
Write-Host "📌 Git commit complete"

# Optional GitHub Push
$pushGithub = Read-Host "🚀 Push to GitHub using GitHub CLI? (y/n)"
if ($pushGithub -eq "y") {
    gh repo create $projectName --public --source=. --remote=origin --push
    Write-Host "☁️ Repo pushed to GitHub!"
} else {
    Write-Host "✅ Local project setup complete!"
}
