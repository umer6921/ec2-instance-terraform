provider "aws" {
  region = "ap-south-1"

}

resource "aws_s3_bucket" "demo3_s3" {
  bucket = "terais3-bucket"


}

resource "aws_instance" "demo-ec2" {
  ami = var.ec2-ubuntu-ami
  tags = {
    name = "terra-auto-instance"
  }
  instance_type = "t2.micro"
  
 
}
