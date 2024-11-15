resource "aws_instance" "ec2" {
  ami           = var.ami_id        # Reference to ami_id variable
  instance_type = var.instance_type # Reference to instance_type variable
  key_name      = var.key_name      # Reference to key_name variable

  # Attach the security group defined in security_group.tf
  vpc_security_group_ids = [aws_security_group.sg.id]

  # Optional: specify subnet
  subnet_id = var.subnet_id # Reference to subnet_id variable

  tags = {
    Name = "ass01_ec2"
  }
}
