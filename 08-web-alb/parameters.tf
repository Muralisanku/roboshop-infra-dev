resource "aws_ssm_parameter" "web_alb_listener_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_listener_arn"
  type  = "String"
  value = aws_lb_listener.HTTPS.arn
}

resource "aws_ssm_parameter" "web_alb_dns_arn" {
  name  = "/${var.project_name}/${var.environment}/web_alb_dns_arn"
  type  = "String"
  value = aws_lb.web_alb.dns_name
}