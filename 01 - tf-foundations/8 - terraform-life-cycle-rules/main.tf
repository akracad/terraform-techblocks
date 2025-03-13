resource "random_integer" "rand_int" {
    min = 20
    max = 200

    lifecycle {
        # create_before_destroy = true
        # prevent_destroy = true   
        ignore_changes = [ 
            min,
            max
         ]   
    }
}

output "abdul" {
    value = random_integer.rand_int.result  
}