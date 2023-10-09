variable "team_id" {
  type = string
}

variable "project_id" {
  type = string
}

variable "project_access" {
  type = object({
    settings = optional(string, "read")
    teams    = optional(string, "none")
  })
}

variable "workspace_access" {
  type = object({
    runs           = optional(string, "read")
    sentinel_mocks = optional(string, "none")
    state_versions = optional(string, "none")
    variables      = optional(string, "none")
    create         = optional(bool, false)
    locking        = optional(bool, false)
    delete         = optional(bool, false)
    move           = optional(bool, false)
    run_tasks      = optional(bool, false)

  })
}