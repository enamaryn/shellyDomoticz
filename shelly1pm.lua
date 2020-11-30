-- Recuperation de informations poweer issu de /status des shelly 1PM
-- A utiliser avec un "http poller" et capteur virtuel "utilisation (electrique)"
--
-- 28/11/2020 : Version 1 : Redaction initiale Auteur : enamaryn

-- On appel JSON pour decoder le texte donner par shelly a cette adresse http://ip.du.she.lly/status sur un reseau local --
	json = (loadfile "/opt/domoticz/scripts/lua/JSON.lua")()  -- For Linux    
	--  API call
	local config=assert(io.popen('curl "http://192.168.1.24/status"')) -- ip de votre shelly
	local result = config:read('*a')
	config:close()
	output = json:decode(result)

-- déclaration des variables avec les bonnes données issu du json --
	local idx = 34 -- on rentre le bon id du capteur virtuel, capteur Utilisation Electrique ou en anglais Usage electric
	local energieInstantanee = output.meters[1].power -- on prend l'information dans le tableau JSON

-- on update le capteur virtuel --
	domoticz_updateDevice(idx,'',energieInstantanee)
