resource "local_file" "example" {
  filename        = var.fname
  content         = var.fcont
  file_permission = var.fperms
}

resource "random_shuffle" "random" {
  input        = var.input-zone
  result_count = 2
}

output "result4" {
  value = random_shuffle.random.result
}
