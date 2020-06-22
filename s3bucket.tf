provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "b" {
  bucket = "aabra-ka-dabra-test"
  acl    = "public-read"
  region = "ap-south-1"
  policy = <<EOF
{
  "Version":"2012-10-17",
  "Statement":[{
        "Sid":"PublicReadForGetBucketObjects",
        "Effect":"Allow",
          "Principal": "*",
      "Action":["s3:GetObject"],
      "Resource":["arn:aws:s3:::bucket/*"]
    }
  ]
}
EOF

  force_destroy = true

  website {
    index_document = "index.html"
    error_document = "index.html"
  }
}
