hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

hl.monitor({
    output = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424",
    mode = "2560x1440@144.0",
    position = "0x0",
    scale = 1.07,
})

hl.monitor({
    output = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953",
    mode = "1920x1080@60.0",
    position = "2400x242",
    scale = 1,
})

hl.workspace_rule({
    workspace = "1",
    monitor = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424",
    default = true,
})
hl.workspace_rule({ workspace = "3", monitor = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424" })
hl.workspace_rule({ workspace = "5", monitor = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424" })
hl.workspace_rule({ workspace = "7", monitor = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424" })
hl.workspace_rule({ workspace = "9", monitor = "desc:ASUSTek COMPUTER INC VG27AQ3A T9LMAV022424" })

hl.workspace_rule({
    workspace = "2",
    monitor = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953",
    default = true,
})
hl.workspace_rule({ workspace = "4", monitor = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953" })
hl.workspace_rule({ workspace = "6", monitor = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953" })
hl.workspace_rule({ workspace = "8", monitor = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953" })
hl.workspace_rule({ workspace = "10", monitor = "desc:Ancor Communications Inc ASUS VS247 CALMTF189953" })

return true
