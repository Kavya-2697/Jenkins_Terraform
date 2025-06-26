terraform {
  backend "s3" {
    bucket = "myterraform-statefilebucket"
    key = "main" 
    region = "us-east-1"
    dynamodb_table = "terraform-state-table"
  }
}
