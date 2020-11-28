-- Recuperation des informations issu de /status des shelly
-- a la fin du fichier vous trouverez un bout de code à
-- ajouter dans le fichier pour chaque shelly que vous avez.
-- n'oubliez pas de créer vos Dummy avant de modifier ce script.
-- Nous avons besoin des IDX des dummy.
--
-- 28/11/2020 : Version 1 : Redaction initiale Auteur : enamaryn

commandArray = {}
json = (loadfile "/opt/domoticz/scripts/lua/JSON.lua")() -- on charge la bibliothèque JSON, URL pour un DOCKER domoticz

local config = assert(io.popen('/usr/bin/curl http://192.168.1.24/status'))
local blocjson = config:read('*all')
config:close()
print (blocjson)

local jsonValue = json:decode(blocjson)

ip = jsonValue.ip
power = jsonValue.power
--counters = jsonValue.counters
temperature = jsonValue.temperature

print (ip)
print (power)
--print (counters)
print (temperature)
-- vos shellys, on déclare chaque variable pour chaque dummy, exemele = power, counter, relay, temperature.. notamment
-- exemple Shelly1PM
--cumulus_1pm_power_idx=34
--cumulus_1pm_relay_idx=
--cumulus_1pm_counter_idx=
--cumulus_1pm_temperature_idx=


 -- nos instructions ici 
return commandArray
