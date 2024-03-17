output "nginx_lb_ip" {
  value = data.external.nginx_lb_ip.result["ip"]
}