provider "proxmox" {
  pm_api_url = var.pve_url
}

provider "powerdns" {
  server_url = var.pdns_url
  api_key    = var.pdns_api_key
}

module "{{ cookiecutter.tf_module_name }}" {
  source = "github.com/Johnny-Knighten/terraform-homelab-pve-vm?ref=2.0.0"

  pve_node = var.pve_node
  pve_name = var.vm_name
  pve_id   = var.vm_id

  pve_is_clone   = true
  pve_full_clone = true
  pve_template   = "debian-12-cloud-init-template"

  pve_boot_on_start   = true
  pve_startup_options = "order=0,up=30"

  pve_use_ci             = true
  pve_ci_ssh_user        = "ansible"
  pve_ci_ssh_private_key = var.pve_ci_ssh_private_key
  pve_ci_ssh_keys = [
    var.pve_ci_ssh_public_key
  ]
  pve_ci_user               = "ansible"
  pve_ci_use_dhcp           = false
  pve_ci_ip_address         = var.vm_ip_address
  pve_ci_cidr_prefix_length = var.vm_cidr_prefix_length
  pve_ci_gateway_address    = var.vm_gateway_address
  pve_ci_dns_servers        = var.vm_dns_servers
  pve_ci_storage_location   = var.vm_ci_store_pool

  #  Required For Debian 12 Cloud Init
  pve_add_serial = true

  pve_networks = [
    {
      model  = "virtio"
      bridge = "vmbr0"
      tag    = var.vm_vlan
      queues = 0
    }
  ]

  pve_core_count = 2

  pve_memory_size    = 4096
  pve_memory_balloon = 0

  pve_disk_size             = "15G"
  pve_disk_storage_location = var.vm_disk_store_pool

  pdns_zone        = var.dns_zone
  pdns_record_name = var.dns_record_name
}
