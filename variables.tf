variable "global_compartment_id" {
  description = "Compartment OCID used by every repository that does not set its own compartment_id"
  type        = string
  default     = null
}

variable "repositories" {
  description = "Container repositories to create, keyed by repository name unless display_name is set"
  type = map(object({
    compartment_id = optional(string)
    display_name   = optional(string)
    defined_tags   = optional(map(string))
    freeform_tags  = optional(map(string))
    is_immutable   = optional(bool, false)
    is_public      = optional(bool, false)
    readme = optional(object({
      content = string
      format  = string
    }))
  }))
}
