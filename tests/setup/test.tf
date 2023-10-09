resource "tfe_project" "test" {
  name         = "tftest-project"
  organization = "hashi-demo-apj"
}

resource "tfe_team" "test" {
  name         = "tftest-team"
  organization = "hashi-demo-apj"
}