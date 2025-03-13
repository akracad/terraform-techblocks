module "techblocks_md" {
    source = "../modules"
    id_length = 5
    min_int = 10
    max_int = 100
}

output "random_id" {
    value = module.techblocks_md.result1  
}

output "random_int" {
    value = module.techblocks_md.result2
  
}