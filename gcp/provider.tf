provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
  #uncomment this to use the json file
  #credentials = file("tf_serice_account.json")

  # uncomment this to use the credential file contents inline as a variable.
  credentials = var.gcp_credentials
}