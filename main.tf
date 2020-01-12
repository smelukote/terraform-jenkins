provider "google" {
  project = "jenkins-123-264620"
  region  = "us-west"
  zone    = "us-west1-a"
  credentials = "serviceaccount.json"
}

terraform {
  backen "gcs" {
    bucket = "jenkins-123-terraform-state"
    credentials = "erviceaccount.json"
  }
}
