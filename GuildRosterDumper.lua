function GuildRosterDumper_OnLoad()
		SLASH_GUILDDUMP1 = "/grd"
		SLASH_GUILDDUMP2 = "/grdump"
		SlashCmdList["GUILDROSTERDUMP"] = GuildRosterDumper_exportData
end

function GuildRosterDumper_exportData()
		GuildRosterData = {}
		
		for i = 1, GetNumGuildMembers(true) do
				local name, arg2, arg3, arg4, arg5, arg6, arg7, officernote, arg8, arg9 = GetGuildRosterInfo(i)
				
				GuildRosterDumperDataDB[i] = {}
				GuildRosterDumperDataDB[i].name = name
				GuildRosterDumperDataDB[i].class = class
				GuildRosterDumperDataDB[i].officernote = officernote
				GuildRosterDumperDataDB[i].arg2 = arg2
				GuildRosterDumperDataDB[i].arg3 = arg3
				GuildRosterDumperDataDB[i].arg4 = arg4
				GuildRosterDumperDataDB[i].arg5 = arg5
				GuildRosterDumperDataDB[i].arg6 = arg6
				GuildRosterDumperDataDB[i].arg7 = arg7
				GuildRosterDumperDataDB[i].arg8 = arg8
				GuildRosterDumperDataDB[i].arg9 = arg9
		end
				
		guild = GetGuildInfo("player")
		GuildRosterDumperDataFrame = "Guild Roster Dump for " .. guild .. " at " .. date("%y-%m-%d %H:%M:%S") .. "\r\n" .. "\r\n"
		
		for i in GuildRosterDumperDB do
				GuildRosterDumperFrame = GuildRosterDumperDataFrame .. GuildRosterDumperDataDB[i].name .. "," .. GuildRosterDumperDataDB[i].class .. "," .. GuildRosterDumperDataDB[i].officernote .. "," .. GuildRosterDumperDataDB[i].arg2 .. "," .. GuildRosterDumperDataDB[i].arg3 .. "," .. GuildRosterDumperDataDB[i].arg4 .. "," .. GuildRosterDumperDataDB[i].arg5 .. "," .. GuildRosterDumperDataDB[i].arg6 .. "," .. GuildRosterDumperDataDB[i].arg7 .. "," .. GuildRosterDumperDataDB[i].arg8 .. "," .. GuildRosterDumperDataDB[i].arg9 .. "\r\n"
		end
		
		GuildRosterDumper_ExportRaidFrameEditBox1:SetFont("Fonts\\FRIZQT__.TTF", "8")
		GuildRosterDumper_ExportRaidFrameEditBox1Left:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1Middle:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1Right:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1:SetText(GuildRosterDumperDataFrame)
		
		ShowUIPanel(GuildRosterDumper_ExportRaidFrame, 1)
	
		DEFAULT_CHAT_FRAME:AddMessage("Guild Roster dumped to WTF\\Account\\ACCOUNTNAME\\SavedVariables\\GuildRosterDumperData.lua", 1, 1, 0)
		DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end