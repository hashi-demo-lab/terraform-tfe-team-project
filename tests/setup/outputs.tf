output "tfe_organization" {
  value = tfe_project.test.organization
}

output "tfe_project_id" {
  value = tfe_project.test.id
}

output "tfe_project_name" {
  value = tfe_project.test.name
}

output "tfe_team_id" {
  value = tfe_team.test.id
}

output "tfe_team_name" {
  value = tfe_team.test.name
}

output "tfe_team_sso_team_id" {
  value = tfe_team.test.sso_team_id
}

output "tfe_team_visibility" {
  value = tfe_team.test.visibility
}