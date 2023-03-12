resource "aws_s3_bucket" "capstone" {
  bucket = var.s3_bucket
  acl    = "public-read"
  policy = templatefile("terraform-capstone-policy.json", { bucket = "${var.s3_bucket}" })

  website {
    index_document = "index.html"
  }
}