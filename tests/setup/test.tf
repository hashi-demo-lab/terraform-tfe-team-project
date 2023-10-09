resource "tfe_project" "test" {
  name         = "tftest-project"
  organization = "hashi-demos-apj"
}

resource "tfe_team" "test" {
  name         = "tftest-team"
  organization = "hashi-demos-apj"
}