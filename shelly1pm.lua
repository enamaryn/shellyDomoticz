-- Recuperation des informations issu de /status des shelly
-- a la fin du fichier vous trouverez un bout de code à
-- ajouter dans le fichier pour chaque shelly que vous avez.
-- n'oubliez pas de créer vos Dummy avant de modifier ce script.
-- Nous avons besoin des IDX des dummy.
--
-- 28/11/2020 : Version 1 : Redaction initiale Auteur : enamaryn

    json = (loadfile "/opt/domoticz/scripts/lua/JSON.lua")()  -- For Linux    
    --  API call
    local config=assert(io.popen('curl "http://192.168.1.24/status"'))
    local result = config:read('*a')
    config:close()
    output = json:decode(result)

    MyUptime= output.meters.power
    SoftwareCurrent=output.update.old_version
    SoftwareNew=output.update.new_version
    SwitchHallStatus=output.relays[0].ison
    
    print(MyUptime)
    print(SoftwareCurrent)
    print(SoftwareNew)
    print('SwitchHall is '..SwitchHallStatus)
