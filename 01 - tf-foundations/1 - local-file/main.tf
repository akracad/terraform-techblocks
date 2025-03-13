resource "local_file" "example" {
    filename = "example.txt"
    content = "Hello students"
    file_permission = "0770"  
}