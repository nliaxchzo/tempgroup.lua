if SERVER then
    hook.Add("PlayerSay", "FreeVip", function(ply, text)
        if text == "!vip" then -- command
            if ply:GetUserGroup() == "user" then
                if file.Exists("free_vips/" .. ply:SteamID64() .. ".txt", "DATA") == true then return "" end
                file.CreateDir("free_vips")
                local date = os.time() + 172800 -- time's
                file.Write("free_vips/" .. ply:SteamID64() .. ".txt", date)
                RunConsoleCommand("ulx", "tempadduser", ply:Name(), "vip", "1440", "user") -- give group
                ply:ChatPrint("Вы получили Vip на 24 часа!")
                return ""
            else
                ply:ChatPrint("У вас уже есть привилегия!")
                return ""
            end
        end
    end)
end
