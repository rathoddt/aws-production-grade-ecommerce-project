$ErrorActionPreference = "Stop"

function Run-Terraform($path) {
    if (-Not (Test-Path $path)) {
        throw "Directory not found: $path"
    }

    Set-Location $path
    terraform init
    terraform apply -auto-approve
}

Write-Host "STEP-1: Create VPC"
Run-Terraform "01_VPC_terraform-manifests"

Write-Host "STEP-2: Create EKS Cluster"
Run-Terraform "..\02_EKS_terraform-manifests"

cd ..
Write-Host "✅ Completed successfully!"