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

hl.workspace_rule({ workspace = "1", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "5", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7", monitor = "eDP-1" })
hl.workspace_rule({ workspace = "9", monitor = "eDP-1" })
