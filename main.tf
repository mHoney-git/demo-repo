provider "aws" {
	region = var.region
	access_key = var.access_key
	secret_key = var.secret_key
}   

#creating an instance for deploying tomcat and connecting it to tomcat_sg
resource "aws_instance" "tomcat-server" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	tags = {
		Name = "tomcat-server" 			
	}
}

#creating an SG group and assigining it to the tomcat-server instance
resource "aws_security_group" "tomcat_sg" {
	name = "tomcat_sg"
	ingress {
		cidr_blocks = ["99.227.118.13/32"]
		from_port = 8080
		to_port = 8080
		protocol = "tcp"
	}
	egress {
		cidr_blocks = ["0.0.0.0/0"]
		from_port = 0
		to_port = 0
		protocol = "-1"
	}
	tags = {
		Name = "tomcat_sg"
	}
}