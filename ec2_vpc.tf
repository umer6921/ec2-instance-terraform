resource "aws_key_pair" "keypair" {
key_name = "terra-key"
public_key = file("/home/ubuntu/.ssh/terra-key.pub")



}
resource "aws_default_vpc" "default-vpc" {


}


resource "aws_security_group" "allow_ssh" {

 name = "allow_ssh"
 description = "allow ssh inbound traffic"
 # using default VPC
 vpc_id =  aws_default_vpc.default-vpc.id

 ingress {
 description = "TLS VPC"
 from_port = 22
 to_port = 22
 protocol = "tcp"
 # Allow all traffic
 cidr_blocks =  ["0.0.0.0/0"]
 

}
tags = {
Name = "allow_ssh"
}
}



resource "aws_instance" "my-vpc-instance" {
  key_name =  aws_key_pair.keypair.key_name
  ami = var.ec2-ubuntu-ami
  security_groups = [aws_security_group.allow_ssh.name]
  instance_type = "t2.micro"
} 
 

