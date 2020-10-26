#..........................................prometheus_security_group........................................................ 

resource "aws_security_group" "prom" {
    name = "prometheus_private_SG"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        security_groups = [aws_security_group.grafana.id]
         
    }
    ingress {
        from_port = 9090
        to_port = 9090
        protocol = "tcp"
        security_groups = [aws_security_group.grafana.id]
    }
    
    
   
   egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }



    vpc_id = aws_vpc.default.id

    tags = {
        Name = "Prometheus_Private_SG"
    }
}

#..............................................grafana_security_group........................................................
resource "aws_security_group" "grafana" {
    name = "grafana_public_SG"
    description = "Allow incoming HTTP connections."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
         
    }
    ingress {
        from_port = 3000
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }
         
   egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

    vpc_id = aws_vpc.default.id

    tags = {
        Name = "grafana_public_SG"
    }
}


