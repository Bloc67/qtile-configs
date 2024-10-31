
function sreload()
    mp.osd_message("Reloading subtitle...")
    mp.commandv("sub-reload")
end
mp.add_key_binding("R", "Subtitle reload", sreload)
