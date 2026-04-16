fx_version 'cerulean'
game 'gta5'

author 'Aurora Scripts'
description 'Aurora Scripts - Glassmorphism Scoreboard'
version '1.0.0'

ui_page 'html/index.html'

shared_scripts {
    '@es_extended/imports.lua'
}

files {
    'html/index.html',
    'html/style.css',
    'html/script.js',
    'html/logo.png'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua'
}