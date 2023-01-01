QBCore.Commands.Add('dim', 'Setear dimensión', { }, false, function(source, args)
    TriggerClientEvent('openmenu', source)
end, 'admin')

QBCore.Functions.CreateCallback('send:setear', function(source, cb, id, dm)
    local _char = QBCore.Functions.GetPlayer(id)
    if (_char == nil) then 
        TriggerClientEvent('QBCore:Notify', source, 'No se encontro el ID')
    else 
        TriggerClientEvent('QBCore:Notify', source, 'Has puesto a la id ~g~'..id..'~w~ en la dimensión ~g~'..dm)
        SetPlayerRoutingBucket(id, dm)
    end
end)
