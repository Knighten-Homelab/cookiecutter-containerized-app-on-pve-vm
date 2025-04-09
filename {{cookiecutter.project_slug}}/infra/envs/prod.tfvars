pve_url="{{ cookiecutter.pve_url }}"
pve_node="{{ cookiecutter.pve_node }}"
vm_name="{{ cookiecutter.pve_vm_name }}"
vm_id={{ cookiecutter.pve_vm_id }}
vm_ip_address="{{ cookiecutter.pve_vm_ip_prod }}"
vm_cidr_prefix_length=24
vm_gateway_address="{{ cookiecutter.pve_vm_gateway_ip }}"
vm_dns_servers="192.168.25.100 192.168.25.101 {{ cookiecutter.pve_vm_gateway_ip }}"
vm_vlan={{ cookiecutter.pve_vm_vlan_tag }}
vm_ci_store_pool="local-zfs"
vm_disk_store_pool="local-zfs"

pdns_url="http://dns.knighten.io:8080/"
dns_record_name="{{ cookiecutter.pdns_dns_name }}"
dns_zone="knighten.io"
