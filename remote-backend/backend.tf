terraform {
  backend "s3" {
    bucket     = "tj-s3-backend-course"
    key        = "terraform/tfstate.tfstate"
    access_key = "AKIAUHY7PUDQYX4OIZHL"
    secret_key = "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"
    region     = "eu-central-1"
  }
}
