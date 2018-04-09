provider "aws" {
  region = "us-west-1"
}

# resource <rsource_type> <logical_name>	
resource "aws_instance" "dummy_ec2_instance" {
  ami           = "ami-bf5540df"
  instance_type = "t2.micro"
  key_name      = "N.Cali"

  tags {
    Name = "dummy_ec2_instance"
  }
}
