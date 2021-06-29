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
	security_groups = ["${aws_security_group.tomcat-sg.name}"]
	tags = {
		Name = "tomcat-server" 			
	}
}

#creating an SG group and assigining it to the tomcat-server instance
resource "aws_security_group" "tomcat-sg" {
	name = "tomcat-sg"
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
		Name = "tomcat-sg"
	}
}

#creating an instance for deploying apache and connecting it to apache_sg
resource "aws_instance" "apache-web-server" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.apache-sg.name}"]
	tags = {
		Name = "apache-web-server" 			
	}
}

#creating an SG group and assigining it to the apache-web-server instance
resource "aws_security_group" "apache-sg" {
	name = "apache-sg"
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
		Name = "apache-sg"
	}
}

#creating an instance for deploying active-directory and connecting it to active_directory_sg
resource "aws_instance" "active-directory" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.active_directory_sg.name}"]
	tags = {
		Name = "active-directory" 			
	}
}

#creating an SG group and assigining it to the active-directory instance
resource "aws_security_group" "active_directory_sg" {
	name = "active_directory_sg"
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
		Name = "active_directory_sg"
	}
}

#creating an instance for deploying jboss-server and connecting it to jboss_sg
resource "aws_instance" "jboss-server" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.jboss_sg.name}"]
	tags = {
		Name = "jboss-server" 			
	}
}

#creating an SG group and assigining it to the jboss-server instance
resource "aws_security_group" "jboss_sg" {
	name = "jboss_sg"
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
		Name = "jboss_sg"
	}
}

#creating an instance for deploying tomcat and connecting it to jenkins_slave_sg
resource "aws_instance" "jenkins-slave-terraform" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.jenkins_slave_sg.name}"]
	tags = {
		Name = "jenkins-slave-terraform" 			
	}
}

#creating an SG group and assigining it to the jenkins-slave-terraform instance
resource "aws_security_group" "jenkins_slave_sg" {
	name = "jenkins_slave_sg"
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
		Name = "jenkins_slave_sg"
	}
}

#creating an instance for deploying tomcat and connecting it to jenkins_slave_sg
resource "aws_instance" "jenkins-slave-ansible" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.jenkins_slave_sg.name}"]
	tags = {
		Name = "jenkins-slave-ansible" 			
	}
}

#creating an ec2 instance for deploying docker into it
resource "aws_instance" "docker-deployment-instance" {
	ami = "ami-07625b74039b1a58b"
	instance_type = "t2.micro"
	key_name = "trail-key"
	security_groups = ["${aws_security_group.docker-sg.name}"]
	tags = {
		Name = "docker-deployment-instance" 			
	}
}
#creating a subsequent security group for docker-deployment-instance
resource "aws_security_group" "docker-sg" {
	name = "docker-sg"
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
		Name = "docker-sg"
	}
}


#resource for creating a S3 Bucket (prod-webdeploy-234564)
resource "aws_s3_bucket" "prod-webdeploy-234564" {
  bucket = "prod-webdeploy-234564"
  acl = "private"

  tags = {
    Name = "prod-webdeploy-234564"
  }
}

