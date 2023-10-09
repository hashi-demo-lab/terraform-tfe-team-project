
resource "tfe_team_project_access" "custom" {
  access     = "custom"
  team_id    = var.team_id
  project_id = var.project_id

  project_access {
    settings = try(var.project_access.settings, "read")
    teams    = try(var.project_access.teams, "none")
  }

  workspace_access {
    runs           = try(var.workspace_access.runs, "read")
    sentinel_mocks = try(var.workspace_access.sentinel_mocks, "none")
    state_versions = try(var.workspace_access.state_versions, "none")

    variables = try(var.workspace_access.variables, "none")
    create    = try(var.workspace_access.create, false)
    locking   = try(var.workspace_access.locking, false)
    delete    = try(var.workspace_access.delete, false)
    move      = try(var.workspace_access.move, false)
    run_tasks = try(var.workspace_access.run_tasks, false)
  }
}