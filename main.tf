resource "aws_customer_gateway" "chinamoily" {
  bgp_asn    = 65000
  ip_address = "223.119.61.189"
  device_name = "Fortigate"
  type       = "ipsec.1"

  tags = {
    Name = "chinamoily-customer-gateway"
  }
}



resource "aws_vpn_gateway" "chinamoily-vpn-gateway" {
  tags = {
    Name = "chinamoily-vpn-gateway"
  }
}

resource "aws_vpn_gateway_attachment" "vpn_attachment" {
  vpc_id         = "vpc-7d43cd04"
  vpn_gateway_id = aws_vpn_gateway.chinamoily-vpn-gateway.id
}

