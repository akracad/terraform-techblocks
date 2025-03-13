locals {
  content_subject = "now we are proffessionals in --- >>> "
}


resource "local_file" "learn-AWS" {
    filename = "aws.txt"
    content  = "${local.content_subject} AWS" 
}

resource "local_file" "learn-Azure" {
    filename = "az.txt"
    content = "${local.content_subject} Azure" 
}

resource "local_file" "learn-GCP" {
    filename = "gcp.txt"
    content = "${local.content_subject} GCP" 
}