provider "aws" {
  region = "ap-south-1"

}

resource "aws_s3_bucket" "demo3_s3" {
  bucket = "terais3-bucket"


}
