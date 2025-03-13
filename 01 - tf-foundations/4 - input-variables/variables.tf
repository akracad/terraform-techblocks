variable "fname" {
  type    = string
  default = "sample.txt"
}

variable "fcont" {
  type    = string
  default = "Hello students welcome to devops class"
}

variable "fperms" {
  type    = number
  default = "0770"
}

variable "input-zone" {
  type    = list(any)
  default = ["us-west-1a", "us-west-1c", "us-west-1d", "us-west-1e"]

}