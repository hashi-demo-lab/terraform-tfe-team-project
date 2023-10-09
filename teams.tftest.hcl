variables {
  project_id = ""
  team_id    = ""

  project_access = {
    settings = "read"
    teams    = "none"
  }
  workspace_access = {

    runs           = "read"
    sentinel_mocks = "none"
    state_versions = "none"
    variables      = "none"
    create         = false
    locking        = false
    delete         = false
    move           = false
    run_tasks      = false

  }

}

provider "tfe" {
  organization = "hashi-demos-apj"
}

run "setup" {
  module {
    source = "./tests/setup"
  }
}

run "execute" {
  variables {
    project_id = run.setup.tfe_project_id
    team_id    = run.setup.tfe_team_id
  }

  command = apply

}

run "verify" {
  # Load and count the objects created in the "execute" run block.
  variables {
    project_id = run.setup.tfe_project_id
    team_id    = run.setup.tfe_team_id
  }
  
  assert {
    condition     = tfe_team_project_access.custom.access == "custom"
    error_message = "access type did not match expected - custom"
  }

   assert {
    condition     = tfe_team_project_access.custom.project_access[0].settings == "read"
    error_message = "access type did not match expected - read"
  }

   assert {
    condition     = tfe_team_project_access.custom.project_access[0].teams == "none"
    error_message = "access type did not match expected - read"
  }
}
