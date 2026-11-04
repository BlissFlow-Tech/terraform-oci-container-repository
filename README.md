# terraform-oci-container-repository

Terraform module that manages OCI Container Registry (OCIR) repositories.

## Usage

```hcl
module "ocir" {
  source  = "blissflow-tech/container-repository/oci"
  version = "~> 1.1"

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
    "acme/public-cli" = {
      compartment_id = var.public_compartment_id
      is_public      = true
    }
  }
}
```

## Notes

* The map key is the repository name unless `display_name` is set.
* A repository without its own `compartment_id` goes to `global_compartment_id`.
* Repositories are private and mutable by default.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| terraform | >= 1.3 |
| oci | >= 8.0, < 10.0 |

## Providers

| Name | Version |
| ---- | ------- |
| oci | >= 8.0, < 10.0 |

## Resources

| Name | Type |
| ---- | ---- |
| [oci_artifacts_container_repository.this](https://registry.terraform.io/providers/oracle/oci/latest/docs/resources/artifacts_container_repository) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| repositories | Container repositories to create, keyed by repository name unless display\_name is set | <pre>map(object({<br/>    compartment_id = optional(string)<br/>    display_name   = optional(string)<br/>    defined_tags   = optional(map(string))<br/>    freeform_tags  = optional(map(string))<br/>    is_immutable   = optional(bool, false)<br/>    is_public      = optional(bool, false)<br/>    readme = optional(object({<br/>      content = string<br/>      format  = string<br/>    }))<br/>  }))</pre> | n/a | yes |
| global\_compartment\_id | Compartment OCID used by every repository that does not set its own compartment\_id | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| container\_repositories | Container repositories information indexed by their key |
<!-- END_TF_DOCS -->

## License

Apache 2.0. See [LICENSE](LICENSE).
