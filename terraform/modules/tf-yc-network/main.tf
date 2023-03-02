data "yandex_vpc_network" "default" {
  name = "default"
}

data "yandex_vpc_subnet" "default" {
  for_each = toset(var.zones)

  name = "${data.yandex_vpc_network.default.name}-${each.key}"
  subnet_id = "${data.yandex_vpc_network.default.id}"
}
