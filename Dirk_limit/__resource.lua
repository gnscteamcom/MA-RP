--

--

ui_page 'ui/ui.html'
files {
    'ui/ui.html',
    'ui/animate.css',
    'ui/pdown.ttf',
    'ui/voice_of_the_highlander.ttf'
}

server_scripts {
    '../../resources/essentialmode/config.lua',
    'server.lua'
}
client_script {
    'client.lua',
    'GUI.lua'
}

ui_page 'html/ui.html'
files {
	'html/ui.html',
	'html/style.css',
	'html/script.js',
	'html/ci_h.png',
	'html/ci_f.png',
	'html/cursor.png'
}

export 'getQuantity'
export 'notFull'