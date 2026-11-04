module "ocir" {
  source = "../.."

  global_compartment_id = var.compartment_id

  repositories = {
    "acme/api" = {
      is_immutable = true
    }
    "acme/web" = {
      readme = {
        format  = "TEXT_MARKDOWN"
        content = "Web frontend images"
      }
    }
  }
}

output "repository_ids" {
  value = { for k, r in module.ocir.container_repositories : k => r.id }
}
