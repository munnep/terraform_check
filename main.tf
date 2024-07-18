resource "null_resource" "null_resource_foo" {
  triggers = {
    foo = "oof"
  }
}

check "health_check" {
  data "http" "terraform_io" {
    url = "https://www.terraform.io"
  }

  assert {
    condition = data.http.terraform_io.status_code == 200
    error_message = "${data.http.terraform_io.url} returned an unhealthy status code"
  }
}

# check "null_resource_name_check" {
#   data "null_data_source" "null_data_source_bar" {
#     inputs = {
#       bar = null_resource.null_resource_foo.triggers.foo
#     }
#   }
#   assert {
#     condition     = data.null_data_source.null_data_source_bar.outputs["bar"] == "oof"
#     error_message = "this should not fail"
#   }
# }
