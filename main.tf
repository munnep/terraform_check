resource "null_resource" "null_resource_foo" {
  triggers = {
    foo = "oof"
  }
}

check "null_resource_name_check" {
  data "null_data_source" "null_data_source_bar" {
    inputs = {
      bar = null_resource.null_resource_foo.triggers.foo
    }
  }
  assert {
    condition     = data.null_data_source.null_data_source_bar.outputs["bar"] == "oof"
    error_message = "this should not fail"
  }
}
