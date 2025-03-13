#Now, we are using a string variable

variable "fname" {
    type = string
    default = "example.txt"
}

#We are using a number variable 

variable "fcont" {
    type = number
    default = 2025  
}

#We are using a boolean variable

/* variable "fcont" {
     type = bool
     default = true  
} */

# we are using a list variable - mutable (can be changed)

/* variable "fcont" {
     type = list(string)
     default = ["aws", "azure", "gcp"]  
} */

#We are using a tuple variable - immutable (cant be changed)

/* variable "fcont" {
     type = tuple([ string, number, bool ])
     default = ["hello-students", 2025, true]  
} */

#we are using a map variable

/* variable "fcont" {
     type = map
     default = {
        name = "kiran"
        age = 32
        loc = "hyd"
     }
} */

