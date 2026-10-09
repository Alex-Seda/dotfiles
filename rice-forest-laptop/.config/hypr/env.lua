hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.monitor({
    output = "eDP-1",
    mode = "1920x1080@60.0",
    position = "0x0",
    scale = 1.2,
})

hl.monitor({
    output = "desc:Invalid Vendor Codename - RTK J556J02 0x20231127",
    mode = "preferred",
    position = "auto-left",
    scale = 1.2,
})



-- Settings for Docking Stations

-- SMC Perry Docking Station monitor setup
-- Left to right: DP-5 | DP-3 | DP-4
hl.monitor({ output = "desc:Dell Inc. DELL P2422H 65XK0K3", mode = "preferred", position = "0x0",    scale = 1 })
hl.monitor({ output = "desc:Dell Inc. DELL P2422H HN800K3", mode = "preferred", position = "1920x0", scale = 1 })
hl.monitor({ output = "desc:Dell Inc. DELL P2422H 31NY9J3", mode = "preferred", position = "3840x0", scale = 1 })

