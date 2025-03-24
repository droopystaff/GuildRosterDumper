function GuildRosterDumper_OnLoad()
		SLASH_GUILDDUMP1 = "/grd"
		SLASH_GUILDDUMP2 = "/grdump"
		SlashCmdList["GUILDDUMP"] = GuildRosterDumper_exportData
end

function isEmpty(s)
	return s == nil or s == ''
end

function GuildRosterDumper_exportData()
		GuildRosterDumperData = {}
		GuildRosterDumperDataDB = {}
		
		for i = 1, GetNumGuildMembers(true) do
				local name, rank, _, level, class, _, note, officerNote, _ = GetGuildRosterInfo(i)
				local lastYear, lastMonth, lastDay, lastHour = GetGuildRosterLastOnline(i)
				
				DEFAULT_CHAT_FRAME:AddMessage("Attempting RosterNum" .. i .. " - " .. name .. "\r\n")

				if string.find(note, ",") then
					note = string.gsub(note, "%,", "%/")
				end
				
				if isEmpty(note) then
					note = " "
				end
				
				if isEmpty(officerNote) then
					officerNote = " "
				end

				if isEmpty(lastYear) then
					lastYear = 0
				end
				
				if isEmpty(lastMonth) then
					lastMonth = 0
				end
				
				if isEmpty(lastDay) then
					lastDay = 0
				end
				
				if isEmpty(lastHour) then
					lastHour = 0
				end

				GuildRosterDumperDataDB[i] = {}
				GuildRosterDumperDataDB[i].name = name
				GuildRosterDumperDataDB[i].rank = rank
				GuildRosterDumperDataDB[i].level = level
				GuildRosterDumperDataDB[i].class = class
				GuildRosterDumperDataDB[i].note = note
				GuildRosterDumperDataDB[i].officerNote = officerNote
				GuildRosterDumperDataDB[i].lastYear = lastYear
				GuildRosterDumperDataDB[i].lastMonth = lastMonth
				GuildRosterDumperDataDB[i].lastDay = lastDay
				GuildRosterDumperDataDB[i].lastHour = lastHour

		end
				
		guild = GetGuildInfo("player")
		GuildRosterDumperDataFrame = "Guild Roster Dump for " .. guild .. " at " .. date("%Y-%m-%d %H:%M:%S") .. "\r" .. "\r" .. "\r" .. "\r" .. "name,rank,level,class,note,officerNote,yearsOffline,monthsOffline,daysOffline,hoursOffline" .. "\r"  .. "\r" .. "\r"
		
		for i in GuildRosterDumperDataDB do
				GuildRosterDumperDataFrame = GuildRosterDumperDataFrame .. GuildRosterDumperDataDB[i].name .. "," .. GuildRosterDumperDataDB[i].rank .. "," .. GuildRosterDumperDataDB[i].level .. "," .. GuildRosterDumperDataDB[i].class .. "," .. GuildRosterDumperDataDB[i].note .. "," .. GuildRosterDumperDataDB[i].officerNote .. "," .. GuildRosterDumperDataDB[i].lastYear .. "," .. GuildRosterDumperDataDB[i].lastMonth .. "," .. GuildRosterDumperDataDB[i].lastDay .. "," .. GuildRosterDumperDataDB[i].lastHour .. "\r"
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