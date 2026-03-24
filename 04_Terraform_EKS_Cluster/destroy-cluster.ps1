# Stop execution on error
$ErrorActionPreference = "Stop"

Write-Host "==============================="
Write-Host "STEP-1: Destroy EKS Cluster"
Write-Host "==============================="

Set-Location "02_EKS_terraform-manifests"
terraform destroy -auto-approve

Write-Host ""
Write-Host "🧹 Cleaning up local Terraform cache..."

Remove-Item -Recurse -Force ".terraform" -ErrorAction SilentlyContinue
Remove-Item -Force ".terraform.lock.hcl" -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "==============================="
Write-Host "STEP-2: Destroy VPC"
Write-Host "==============================="

Set-Location "..\01_VPC_terraform-manifests"
terraform destroy -auto-approve

Write-Host ""
Write-Host "🧹 Cleaning up local Terraform cache..."

Remove-Item -Recurse -Force ".terraform" -ErrorAction SilentlyContinue
Remove-Item -Force ".terraform.lock.hcl" -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "✅ EKS Cluster and VPC destroyed and cleaned up successfully!"