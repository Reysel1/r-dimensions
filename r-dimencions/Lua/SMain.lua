QBCore.Commands.Add('dim', 'Setear dimensión', { }, false, function(source, args)
    TriggerClientEvent('openmenu', source)
end, 'admin')

QBCore.Functions.CreateCallback('send:setear', function(source, cb, id, dm)
    local _char = QBCore.Functions.GetPlayer(id)
    if (_char == nil) then 
        TriggerClientEvent('QBCore:Notify', source, 'No se encontro el ID')
    else 
        SetPlayerRoutingBucket(id, dm)
    end
end)