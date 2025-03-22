function GuildRosterDumper_OnLoad()
		SLASH_GUILDDUMP1 = "/grd"
		SLASH_GUILDDUMP2 = "/grdump"
		SlashCmdList["GUILDDUMP"] = GuildRosterDumper_exportData
end

function GuildRosterDumper_exportData()
		GuildRosterDumperData = {}
		GuildRosterDumperDataDB = {}
		
		for i = 1, GetNumGuildMembers(true) do
				DEFAULT_CHAT_FRAME:AddMessage("Attempting RosterNum" .. i .. "\r\n")
		
				local name, rank, rankIndex, level, class, zone, note, officerNote, _ = GetGuildRosterInfo(i)

				GuildRosterDumperDataDB[i] = {}
				GuildRosterDumperDataDB[i].name = name
				GuildRosterDumperDataDB[i].rank = rank
				GuildRosterDumperDataDB[i].rankIndex = rankIndex
				GuildRosterDumperDataDB[i].level = level
				GuildRosterDumperDataDB[i].class = class
				GuildRosterDumperDataDB[i].zone = zone
				GuildRosterDumperDataDB[i].note = note
				GuildRosterDumperDataDB[i].officerNote = officerNote

		end
				
		guild = GetGuildInfo("player")
		GuildRosterDumperDataFrame = "Guild Roster Dump for " .. guild .. " at " .. date("%Y-%m-%d %H:%M:%S") .. "\r" .. "\r" .. "\r" .. "\r" .. "name,rank,level,class,zone,note,officerNote" .. "\r"  .. "\r" .. "\r"
		
		for i in GuildRosterDumperDataDB do
				GuildRosterDumperDataFrame = GuildRosterDumperDataFrame .. GuildRosterDumperDataDB[i].name .. "," .. GuildRosterDumperDataDB[i].rank .. "," .. GuildRosterDumperDataDB[i].level .. "," .. GuildRosterDumperDataDB[i].class .. "," .. GuildRosterDumperDataDB[i].zone .. "," .. GuildRosterDumperDataDB[i].note .. "," .. GuildRosterDumperDataDB[i].officerNote .. "\r"
		end
		
		GuildRosterDumperData = GuildRosterDumperDataFrame
		
		GuildRosterDumper_ExportRaidFrameEditBox1:SetFont("Fonts\\FRIZQT__.TTF", "8")
		GuildRosterDumper_ExportRaidFrameEditBox1Left:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1Middle:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1Right:Hide()
		GuildRosterDumper_ExportRaidFrameEditBox1:SetText(GuildRosterDumperData)
		
		ShowUIPanel(GuildRosterDumper_ExportRaidFrame, 1)
	
		DEFAULT_CHAT_FRAME:AddMessage("Guild Roster dumped to WTF\\Account\\ACCOUNTNAME\\SavedVariables\\GuildRosterDumperData.lua", 1, 1, 0)
		DEFAULT_CHAT_FRAME:AddMessage("Reload UI or Logout to save the file", 1, 1, 0)
end
