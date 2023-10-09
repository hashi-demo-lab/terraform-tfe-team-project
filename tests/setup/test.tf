resource "tfe_project" "test" {
  name         = "tftest-project"
  organization = var.organization
}

resource "tfe_team" "test" {
  name         = "tftest-team"
  organization = var.organization
}