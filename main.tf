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



resource "aws_vpn_connection" "chinamoily" {
  vpn_gateway_id      = aws_vpn_gateway.chinamoily-vpn-gateway.id
  customer_gateway_id = aws_customer_gateway.chinamoily.id
  type                = "ipsec.1"
  static_routes_only  = true
  local_ipv4_network_cidr = "223.118.36.3/32"
  remote_ipv4_network_cidr = ["20.10.14.186/32","20.10.14.197/32"]
  tunnel1_preshared_key = "EJy6SBMevT1Yz4G4"
  tunnel1_ike_versions = "ikev1"
  tunnel1_phase1_dh_group_numbers = [2]
  tunnel1_phase1_encryption_algorithms = ["AES256"]
  tunnel1_phase1_integrity_algorithms = ["SHA2-256"]
  tunnel1_phase1_lifetime_seconds = 28800

  tunnel1_phase2_encryption_algorithms = ["AES256"]
  tunnel1_phase2_integrity_algorithms = ["SHA2-256"]
  tunnel1_phase2_lifetime_seconds = 28800
  tunnel1_startup_action = "start"

}
