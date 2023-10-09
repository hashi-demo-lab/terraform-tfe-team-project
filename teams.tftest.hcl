# file_count.tftest.hcl

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
}

/* run "verify" {
  # Load and count the objects created in the "execute" run block.
} */
