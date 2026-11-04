resource "oci_artifacts_container_repository" "this" {
  for_each = var.repositories

  compartment_id = each.value.compartment_id == null ? var.global_compartment_id : each.value.compartment_id
  display_name   = each.value.display_name == null ? each.key : each.value.display_name

  defined_tags  = each.value.defined_tags
  freeform_tags = each.value.freeform_tags
  is_immutable  = each.value.is_immutable
  is_public     = each.value.is_public

  dynamic "readme" {
    for_each = each.value.readme != null ? [each.value.readme] : []
    content {
      content = readme.value.content
      format  = readme.value.format
    }
  }
}
