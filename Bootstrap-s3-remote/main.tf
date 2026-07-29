# bootstrap/main.tf — run this with LOCAL state first
resource "aws_s3_bucket" "tf_state" {
  bucket = "rushi-tf-s3-bucket"
  force_destroy = true
/*
  at time of running this add this part. 
  i commented this now beacuse of lifecycle policy preventing it to get destroy.
  and you can remove above force_destroy line too.

  lifecycle {
    prevent_destroy = true
  }
*/
}

resource "aws_s3_bucket_versioning" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.tf_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
/*
# Only needed if Terraform < 1.10
resource "aws_dynamodb_table" "tf_lock" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
*/