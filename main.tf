resource "aws_customer_gateway" "chinamoily" {
  bgp_asn    = 65000
  ip_address = "223.119.61.189"
  device_name = "Fortigate"
  type       = "ipsec.1"

  tags = {
    Name = "chinamoily-customer-gateway"
  }
}

