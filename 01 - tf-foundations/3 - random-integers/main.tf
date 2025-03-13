resource "random_integer" "random" {
  min = 10
  max = 100
}

output "result1" {
    value = random_integer.random.result  
}

resource "random_password" "password" {
  length           = 6
  lower = false
}

output "result2" {
    value = random_password.password.result
    sensitive = true
}

resource "random_string" "random" {
  length           = 16
  special          = true
  override_special = "/@£$"
}

output "result3" {
    value = random_string.random.result
  
}


resource "random_shuffle" "random" {
  input        = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]
  result_count = 2
}

output "result4" {
  value = random_shuffle.random.result  
}


