local function consave() 
    local path = mp.get_property("path") or ""
    local filename = mp.get_property("filename")

    if not filename then
        mp.osd_message("No media loaded", 1.5)
        return
    end
    path = path:gsub(strPlainText(filename), "")

    local file = io.open(path .. "mpv.conf", "w")
    if not file then
        mp.osd_message("Cannot write to media directory", 1.5)
        return
    end

    local audio = mp.get_property("current-tracks/audio/id") or "no"
    local sub = mp.get_property("current-tracks/sub/id") or "no"
    local subPos = mp.get_property("sub-pos")
    local mcontrast = mp.get_property("contrast")
    local mbrightness = mp.get_property("brightness")
    local mgamma = mp.get_property("gamma")
    local msaturation = mp.get_property("saturation")
    local subScale = mp.get_property("sub-scale")
    local mcontrast = mp.get_property("contrast")
    local mvolume = mp.get_property("volume")
    local msharpen = mp.get_property("sharpen")
    local maf = mp.get_property("af")
    local maf2 = string.sub(maf,17)

    local mall = "aid=" .. audio .. "\nsid=" .. sub .. "\nsub-pos=" .. subPos ..  
        "\nsub-scale=" .. subScale .. "\ncontrast=" .. mcontrast ..
        "\nbrightness=" .. mbrightness .. "\ngamma=" .. mgamma ..
        "\nsaturation=" .. msaturation .. "\nvolume=" .. mvolume ..
        "\nsharpen=" .. msharpen ..
        "\naf=lavfi=[" .. maf2 .. "]"

    local mallout = "a:" .. audio .. " s:" .. sub .. " sp:" .. subPos ..  
        " ss:" .. subScale .. " c:" .. mcontrast ..
        " b:" .. mbrightness .. " g:" .. mgamma ..
        " sa:" .. msaturation .. " v:" .. mvolume ..
        " sh:" .. msharpen ..
        " af:" .. maf2 .. " "

    file:write(mall)
    file:close()
    mp.osd_message("Configuration Saved\n" .. mallout, 2)
end

mp.add_key_binding("f1", "config-save", function() consave() end)

--- config-saver code end ---

