provider "aws" {
  region  = "us-east-1"
}

resource "aws_s3_bucket" "terraform-state-storage-s3" {
    bucket = "terraform-state-storage-a123z67"
 
    versioning {
      enabled = true
    }
 
    lifecycle {
      prevent_destroy = true
    }
 
    tags {
      Name = "S3 Remote Terraform State Store"
    }      
}

resource "aws_dynamodb_table" "terraform-state-lock" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}