Mercury.Commands.AddPrivilege("viewbans")

-- Kick

MCMD = {
    ["Command"] = "kick",
    ["Verb"] = "kicked",
    ["RconUse"] = true,
    ["Useage"] = "!kick <player> <reason>",
    ["UseImmunity"] =  true,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = true,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[2] then 
        args[2] = "Kicked by administrator."
    end

    timer.Simple(0.1,function() 
        args[1]:Kick(args[2])
    end)


    for k,v in pairs(player.GetAll()) do 
        v:EmitSound("weapons/metal_gloves_hit_world3.wav")

        v:SendLua([[util.ScreenShake(LocalPlayer():GetPos(),5,150,0.5,500)]])
      
        
    end

        
    timer.Simple(1, function()
        for k,v in pairs(player.GetAll()) do 
            
                v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_fenderbender.wav")
            
        end
    end)

    return true, "heh",true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has kicked ", args[1], Mercury.Config.Colors.Arg ," (", args[2],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 

    local ctrl = vgui.Create( "DListView", frame)
    ctrl:AddColumn( "Players" )
    ctrl:SetSize( 210, 380 )    
    ctrl:SetPos( 10, 0 )
                
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 240, 10 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "Kicked by administrator." )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 240, 40 )
    DButtonRmsel:SetText( "Kick" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel:SetDisabled(true)
    DButtonRmsel.DoClick = function(self)
        if self:GetDisabled()==true then return false end
        local lid = ctrl:GetSelectedLine()
        ctrl:RemoveLine(lid)    
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("kick")
            net.WriteTable({selectedplayer,TextEntry:GetText()})
        net.SendToServer()
        self:SetDisabled(true)
    end
        
    local players = player.GetAll()
    local t = {}
    for _, ply in ipairs( players ) do
        local item = ctrl:AddLine( ply:Nick() )
        item.ply = ply
    end 
    function ctrl:OnRowSelected(lineid,isselected)
        local line_obj = self:GetLine(lineid)
        surface.PlaySound("buttons/button6.wav")
        DButtonRmsel:SetDisabled(false)
        selectedplayer = line_obj.ply
        return true
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)

-- FKick

MCMD = {
    ["Command"] = "fkick",
    ["Verb"] = "kicked",
    ["RconUse"] = true,
    ["Useage"] = "!fkick <player> <reason>",
    ["UseImmunity"] =  false,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = true,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[2] then 
        args[2] = "Kicked by Administrator."
    end

    timer.Simple(0.1,function() 
        //args[1]:Kick(args[2])
    end)


    for k,v in pairs(player.GetAll()) do 
        v:EmitSound("weapons/metal_gloves_hit_world3.wav")

        v:SendLua([[util.ScreenShake(LocalPlayer():GetPos(),5,150,0.5,500)]])
      
        
    end

        
    timer.Simple(1, function()
        for k,v in pairs(player.GetAll()) do 
            
                v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_fenderbender.wav")
            
        end
    end)

    return true, "heh",true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has kicked ", args[1], Mercury.Config.Colors.Arg ," (", args[2],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 

    local ctrl = vgui.Create( "DListView", frame)
    ctrl:AddColumn( "Players" )
    ctrl:SetSize( 210, 380 )    
    ctrl:SetPos( 10, 0 )
                
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 240, 10 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "Kicked by Administrator." )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 240, 40 )
    DButtonRmsel:SetText( "Fake Kick" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel:SetDisabled(true)
    DButtonRmsel.DoClick = function(self)
        if self:GetDisabled()==true then return false end
        local lid = ctrl:GetSelectedLine()
        ctrl:RemoveLine(lid)    
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("fkick")
            net.WriteTable({selectedplayer,TextEntry:GetText()})
        net.SendToServer()
        self:SetDisabled(true)
    end
        
    local players = player.GetAll()
    local t = {}
    for _, ply in ipairs( players ) do
        local item = ctrl:AddLine( ply:Nick() )
        item.ply = ply
    end 
    function ctrl:OnRowSelected(lineid,isselected)
        local line_obj = self:GetLine(lineid)
        surface.PlaySound("buttons/button6.wav")
        DButtonRmsel:SetDisabled(false)
        selectedplayer = line_obj.ply
        return true
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)

