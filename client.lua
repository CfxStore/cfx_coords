ShowNotificationTicker = function(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(0, 1)
end

RegisterCommand('getcoords', function(souce, args)
    local subCommand = args[1]

    if not subCommand then
        getCoords(4);
    end

    if subCommand == "3" then
        getCoords(3)
    end
end)

function getCoords(vector)
    local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())
    if vector == 4 then
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y, coords.z, heading)
        })
        ShowNotificationTicker('Succesvol gekopieerd naar je toetsenbord! ' .. vec(coords.x, coords.y, coords.z, heading))
    elseif vector == 3 then
        SendNUIMessage({
            type = 'clipboard',
            data = '' .. vec(coords.x, coords.y, coords.z)
        })
        ShowNotificationTicker('Succesvol gekopieerd naar je toetsenbord! ' .. vec(coords.x, coords.y, coords.z, heading))
    end
end

RegisterCommand('camcoords', function()
    local coords, heading = GetFinalRenderedCamCoord(), GetFinalRenderedCamRot(0)
    SendNUIMessage({
        type = 'clipboard',
        data = '{' .. vec(coords.x, coords.y, coords.z) .. ', ' .. vec(heading.x, heading.y, heading.z) .. ' }'
    })
    ShowNotificationTicker('Succesvol gekopieerd naar je toetsenbord! ' .. vec(coords.x, coords.y, coords.z) .. ', ' .. vec(heading.x, heading.y, heading.z) )
end)
