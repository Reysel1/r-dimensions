RegisterNetEvent('openmenu', function()
    QBCore.UI.Menu.Open('default', GetCurrentResourceName(), 'announcemenu', {
        title = 'Dimensiones [ADMIN]',
        align = "bottom-right", 
        elements = {
            { label = '<i class="fa-solid fa-hat-witch"></i> - Setear dimensión', value = 'set' },
            { label = '<i class="fa-solid fa-rectangle-xmark"></i> - Cerrar', value = 'cerrar' }   
        }   
    }, function(data, menu)
        if (data.current.value == 'set') then
            menu.close()
            opendialog()
        elseif (data.current.value == 'default') then 
            QBCore.Functions.TriggerCallback('set:default',function() end, 0)
        elseif (data.current.value == 'cerrar') then
            menu.close()
        end
    end, function(data, menu)
        menu.close()
    end)
end)

function opendialog()
    local dialog = exports['qb-input']:ShowInput({
        header = "Setear dimensión",
        submitText = "Aceptar",
        inputs = {
            {
                text = "ID",
                name = "id",
                type = "number",
                isRequired = true,
            },
            {
                text = "Dimensión",
                name = "dm",
                type = "number",
                isRequired = true,
            },
        },
    })
    if dialog ~= nil then
        if dialog.id and dialog.dm then
           QBCore.Functions.TriggerCallback('send:setear', function() end, tonumber(dialog.id), tonumber(dialog.dm))
        else
            QBCore.Functions.Notify('Te falta algo por terminar.')
        end
    end
end