provider "google" {
  project = "jenkins-123-264620"
  region  = "us-west"
  zone    = "us-west1-a"
  credentials = "sa-key.json"
}

/******************************************
  Provider backend store
  You must set the local application credentials using :
  gcloud auth application-default login
 *****************************************/
terraform {
  backend "gcs" {
    bucket = "jenkins-123-terraform-state"
    prefix = "jenkins-terraform"
  }
}