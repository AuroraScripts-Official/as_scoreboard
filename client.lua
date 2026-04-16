local ESX = exports["es_extended"]:getSharedObject()
local isScoreboardOpen = false

CreateThread(function()
    while true do
        Wait(0) 
        
        -- 57 ist die Taste F10
        if IsControlJustPressed(0, 57) then
            if not isScoreboardOpen then
                isScoreboardOpen = true
                
                -- Callback auf Aurora geändert
                ESX.TriggerServerCallback('as_scoreboard:getData', function(data)
                    SendNUIMessage({
                        action = "open",
                        myId = data.myId,
                        myJob = data.myJob,
                        total = data.total,
                        cops = data.cops,
                        medics = data.medics,
                        maxPlayers = data.maxPlayers
                    })
                end)
            end
        end

        -- Wenn F10 losgelassen wird, schließt sich das Menü
        if IsControlJustReleased(0, 57) then
            if isScoreboardOpen then
                isScoreboardOpen = false
                SendNUIMessage({ action = "close" })
            end
        end
    end
end)