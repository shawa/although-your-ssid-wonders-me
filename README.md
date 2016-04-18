# Although Your SSID Wonders Me
Haskell Implementation of [Netopia's famous WEP key derivation function](http://www.bacik.ie/eircomwep/howto.html), based on the device MAC address because

1. I wanted to see how the KDF works
2. I'm learning Haskell
3. I have a couple of old routers whose keys I've forgotten

Requires `cryptohash` for SHA1

Now I'm sure there's hardly anyone (?) still using one of these vulnerable routers, but obviously if you break into someones WiFi network using this it's your fault.

![Very Advanced](http://s4dd.yore.ma/eircom/eircom-bs.jpg)
