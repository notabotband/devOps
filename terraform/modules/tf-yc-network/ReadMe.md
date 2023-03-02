#tf-yc-network

###Variable
```
variable "zones" {
description = "Zones"
type = set(string)
default = [
"ru-central1-c",
"ru-central1-b",
"ru-central1-a",
]
}
```

###Provider - "yandex"

###Outputs: net & subnet