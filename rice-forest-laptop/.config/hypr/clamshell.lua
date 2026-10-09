local function panel_on()
    hl.monitor({ output = "eDP-1", disabled = false, mode = "preferred", position = "auto", scale = 1 })
end

-- Lid closed: disable the panel only if an external monitor is connected
hl.bind("switch:on:Lid Switch", function()
    if #hl.get_monitors() > 1 then
        hl.monitor({ output = "eDP-1", disabled = true })
    end
end, { locked = true })

-- Lid open: bring the panel back
hl.bind("switch:off:Lid Switch", panel_on, { locked = true })

-- Undock: bring the panel back when the last external monitor is removed
hl.on("monitor.removed", function(mon)
    local external = 0
    for _, m in ipairs(hl.get_monitors()) do
        if m.name ~= "eDP-1" and m.name ~= mon.name then
            external = external + 1
        end
    end
    if external == 0 then panel_on() end
end)
