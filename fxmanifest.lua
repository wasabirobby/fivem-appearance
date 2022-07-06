fx_version "cerulean"
game "gta5"
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
  '@oxmysql/lib/MySQL.lua',
  'server.lua'
}

shared_scripts {
  '@es_extended/imports.lua',
  '@ox_lib/init.lua',
  'config.lua'
}

dependencies {
  'es_extended',
  'ox_lib',
  'oxmysql'
}

provides {
  'skinchanger',
  'esx_skin'
}
