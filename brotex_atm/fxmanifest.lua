fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Brotex'
description 'Brotex ATM ROBBERY'

shared_scripts {
	'@ox_lib/init.lua',
	'config.lua'
}

client_scripts {
	'client/main.lua'
}

server_scripts {
	'server/server.lua'
}

files {
  'locales/*.json'
}