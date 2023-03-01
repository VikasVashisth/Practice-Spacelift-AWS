 provider "aws" {
   region     = "ap-south-1"
   access_key = "AKIAZPWLZSEGQYCJYV6D"
   secret_key = "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"
 }
resource "aws_instance" "MyInstance"{
  ami = "ami-068257025f72f470d"
  count = 1
  instance_type = "t2.large"
  security_groups = ["security_jenkins_ports"]
  tags = {
    Name = "jenkins_sample"
  }
}
resource "aws_security_group" "security_jenkins_ports" {
    name = "security_jenkins_ports"
    description = "security group for jenkins"
  
  ingress  {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
  } 
  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "tcp"
    to_port = 65535
  } 
  tags = {
    Name = "security_jenkins_ports"
  }
  
}

