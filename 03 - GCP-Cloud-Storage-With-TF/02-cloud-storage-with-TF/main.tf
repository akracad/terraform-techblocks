resource "google_storage_bucket" "techblocks-bucket-from-tf" {
  name     = "techblocks-bucket-from-tf"
  location = "us-central1"
  labels = {
    "gcp"       = "cloud-storage"
    "terraform" = "demo-object"
  }
  storage_class               = "NEARLINE"
  uniform_bucket_level_access = false
  lifecycle_rule {
    action {
      type          = "SetStorageClass"
      storage_class = "ARCHIVE"
    }
    condition {
      age = 20
    }
  }
  retention_policy {
    retention_period = 86400
  }
}


resource "google_storage_bucket_object" "gcptfimage" {
  name   = "gcptfimage"
  bucket = google_storage_bucket.techblocks-bucket-from-tf.name
  source = "./azure-cloud.png"
}

resource "google_storage_default_object_access_control" "veiw_rule" {
  bucket = google_storage_bucket.techblocks-bucket-from-tf.name
  object = google_storage_bucket_object.gcptfimage.name
  role   = "READER"
  entity = "allUsers"
}