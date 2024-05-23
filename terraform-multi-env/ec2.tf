data "aws_ami" "expense" {
  most_recent = true

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}
resource "aws_instance" "expense" {
  for_each = var.instance_name
  ami      = data.aws_ami.expense.id
  instance_type = each.value
  vpc_security_group_ids = ["sg-0f403663f7215d5ba"]

    

  tags = merge ( 
    var.common_tags,
    {
        Name = each.key
        Module = each.key
        environment = var.environment
    }
  )
}