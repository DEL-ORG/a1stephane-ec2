# eip.tf
resource "aws_eip" "eip" {
  vpc        = true
  depends_on = [aws_instance.ec2]

  tags = {
    Name = "ass01_EIP"
  }
}

# Associate the EIP with the instance
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.ec2.id
  allocation_id = aws_eip.eip.id
}

