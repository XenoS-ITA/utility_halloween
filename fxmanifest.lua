fx_version "cerulean"
game "gta5"
author "XenoS"
description "Script that adds collectible pumpkins in the scariest areas of los santos"

client_scripts {
    "@utility_lib/client/native.lua",
    "config.lua",
    "client/*.lua",
}

server_scripts {
    "config.lua",
    "server/*.lua",
}