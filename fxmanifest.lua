fx_version "cerulean"
game "gta5"

description 'Wasabi fork of fivem-appearance'
version '1.0.4'

lua54 'yes'

files {
  'web/dist/index.html',
  'web/dist/assets/*.js',
  'locales/*.json',
  'peds.json',
  'tattoos.json'
}

ui_page 'web/dist/index.html'

client_scripts {
  'game/dist/index.js',
  'client.lua'
}

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'skinconverter.lua',
  'server.lua'
}

shared_scripts {
  '@es_extended/imports.lua', -- Remove this out if using older ESX
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'es_extended',
  'ox_lib'
}

provides {
  'skinchanger',
  'esx_skin'
}