-- Ban

MCMD = {
    ["Command"] = "ban",
    ["Verb"] = "banned",
    ["RconUse"] = true,
    ["Useage"] = "!ban <player> <time> <reason>",
    ["UseImmunity"] =  true,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = true,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[2] or !tonumber(args[2]) then
        args[2]=0
    end
    if !args[3] then 
        args[3] = "Banned by administrator"
    end

    sts,err = Mercury.Bans.Add(caller,args[1],tonumber(args[2]),args[3])

    timer.Simple(0.1,function()
        args[1]:Kick(args[3])
    end)



    local bancolor = Color(0,0,255)
    local timestring = args[2] .. " minutes"
    if tonumber(args[2])==0 then
        bancolor = Color(255,0,0)
        timestring = "eternity"
    end


    for k,v in pairs(player.GetAll()) do 
        v:EmitSound("weapons/metal_gloves_hit_world3.wav")
        v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_collision.wav")
        v:SendLua([[util.ScreenShake(LocalPlayer():GetPos(),20,150,1.5,500)]])
      
        
    end

        
    timer.Simple(2, function()
        for k,v in pairs(player.GetAll()) do 
            
                v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_fenderbender.wav")
            
        end
    end)

    return true, "heh", true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has banned ", args[1], " for ", bancolor,timestring," ", Mercury.Config.Colors.Arg ," (", args[3],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 

    local ctrl = vgui.Create( "DListView", frame)
    ctrl:AddColumn( "Players" )
    ctrl:SetSize( 210, 380 )    
    ctrl:SetPos( 10, 0 )
    local ImmuLab = vgui.Create( "DLabel", frame )
    ImmuLab:SetPos( 240 , 10 )
    ImmuLab:SetText( "Reason" )
    ImmuLab:SetTextColor(Mercury.Config.Colors.Server)
    
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 240, 30 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "Banned by administrator" )


    local TimeLab = vgui.Create( "DLabel", frame )
    TimeLab:SetPos( 240 , 45 )
    TimeLab:SetText( "Time (0 = perma)" )
    TimeLab:SetTextColor(Mercury.Config.Colors.Server)
    TimeLab:SizeToContentsX()
    
    local BanLength = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    BanLength:SetPos( 240, 60 )
    BanLength:SetSize( 130, 20 )
    BanLength:SetText( "1440" )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 240, 100 )
    DButtonRmsel:SetText( "Ban this user" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel:SetDisabled(true)
    DButtonRmsel.DoClick = function(self)
        if self:GetDisabled()==true then return false end
        local lid = ctrl:GetSelectedLine()
        ctrl:RemoveLine(lid)    
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("ban")
            net.WriteTable({selectedplayer,BanLength:GetText(),TextEntry:GetText(),})
        net.SendToServer()
        self:SetDisabled(true)
    end

    local players = player.GetAll()
    local t = {}
    for _, ply in ipairs( players ) do
        local item = ctrl:AddLine( ply:Nick() )
        item.ply = ply
    end 
    function ctrl:OnRowSelected(lineid,isselected)
        local line_obj = self:GetLine(lineid)
        surface.PlaySound("buttons/button6.wav")
        DButtonRmsel:SetDisabled(false)
        selectedplayer = line_obj.ply
        return true
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)

-- FBan

