RegisterCommand('getcoords', function(souce, args)
    local subCommand = args[1]
    if subCommand == nil or subCommand == "vector4" or subCommand == "4" then
        GetCoords(4);
        return
    end

    if subCommand == "vector3" or subCommand == "3" then
        GetCoords(3)
    end
end)

RegisterCommand('camcoords', function()
    local coords, heading = GetFinalRenderedCamCoord(), GetFinalRenderedCamRot(0)
    SendNUIMessage({
        type = 'clipboard',
        data = '{' .. vec(coords.x, coords.y, coords.z) .. ', ' .. vec(heading.x, heading.y, heading.z) .. ' }'
    })
    ShowNotificationTicker('Succesvol gekopieerd naar je toetsenbord! ' .. vec(coords.x, coords.y, coords.z) .. ', ' .. vec(heading.x, heading.y, heading.z) )
end)


function GetCoords(type)
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local vector = nil
    if type == 4 then
        local heading = GetEntityHeading(ped)
        vector = vec(coords.x, coords.y, coords.z, heading)
    elseif type == 3 then
        vector = vec(coords.x, coords.y, coords.z)
    end

    local message = {
        type = 'clipboard',
        data = '' .. vector
    }

    SendNUIMessage(message)
    ShowNotificationTicker('Succesvol gekopieerd naar je toetsenbord! ' .. vector)
end

function ShowNotificationTicker(message)
    BeginTextCommandThefeedPost('STRING')
    AddTextComponentSubstringPlayerName(message)
    EndTextCommandThefeedPostTicker(0, 1)
end