#........................Grafana..............................

resource "aws_instance" "grafana" {
    ami = var.amis[var.aws_region]
    availability_zone = "eu-west-1a"
    instance_type = var.instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.grafana.id]
    subnet_id = aws_subnet.eu-west-1a-public.id
    associate_public_ip_address = true
    user_data = data.template_file.myuserdata1.template
    
    tags = {
        Name = "grafana_public"
    }
}

data "template_file" "myuserdata1" {

  template = file("${path.cwd}/graf.tpl")

}

#........................prometheus..............................

resource "aws_instance" "prometheus" {
    ami = var.amis[var.aws_region]
    availability_zone = "eu-west-1a"
    instance_type = var.instance_type
    key_name = var.aws_key_name
    vpc_security_group_ids = [aws_security_group.prom.id]
    subnet_id = aws_subnet.eu-west-1a-private.id
    associate_public_ip_address = true
    user_data = data.template_file.myuserdata2.template
    
    tags = {
        Name = "prometheus_private"
    }
}



data "template_file" "myuserdata2" {

  template = file("${path.cwd}/prom.tpl")

}