MCMD = {
    ["Command"] = "fban",
    ["Verb"] = "banned",
    ["RconUse"] = true,
    ["Useage"] = "!fban <player> <time> <reason>",
    ["UseImmunity"] =  false,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = true,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[2] or !tonumber(args[2]) then
        args[2]=0
    end
    if !args[3] then 
        args[3] = "Banned by administrator"
    end

    //sts,err = Mercury.Bans.Add(caller,args[1],tonumber(args[2]),args[3])

    timer.Simple(0.1,function()
        //args[1]:Kick(args[3])
    end)



    local bancolor = Color(0,0,255)
    local timestring = args[2] .. " minutes"
    if tonumber(args[2])==0 then
        bancolor = Color(255,0,0)
        timestring = "eternity"
    end


    for k,v in pairs(player.GetAll()) do 
        v:EmitSound("weapons/metal_gloves_hit_world3.wav")
        v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_collision.wav")
        v:SendLua([[util.ScreenShake(LocalPlayer():GetPos(),20,150,1.5,500)]])
      
        
    end

        
    timer.Simple(2, function()
        for k,v in pairs(player.GetAll()) do 
            
                v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_fenderbender.wav")
            
        end
    end)

    return true, "heh", true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has banned ", args[1], " for ", bancolor,timestring," ", Mercury.Config.Colors.Arg ," (", args[3],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 

    local ctrl = vgui.Create( "DListView", frame)
    ctrl:AddColumn( "Players" )
    ctrl:SetSize( 210, 380 )    
    ctrl:SetPos( 10, 0 )
    local ImmuLab = vgui.Create( "DLabel", frame )
    ImmuLab:SetPos( 240 , 10 )
    ImmuLab:SetText( "Reason" )
    ImmuLab:SetTextColor(Mercury.Config.Colors.Server)
    
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 240, 30 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "Banned by administrator" )


    local TimeLab = vgui.Create( "DLabel", frame )
    TimeLab:SetPos( 240 , 45 )
    TimeLab:SetText( "Time (0 = perma)" )
    TimeLab:SetTextColor(Mercury.Config.Colors.Server)
    TimeLab:SizeToContentsX()
    
    local BanLength = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    BanLength:SetPos( 240, 60 )
    BanLength:SetSize( 130, 20 )
    BanLength:SetText( "1440" )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 240, 100 )
    DButtonRmsel:SetText( "Fake Ban" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel:SetDisabled(true)
    DButtonRmsel.DoClick = function(self)
        if self:GetDisabled()==true then return false end
        local lid = ctrl:GetSelectedLine()
        ctrl:RemoveLine(lid)    
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("fban")
            net.WriteTable({selectedplayer,BanLength:GetText(),TextEntry:GetText(),})
        net.SendToServer()
        self:SetDisabled(true)
    end

    local players = player.GetAll()
    local t = {}
    for _, ply in ipairs( players ) do
        local item = ctrl:AddLine( ply:Nick() )
        item.ply = ply
    end 
    function ctrl:OnRowSelected(lineid,isselected)
        local line_obj = self:GetLine(lineid)
        surface.PlaySound("buttons/button6.wav")
        DButtonRmsel:SetDisabled(false)
        selectedplayer = line_obj.ply
        return true
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)

-- Banid

MCMD = {
    ["Command"] = "banid",
    ["Verb"] = "banned ID",
    ["RconUse"] = true,
    ["Useage"] = "!banid <steamid> <time> <reason>",
    ["UseImmunity"] =  true,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = false,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[1] then 
        return false,"No steamid specified" end
    if !args[2] or !tonumber(args[2]) then
        return false,"No time specified"
    end
    if !args[3] then 
        args[3] = "Banned by administrator"
    end

    if !string.find(string.upper(args[1]),"STEAM_") then
        return false,"That is not a valid steamid."
    end

    local sts,err = Mercury.Bans.Add(caller,args[1],tonumber(args[2]),args[3])

    local bancolor = Color(0,0,255)
    local timestring = args[2] .. " minutes"
    if tonumber(args[2])==0 then
        bancolor = Color(255,0,0)
        timestring = "eternity"
    end

    for k,v in pairs(player.GetAll()) do 
        v:EmitSound("weapons/metal_gloves_hit_world3.wav")

        v:SendLua([[util.ScreenShake(LocalPlayer():GetPos(),5,150,0.5,500)]])
      
        
    end

        
    timer.Simple(1, function()
        for k,v in pairs(player.GetAll()) do 
            
                v:EmitSound("gsgtrainsounds/other/joke/lionel_traintown/traintown_fenderbender.wav")
            
        end
    end)

    return true, "heh", true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has banned ", args[1], " for ", bancolor,timestring," ", Mercury.Config.Colors.Arg ," (", args[3],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 
         
    local ImmuLab = vgui.Create( "DLabel", frame )
    ImmuLab:SetPos( 10 , 0 )
    ImmuLab:SetText( "Reason" )
    ImmuLab:SetTextColor(Mercury.Config.Colors.Server)
    
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 10, 20 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "Banned by administrator" )

    local TimeLab = vgui.Create( "DLabel", frame )
    TimeLab:SetPos( 10 , 40 )
    TimeLab:SetText( "Time (0 = perma)" )
    TimeLab:SetTextColor(Mercury.Config.Colors.Server)
    TimeLab:SizeToContentsX()

    local BanLength = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    BanLength:SetPos( 10, 60 )
    BanLength:SetSize( 130, 20 )
    BanLength:SetText( "1440" )

    local TimeLab = vgui.Create( "DLabel", frame )
    TimeLab:SetPos( 10 , 80 )
    TimeLab:SetText( "Steam ID" )
    TimeLab:SetTextColor(Mercury.Config.Colors.Server)
    TimeLab:SizeToContentsX()

    local SteamID = vgui.Create( "DTextEntry", frame )  -- create the form as a child of frame
    SteamID:SetPos( 10, 100 )
    SteamID:SetSize( 130, 20 )
    SteamID:SetText( "" )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 10, 180 )
    DButtonRmsel:SetText( "Ban this ID" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel.DoClick = function(self)
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("banid")
            net.WriteTable({SteamID:GetText(),BanLength:GetText(),TextEntry:GetText(),})
        net.SendToServer()
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)

