output "container_repositories" {
  description = "Container repositories information indexed by their key"
  value = {
    for k, repo in oci_artifacts_container_repository.this : k => {
      compartment_id       = repo.compartment_id
      id                   = repo.id
      display_name         = repo.display_name
      is_immutable         = repo.is_immutable
      is_public            = repo.is_public
      readme               = repo.readme
      billable_size_in_gbs = repo.billable_size_in_gbs
      image_count          = repo.image_count
      layer_count          = repo.layer_count
      layers_size_in_bytes = repo.layers_size_in_bytes
      namespace            = repo.namespace
      state                = repo.state
      system_tags          = repo.system_tags
      created_by           = repo.created_by
      time_created         = repo.time_created
      time_last_pushed     = repo.time_last_pushed
      defined_tags         = repo.defined_tags
      freeform_tags        = repo.freeform_tags
    }
  }
}