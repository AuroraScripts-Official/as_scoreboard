local ESX = exports["es_extended"]:getSharedObject()

-- Callback auf Aurora geändert
ESX.RegisterServerCallback('as_scoreboard:getData', function(source, cb)
    local xPlayers = ESX.GetExtendedPlayers() -- Holt alle Spieler effizient
    local cops = 0
    local medics = 0
    
    -- Zählt, wie viele Cops und Medics online sind
    for i=1, #xPlayers do
        local xPlayer = xPlayers[i]
        if xPlayer.job.name == 'police' then
            cops = cops + 1
        elseif xPlayer.job.name == 'ambulance' then
            medics = medics + 1
        end
    end

    -- Eigene Daten abrufen
    local myPlayer = ESX.GetPlayerFromId(source)
    local myJobLabel = "Unbekannt"
    if myPlayer then
        myJobLabel = myPlayer.job.label
    end

    -- Daten an den Client senden
    cb({
        myId = source,
        myJob = myJobLabel,
        total = #xPlayers,
        cops = cops,
        medics = medics,
        maxPlayers = GetConvarInt('sv_maxclients', 48) -- Liest deine Server-Slots aus
    })
end)