-- Unban

MCMD = {
    ["Command"] = "unban",
    ["Verb"] = "unbanned",
    ["RconUse"] = true,
    ["Useage"] = "unban <steamid>",
    ["UseImmunity"] =  false,
    ["HasMenu"] = true,
    ["Category"] = "Player Management",
    ["UseCustomPrivCheck"] = false,
    ["PlayerTarget"] = false,
    ["AllowWildcard"] = false
}

function callfunc(caller,args)
    if !args[1] then 
        return false,"No steamid specified" end
    if !args[2] then
        args[2] = "Unbanned by administrator."
    end

    if !string.find(string.upper(args[1]),"STEAM_") then
        return false,"That is not a valid steamid."
    end

    sts,err = Mercury.Bans.UnbanID(args[1],args[2])
    if sts~=true then
        return false,err
    end

    return true, "heh", true, {Mercury.Config.Colors.Server,caller,Mercury.Config.Colors.Default," has unbanned ", args[1], Mercury.Config.Colors.Arg ," (", args[2],")"}
end

function MCMD.GenerateMenu(frame)
    local selectedplayer = nil 
 
    local ImmuLab = vgui.Create( "DLabel", frame )
    ImmuLab:SetPos( 10 , 0 )
    ImmuLab:SetText( "Reason" )
    ImmuLab:SetTextColor(Mercury.Config.Colors.Server)
    
    local TextEntry = vgui.Create( "DTextEntry", frame )    -- create the form as a child of frame
    TextEntry:SetPos( 10, 20 )
    TextEntry:SetSize( 130, 20 )
    TextEntry:SetText( "UnBanned by administrator" )

    local TimeLab = vgui.Create( "DLabel", frame )
    TimeLab:SetPos( 10 , 40 )
    TimeLab:SetText( "Steam ID" )
    TimeLab:SetTextColor(Mercury.Config.Colors.Server)
    TimeLab:SizeToContentsX()

    local SteamID = vgui.Create( "DTextEntry", frame )  -- create the form as a child of frame
    SteamID:SetPos( 10, 60 )
    SteamID:SetSize( 130, 20 )
    SteamID:SetText( "" )

    local DButtonRmsel = vgui.Create( "DButton" , frame)
    DButtonRmsel:SetPos( 10, 180 )
    DButtonRmsel:SetText( "UnBan this ID" )
    DButtonRmsel:SetSize( 130, 60 )
    DButtonRmsel.DoClick = function(self)
        surface.PlaySound("buttons/button3.wav")
        net.Start("Mercury:Commands")
            net.WriteString("unban")
            net.WriteTable({SteamID:GetText(),TextEntry:GetText()})
        net.SendToServer()
    end
end

Mercury.Commands.AddCommand(MCMD.Command, MCMD, callfunc)
