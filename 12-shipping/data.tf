data "aws_ssm_parameter" "vpc_id" {
    name = "/${var.project_name}/${var.environment}/vpc_id"
}

data "aws_ssm_parameter" "shipping_sg_id" {
    name = "/${var.project_name}/${var.environment}/shipping_sg_id"
}

data "aws_ssm_parameter" "private_subnet_id" {
    name = "/${var.project_name}/${var.environment}/private_subnet_id"
}

data "aws_ssm_parameter" "app_alb_listener_arn" {
    name = "/${var.project_name}/${var.environment}/app_alb_listener_arn"
}

