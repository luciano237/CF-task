provider "null" {}

resource "null_resource" "compliance_remediation" {
  triggers = {
    # Trigger the resource whenever changes are needed
    timestamp = timestamp()
  }

  # Use remote-exec provisioner to execute PowerShell scripts on the bastion1 host
  provisioner "remote-exec" {
    inline = [
      # Run PowerShell scripts to configure GPOs for compliance
      "powershell.exe -ExecutionPolicy Bypass -File ${path.module}/scripts/apply_gpos.ps1",
    ]
  }
}

# Display the success message
output "success_message" {
  value = "Compliance remediation scripts executed successfully."
}


# Apply GPO settings for compliance remediation

# Configure 'Deny access to this computer from the network' for Guests, Local account, and Administrators group

# secedit /configure /db $env:SystemRoot/security/new.sdb /cfg ${path.module}/gpos/security_policy.inf /areas SECURITYPOLICY

# Configure Attack Surface Reduction (ASR) rules

# $asrRules = @(
#   "26190899-1602-49e8-8b27-eb1d0a1ce869"
  # Add more ASR rules if needed
# )

# $asrRules | ForEach-Object {
#   $ruleId = $_
#   $ruleState = "2"  # Set to '2' to enable the rule

  # Set the state for each ASR rule

#   Set-MpPreference -AttackSurfaceReductionRules_Ids @{Add=$ruleId}
#   Set-MpPreference -AttackSurfaceReductionRules_Actions @{Add=$ruleState}
# }
