
local cfg = {}

-- mysql credentials
cfg.db = {
host = "mysql-mariadb-dal01-9-101.zap-hosting.com", -- inserted trough ZAP
database = "zap361068-1", -- inserted trough ZAP
user = "zap361068-1", -- inserted trough ZAP
password = "RU5IelHrDtdbxsh6", -- inserted trough ZAP
}

cfg.save_interval = 30 -- seconds
cfg.whitelist = false -- enable/disable whitelist
cfg.ignore_ip_identifier = true -- This will allow multiple same IP connections (for families etc)

-- delay the tunnel at loading (for weak connections)
cfg.load_duration = 5 -- seconds, player duration in loading mode at the first spawn
cfg.load_delay = 0 -- milliseconds, delay the tunnel communication when in loading mode
cfg.global_delay = 0 -- milliseconds, delay the tunnel communication when not in loading mode


				-- SET YOUR LANGUAGE HERE - MAKE SURE IT'S INSIDE THE ""
cfg.lang = "en"
				-- English/Français/Italiano/Deutsche/Português/Pусский/Lietuvių/Dansk/العربية/Polskie/Español/Svenska/Suomalainen/中文/Română
cfg.debug = false


return cfg
