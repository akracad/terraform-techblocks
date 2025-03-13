#Implicit dependency

resource "random_integer" "rand_int" {
    min = 100
    max = 1000  
}

resource "local_file" "local_res_imp" {
    filename = "implicit.txt"
    content = "This is a random number: ${random_integer.rand_int.id} from RI" 
}

#Explicit dependency

resource "random_string" "rand_str" {
    length = 25
    special = true
}

resource "local_file" "local_res_exp" {
    filename = "explicit.txt"
    content = "This is a random number: ${random_string.rand_str.id} from RS"
    depends_on = [ 
        random_string.rand_str
     ]
}