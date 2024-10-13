RegisterCommand('coords', function()
    local coords, heading = GetEntityCoords(PlayerPedId()), GetEntityHeading(PlayerPedId())

    local input = lib.inputDialog('CORDENADAS', {

        {type = 'select', label = 'Coordinate', options = {
            { value = 'vector3', label = 'VECTOR 3'},
            { value = 'vector4', label = 'VECTOR 4'},
            { value = 'xyzh', label = 'X Y Z H'}
        }},
    })

    if not input then return 
        lib.showContext('coords')
    end
    
    local selezione = input[1]
    
    if selezione == 'vector3' then
        lib.setClipboard(coords.x..', '..coords.y..', '..coords.z)
    elseif selezione == 'vector4' then
        lib.setClipboard('vector4('..coords.x..', '..coords.y..', '..coords.z..', '..heading..')')
    elseif selezione == 'xyzh' then
        lib.setClipboard('x = '..coords.x..', y = '..coords.y..', z = '..coords.z..', h = '..heading)
    end
end)
