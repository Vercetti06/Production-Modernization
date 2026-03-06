resource "aws_launch_template" "app" {
  name_prefix   = "${local.name_prefix}-lt"
  image_id      = "ami-0f58b397bc5c1f2e8"
  instance_type = var.instance_type

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.app_sg.id]
  }

  user_data = base64encode(<<EOF
#!/bin/bash
echo "EcoStream ${var.env}" > index.html
nohup busybox httpd -f -p 80 &
EOF
  )
}
