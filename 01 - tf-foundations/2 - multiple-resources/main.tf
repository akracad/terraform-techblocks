resource "local_file" "sample" {
    filename = "sample.txt"
    content = "Hello students to devops"
    file_permission = "0770"  
}

resource "local_file" "class" {
    filename = "class.txt"
    content = "Hello students"
    file_permission = "0770"  
}