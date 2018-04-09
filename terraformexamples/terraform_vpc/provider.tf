provider "aws" {
  region = "${var.region}"
}

# resource <rsource_type> <logical_name>	
resource "aws_vpc" "dummy_vpc" {
  cidr_block       = "${var.vpc_cidr}"
  instance_tenancy = "default"

  tags {
    Name     = "dummy_vpc"
    Location = "N. California"
  }
}

resource "aws_subnet" "dummy_subnets" {
  #there are functions in terraform we can use  #count = "${length(var.azs)}"

  #same as above but with data sources 
  count = "${length(data.aws_availability_zones.azs.names)}"

  availability_zone = "${element(data.aws_availability_zones.azs.names,count.index)}"

  #Interpolation below $(<type_of_resource>.<logical_name>.id)
  vpc_id = "${aws_vpc.dummy_vpc.id}"

  #this is also an function
  cidr_block = "${element(var.subnet_cidr,count.index)}"

  tags {
    Name = "dummy_subnet-${count.index+1}"
  }
}
