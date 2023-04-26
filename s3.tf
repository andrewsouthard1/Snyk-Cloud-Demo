#Define Buckets
resource "aws_s3_bucket" "exposedbucket" {
  bucket_prefix = "${var.victim_company}exposedbucket"
  tags = {
    Name        = "Exposed Bucket"
    env = "Dev"
    Owner = var.owner
  }
}

resource "aws_s3_bucket_public_access_block" "private" {
  bucket                  = aws_s3_bucket.exposedbucket.id
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

