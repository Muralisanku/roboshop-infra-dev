data "aws_ami" "centos8"{
    owners = ["973714476881"]
    most_recent = true

        filter {
        name   = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }

        filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

        filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }
}

data "aws_ssm_parameter" "web_alb_sg_id" {
    name = "/${var.project_name}/${var.environment}/web_alb_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project_name}/${var.environment}/private_subnet_id"
}

data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "web_sg_id" {
    name = "/${var.project_name}/${var.environment}/web_sg_id"
}
data "aws_ssm_parameter" "web_alb_listener_arn" {
    name = "/${var.project_name}/${var.environment}/web_alb_listener_arn"
}