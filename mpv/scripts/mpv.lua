-- Use this script to integrate mpv with dessubdb.
-- mpv is a media player based on MPlayer and mplayer2.
-- More info about mpv in: https://github.com/mpv-player/mpv
-- 
-- How to use this script:
-- 1- Copy it to the folder ~/.config/mpv/scripts
-- 2- Change the DESSUBDB variable to point to where the subdb.pl file is.
-- 3- Check the rest of the script for any change you may feel required
-- 4- Just launch your video in mpv and press 'b'

require 'os'

-- Change the path of the script
DESSUBDB = "/home/bloc67/.local/share/nautilus/scripts/OpenSubtitlesDownload.py"



function remote_subtitle()
	current_file =  mp.get_property("path");
	mp.osd_message("Searching on opensubtitles..", osd_time)
	os.execute(""..DESSUBDB.." \""..current_file.."\""); --Add extra options in this line
	mp.commandv("rescan_external_files", "reselect")
    local time = mp.get_property_number("time-pos")
    mp.osd_message("Reloading...")
    mp.commandv("loadfile", current_file, "replace", "start=" .. time)
end;

-- Uncoment the event registration line if you want the script to get download
-- a subtitle everytime you open a file with mpv
-- mp.register_event("file-loaded", get_subtitle)

-- Change the bindings to another key
mp.add_key_binding("b", "auto_load_subs", remote_subtitle)
