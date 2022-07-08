-- Decompiled with the Synapse X Luau decompiler.

local l__LocalPlayer__1 = game:GetService("Players").LocalPlayer;
local l__PlayerGui__2 = l__LocalPlayer__1.PlayerGui;
local l__mouse__3 = l__LocalPlayer__1:GetMouse();
local l__StarterGui__4 = game:GetService("StarterGui");
local l__TweenService__5 = game:GetService("TweenService");
local l__RunService__6 = game:GetService("RunService");
local l__Debris__7 = game:GetService("Debris");
local l__ReplicatedStorage__8 = game:GetService("ReplicatedStorage");
local l__Players__9 = game:GetService("Players");
local l__HttpService__10 = game:GetService("HttpService");
local l__GuiService__11 = game:GetService("GuiService");
local l__SoundService__12 = game:GetService("SoundService");
local l__MarketplaceService__13 = game:GetService("MarketplaceService");
local l__UserInputService__14 = game:GetService("UserInputService");
l__UserInputService__14.MouseIconEnabled = false;
local l__Assets__15 = l__ReplicatedStorage__8:WaitForChild("Assets");
local l__UI__16 = l__PlayerGui__2:WaitForChild("UI");
local v17 = require(l__Assets__15.Modules.Network);
local v18 = require(l__Assets__15.Modules.Gamepasses);
local v19 = require(l__Assets__15.Modules.Gamemodes);
local v20 = require(l__Assets__15.Modules.Levels);
local v21 = require(l__Assets__15.Modules.Titles);
local v22 = 0;
local v23 = {};
local v24 = l__Assets__15.Miscs.getMoreGamepass:Clone();
local v25 = false;
local l__TouchEnabled__26 = l__UserInputService__14.TouchEnabled;
local l__GamepadEnabled__27 = l__UserInputService__14.GamepadEnabled;
l__Assets__15.Sounds.hum:Play();
local u1 = { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "_", "+", "-", "=", "<", ">", "?", "/" };
local u2 = Random.new();
function getRandomLetter()
	return u1[u2:NextInteger(1, #u1)];
end;
function getRandomString(p1)
	local v28 = nil;
	local v29 = p1 and 10;
	v28 = "";
	local v30 = 1 - 1;
	while true do
		v28 = v28 .. getRandomLetter();
		if 0 <= 1 then
			if v30 < v29 then

			else
				break;
			end;
		elseif v29 < v30 then

		else
			break;
		end;
		v30 = v30 + 1;	
	end;
	return local v31;
end;
function getTitleIndex(p2)
	local v32, v33, v34 = pairs(v21);
	while true do
		local v35, v36 = v32(v33, v34);
		if v35 then

		else
			break;
		end;
		v34 = v35;
		if v36.name == p2 then
			return v35;
		end;	
	end;
	return false;
end;
function clickEffect()
	local v37 = l__Assets__15.Miscs.click:Clone();
	local v38 = l__UserInputService__14:GetMouseLocation();
	v37.Position = UDim2.new(0, v38.x, 0, v38.y);
	v37.Parent = l__UI__16;
	l__Debris__7:AddItem(v37, 1);
	v37.UIScale.Scale = 0.15;
	l__TweenService__5:Create(v37.UIScale, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		Scale = 1
	}):Play();
	l__TweenService__5:Create(v37, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		ImageTransparency = 1
	}):Play();
end;
function shallowCopy(p3)
	local v39 = {};
	local v40, v41, v42 = pairs(p3);
	while true do
		local v43, v44 = v40(v41, v42);
		if v43 then

		else
			break;
		end;
		v42 = v43;
		v39[v43] = v44;	
	end;
	return v39;
end;
function playsound(p4, p5, p6, p7, p8)
	local v45 = typeof(p5) == "Vector3";
	if v45 then
		local v46 = Instance.new("Attachment");
		v46.WorldPosition = p5;
		v46.Parent = workspace.Terrain;
		p5 = v46;
	end;
	local v47 = p4:Clone();
	v47.Volume = p6 or v47.Volume;
	v47.PlaybackSpeed = p7 or (p8 and v47.PlaybackSpeed + math.random() * 0.4 or v47.PlaybackSpeed);
	v47.Parent = p5;
	v47:Play();
	l__Debris__7:AddItem(not v45 and v47 or p5, v47.TimeLength + 0.5);
end;
function isVisible(p9)
	local v48 = p9:FindFirstAncestorWhichIsA("ScreenGui");
	if v48 then
		if v48.Enabled == false then
			return false;
		end;
	end;
	while true do
		if p9 == v48 then
			if p9 ~= nil then

			else
				break;
			end;
		end;
		if p9 ~= nil then

		else
			break;
		end;
		if p9 then
			if p9:IsA("GuiObject") then
				if p9.Visible == false then
					return false;
				end;
			end;
		end;
		p9 = p9.Parent;	
	end;
	return true;
end;
function output(p10, p11, p12)
	playsound(l__Assets__15.Sounds.ping, l__PlayerGui__2);
	local v49 = l__Assets__15.Miscs.output:Clone();
	v49.Text = p10;
	v49.TextColor3 = p12;
	v49.Parent = l__UI__16.Output;
	l__Debris__7:AddItem(v49, p11 + 1);
	task.delay(p11, function()
		l__TweenService__5:Create(v49, TweenInfo.new(1, Enum.EasingStyle.Quint), {
			TextTransparency = 1
		}):Play();
	end);
end;
function isCreated()
	local v50, v51, v52 = pairs(l__ReplicatedStorage__8.Rooms:GetChildren());
	while true do
		local v53, v54 = v50(v51, v52);
		if v53 then

		else
			break;
		end;
		v52 = v53;
		if v54.creator.Value == l__LocalPlayer__1.Name then
			return true;
		end;	
	end;
	return false;
end;
local u3 = nil;
local u4 = 0;
function clearTitleEffects()
	if u3 then
		v21[u4].destroy(u3);
		u3 = nil;
	end;
end;
function clearTitleEffects2(p13, p14)
	v21[getTitleIndex(p13)].destroy(p14);
end;
function menu(p15)
	l__UI__16.Frame.mainFrame.roomFrame.Visible = p15 == "room";
	l__UI__16.Frame.mainFrame.buttons.Visible = p15 == "main";
	l__UI__16.Frame.mainFrame.line.Visible = p15 == "main";
	l__UI__16.Frame.mainFrame.lobby.Visible = p15 == "main";
end;
local u5 = nil;
local u6 = "";
function updateRoom()
	if u5 then
		local l__roomFrame__55 = l__UI__16.Frame.mainFrame.roomFrame;
		l__roomFrame__55.title.Text = u5.Name;
		l__roomFrame__55.code.Text = "ROOM CODE: " .. u5.code.Value;
		if u5.isLock.Value == false then
			local v56 = "PUBLIC";
		else
			v56 = u5.creator.Value == l__LocalPlayer__1.Name and "PASSWORD: " .. u6 or "PRIVATE";
		end;
		l__roomFrame__55.pw.Text = v56;
		if u5.isLock.Value == false then
			local v57 = "rbxassetid://3523258602";
		else
			v57 = "rbxassetid://3523247585";
		end;
		l__roomFrame__55.passwordIcon.Image = v57;
	end;
end;
function getSlotPosition(p16, p17)
	local v58 = 1;
	local v59, v60, v61 = pairs(p17:GetChildren());
	while true do
		local v62, v63 = v59(v60, v61);
		if v62 then

		else
			break;
		end;
		v61 = v62;
		if v63.Name == p16 then
			return v58;
		end;
		v58 = v58 + 1;	
	end;
	return v58;
end;
local u7 = 1;
local u8 = 1;
local u9 = 0;
function updateLobbyPanel()
	l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeType.Text = v19[u7].name;
	l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeDesc.desc.Text = v19[u7].desc;
	l__UI__16.Frame.mainFrame.roomFrame.panel.levelType.Text = v20[u8].level .. ". " .. (v20[u8].level <= u9 and v20[u8].name or getRandomString(#v20[u8].name));
end;
updateLobbyPanel();
local u10 = {};
local u11 = {
	left = nil, 
	right = nil
};
local u12 = {
	left = nil, 
	right = nil
};
function cleanLobby(p18)
	if not p18 then
		menu("main");
	end;
	local v64, v65, v66 = pairs(u10);
	while true do
		local v67, v68 = v64(v65, v66);
		if v67 then

		else
			break;
		end;
		v66 = v67;
		v68:Disconnect();	
	end;
	if not p18 then
		u5 = nil;
	end;
	u11.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
	u11.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
	u7 = 1;
	u12.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
	u12.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
	u8 = 1;
	local v69, v70, v71 = pairs(l__UI__16.Frame.mainFrame.roomFrame.playerList:GetDescendants());
	while true do
		local v72, v73 = v69(v70, v71);
		if v72 then

		else
			break;
		end;
		v71 = v72;
		if v73.Name == "id" then
			if v73:IsA("StringValue") then
				if v73.Value ~= "" then
					clearTitleEffects2(v73.title.Value, v73.Value);
					v73.Value = "";
					v73.title.Value = "";
				end;
			end;
		end;	
	end;
	updateLobbyPanel();
end;
local u13 = { "rbxassetid://9829333395", "rbxassetid://9829333225", "rbxassetid://9829348459" };
function handleRoom(p19)
	cleanLobby(true);
	menu("room");
	local l__roomFrame__14 = l__UI__16.Frame.mainFrame.roomFrame;
	local function v74()
		u7 = p19.gamemode.Value;
		u11.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
		u11.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
		u8 = p19.level2.Value;
		u12.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
		u12.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
		updateLobbyPanel();
		local v75 = p19.players:GetChildren();
		local v76, v77, v78 = pairs(l__roomFrame__14.playerList:GetChildren());
		while true do
			local v79, v80 = v76(v77, v78);
			if v79 then

			else
				break;
			end;
			v78 = v79;
			if v80:IsA("Frame") then
				local v81 = false;
				if tonumber(v80.Name) <= #v75 then
					v81 = v75[tonumber(v80.Name)];
				end;
				if v81 then
					local function v82()
						v80.platform.Image = u13[v81.Value.platform.Value] and "rbxassetid://94011556";
						v80.platform.Visible = true;
						v80.owner.Visible = p19.creator.Value == v81.Value.Name;
						v80.dev.Visible = v81.Value.isDev.Value;
						local v83 = false;
						if p19.creator.Value ~= v81.Value.Name then
							v83 = p19.creator.Value == l__LocalPlayer__1.Name;
						end;
						v80.transfer.Visible = v83;
						if v80.transfer.Visible then
							if u10["t" .. v80.Name] then
								u10["t" .. v80.Name]:Disconnect();
								u10["t" .. v80.Name] = nil;
							end;
							u10["t" .. v80.Name] = v80.transfer.MouseButton1Click:Connect(function()
								clickEffect();
								playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
								local v84, v85 = v17:InvokeServer("transfer", v81.Value, p19);
								if v84 then
									u10["t" .. v80.Name]:Disconnect();
									u10["t" .. v80.Name] = nil;
								end;
								output(unpack(v85));
							end);
						end;
					end;
					u10[#u10 + 1] = p19.creator.Changed:Connect(v82);
					v82();
					local v86 = string.sub(v81.Name, 1, 10);
					if #v86 < #v81.Name then
						v86 = v86 .. "...";
					end;
					v80.username.Text = v86;
					v80.UIStroke.Color = v81.Name == l__LocalPlayer__1.Name and Color3.fromRGB(170, 255, 127) or Color3.fromRGB(255, 255, 255);
					local v87, v88 = l__Players__9:GetUserThumbnailAsync(v81.Value.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420);
					v80.profile.ImageColor3 = Color3.fromRGB(255, 255, 255);
					v80.profile.Image = v87;
					if v80.id.Value ~= "" then
						clearTitleEffects2(v80.id.title.Value, v80.id.Value);
						v80.id.Value = "";
						v80.id.title.Value = "";
					end;
					if v81.Value.title.Value ~= "None" then
						task.spawn(function()
							v80.id.Value = v21[getTitleIndex(v81.Value.title.Value)].create(v80.username, v80.username);
							v80.id.title.Value = v81.Value.title.Value;
						end);
					end;
				else
					if u10["t" .. v80.Name] then
						u10["t" .. v80.Name]:Disconnect();
						u10["t" .. v80.Name] = nil;
					end;
					if v80.id.Value ~= "" then
						clearTitleEffects2(v80.id.title.Value, v80.id.Value);
						v80.id.Value = "";
						v80.id.title.Value = "";
					end;
					v80.UIStroke.Color = Color3.fromRGB(255, 255, 255);
					v80.platform.Visible = false;
					v80.owner.Visible = false;
					v80.dev.Visible = false;
					v80.kick.Visible = false;
					v80.transfer.Visible = false;
					v80.username.TextColor3 = Color3.fromRGB(181, 181, 181);
					v80.username.Text = ". . .";
					v80.profile.ImageColor3 = Color3.fromRGB(67, 67, 67);
					v80.profile.Image = "rbxassetid://9186115622";
				end;
			end;		
		end;
	end;
	v74();
	table.insert(u10, l__LocalPlayer__1.inLobby.Changed:Connect(function()
		if l__LocalPlayer__1.inLobby.Value == false then
			l__UI__16.Loading.Visible = false;
			cleanLobby();
		end;
	end));
	table.insert(u10, p19.isQueue.Changed:Connect(function()
		if p19.isQueue.Value == false then
			l__UI__16.Loading.Visible = false;
		end;
	end));
	local function v89()
		if u10.c1 then
			u10.c1:Disconnect();
			u10.c1 = nil;
		end;
		if u10.c2 then
			u10.c2:Disconnect();
			u10.c2 = nil;
		end;
		local v90, v91, v92 = pairs(l__roomFrame__14.panel:GetChildren());
		while true do
			local v93, v94 = v90(v91, v92);
			if v93 then

			else
				break;
			end;
			v92 = v93;
			if v94:IsA("ImageButton") then
				v94.Visible = p19.creator.Value == l__LocalPlayer__1.Name;
			end;		
		end;
		if p19.creator.Value ~= l__LocalPlayer__1.Name then
			u10.c1 = p19.gamemode.Changed:Connect(function()
				l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeType.Text = v19[p19.gamemode.Value].name;
				l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeDesc.desc.Text = v19[p19.gamemode.Value].desc;
			end);
			u10.c2 = p19.level2.Changed:Connect(function()
				l__UI__16.Frame.mainFrame.roomFrame.panel.levelType.Text = v20[p19.level2.Value].level .. ". " .. (v20[p19.level2.Value].level <= u9 and v20[p19.level2.Value].name or getRandomString(#v20[p19.level2.Value].name));
			end);
		end;
	end;
	table.insert(u10, p19.creator.Changed:Connect(v89));
	v89();
	table.insert(u10, p19.players.ChildAdded:Connect(v74));
	table.insert(u10, p19.players.ChildRemoved:Connect(v74));
end;
local u15 = false;
local u16 = "";
function joinRoom(p20)
	if not u15 then
		if 4 < #l__ReplicatedStorage__8.Rooms[p20].players:GetChildren() then
			return;
		end;
	else
		return;
	end;
	local v95 = l__ReplicatedStorage__8.Rooms[p20];
	if v95.isLock.Value == true then
		l__UI__16.Frame.passwordInput.Visible = true;
		u15 = true;
		while true do
			if u15 then

			else
				break;
			end;
			task.wait(0.03333333333333333);		
		end;
	end;
	local v96, v97 = v17:InvokeServer("joinLobby", p20, u16);
	if v96 then
		u5 = v95;
		updateRoom();
		handleRoom(v95);
	end;
	output(unpack(v97));
end;
function findRoomWithCode(p21)
	local v98, v99, v100 = pairs(l__ReplicatedStorage__8.Rooms:GetChildren());
	while true do
		local v101, v102 = v98(v99, v100);
		if v101 then

		else
			break;
		end;
		v100 = v101;
		if string.lower(v102.code.Value) == p21 then
			return v102.Name;
		end;	
	end;
	return false;
end;
local u17 = {};
local u18 = {};
function updateRoomList(p22, p23)
	local v103 = 0;
	if p23 == "added" then
		pcall(function()
			if p22:IsA("Folder") then
				local v104 = l__HttpService__10:GenerateGUID(false);
				local v105 = l__Assets__15.Miscs.roomList:Clone();
				v105.title.Text = p22.Name;
				v105.Name = p22.Name;
				v105.uid.Value = v104;
				v105.Parent = l__UI__16.Frame.mainFrame.lobby.list;
				if p22.isLock.Value == true then
					v105.passwordIcon.Image = "rbxassetid://3523247585";
				end;
				local function v106()
					local v107 = #p22.players:GetChildren();
					v105.players.Text = v107 .. "/4";
					if 4 <= v107 then
						v105.join.button.Text = "FULL";
						v105.join.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
						return;
					end;
					if p22.isQueue.Value == true then
						v105.join.button.Text = "QUEUE";
						v105.join.BackgroundColor3 = Color3.fromRGB(255, 255, 0);
						return;
					end;
					v105.join.button.Text = "JOIN";
					v105.join.BackgroundColor3 = Color3.fromRGB(170, 255, 127);
				end;
				v106();
				u17[v105.Name] = v104;
				u18[v104] = {};
				local v108 = u18[v104];
				v108[#v108 + 1] = p22.players.ChildAdded:Connect(v106);
				v108[#v108 + 1] = p22.players.ChildRemoved:Connect(v106);
				v108[#v108 + 1] = p22.isQueue.Changed:Connect(v106);
				v108[#v108 + 1] = v105.join.button.MouseButton1Click:Connect(function()
					clickEffect();
					playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
					joinRoom(p22.Name);
				end);
			end;
		end);
		return v103;
	end;
	if p23 == "removed" then
		local v109 = l__UI__16.Frame.mainFrame.lobby.list:FindFirstChild(p22.Name);
		if v109 then
			if u18[v109.uid.Value] then
				local v110, v111, v112 = pairs(u18[v109.uid.Value]);
				while true do
					local v113, v114 = v110(v111, v112);
					if v113 then

					else
						break;
					end;
					v112 = v113;
					v114:Disconnect();				
				end;
				v109:Destroy();
				u18[u17[v109.Name]] = nil;
				u17[v109.Name] = nil;
				return v103;
			end;
		end;
	else
		local v115, v116, v117 = pairs(l__UI__16.Frame.mainFrame.lobby.list:GetChildren());
		while true do
			local v118, v119 = v115(v116, v117);
			if v118 then

			else
				break;
			end;
			v117 = v118;
			if v119:IsA("Frame") then
				updateRoomList(v119, "removed");
			end;		
		end;
		local v120, v121, v122 = pairs(l__ReplicatedStorage__8.Rooms:GetChildren());
		while true do
			local v123, v124 = v120(v121, v122);
			if v123 then

			else
				break;
			end;
			v122 = v123;
			v103 = v103 + 1;
			updateRoomList(v124, "added");
			task.wait(0.03333333333333333);		
		end;
	end;
	return v103;
end;
task.spawn(updateRoomList);
table.insert(v23, l__ReplicatedStorage__8.Rooms.ChildAdded:Connect(function(p24)
	task.wait(0.03333333333333333);
	updateRoomList(p24, "added");
end));
table.insert(v23, l__ReplicatedStorage__8.Rooms.ChildRemoved:Connect(function(p25)
	updateRoomList(p25, "removed");
end));
function changeWindows(p26)
	l__UI__16.Frame.mainFrame.lobby.Visible = p26 == "lobby";
	l__UI__16.Frame.mainFrame.settings.Visible = p26 == "settings";
	l__UI__16.Frame.mainFrame.about.Visible = p26 == "about";
	l__UI__16.Frame.mainFrame.gamepasses.Visible = p26 == "gamepasses";
	l__UI__16.Frame.mainFrame.myGamepasses.Visible = p26 == "myGamepasses";
	l__UI__16.Frame.mainFrame.titles.Visible = p26 == "titles";
	l__UI__16.Frame.gamepassInfo.Visible = false;
	l__UI__16.Frame.titlesInfo.Visible = false;
	clearTitleEffects();
end;
l__GuiService__11.MenuOpened:Connect(function()
	l__TweenService__5:Create(l__UI__16.Dark1, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
		Transparency = 0
	}):Play();
end);
l__GuiService__11.MenuClosed:Connect(function()
	l__TweenService__5:Create(l__UI__16.Dark1, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {
		Transparency = 1
	}):Play();
end);
local u19 = false;
local l__img__20 = l__Assets__15.Miscs.img;
local l__stroke__21 = l__Assets__15.Miscs.stroke;
l__RunService__6.RenderStepped:Connect(function()
	local l__CurrentCamera__125 = workspace.CurrentCamera;
	l__CurrentCamera__125.CameraType = Enum.CameraType.Scriptable;
	l__CurrentCamera__125.CameraSubject = nil;
	l__CurrentCamera__125.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
	if not u19 then
		local v126, v127 = pcall(function()
			l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.All, false);
			l__StarterGui__4:SetCoreGuiEnabled(Enum.CoreGuiType.Chat, true);
			l__StarterGui__4:SetCore("ResetButtonCallback", false);
		end);
		u19 = v126;
		_ = v127;
	end;
	l__img__20.TileSize = UDim2.new(math.random(1, 10), 0, math.random(1, 10), 0);
	l__stroke__21.Transparency = math.abs(math.sin(tick() * 3.5)) / 2;
end);
l__UI__16.Dark.Transparency = 0;
l__UI__16.Frame.Visible = true;
l__UI__16.Frame.mainFrame.lobby.panel.roomInput.Text = l__LocalPlayer__1.Name .. "'s Room";
output("Waiting for server to respond.", 5, Color3.fromRGB(255, 255, 0));
while not l__LocalPlayer__1:FindFirstChild("isDataReady") or not l__LocalPlayer__1.isDataReady.Value do
	task.wait(0.03333333333333333);
end;
output("Loading data, please wait.", 5, Color3.fromRGB(255, 255, 255));
task.wait(0.2);
u9 = v17:InvokeServer("getLevel");
local v128 = {};
local v129 = v17:InvokeServer("getSettings");
if v129 then
	output("Settings config loaded.", 5, Color3.fromRGB(0, 255, 0));
	v128 = shallowCopy(v129);
else
	output("Settings config failed to load.", 5, Color3.fromRGB(255, 0, 0));
end;
local v130 = {};
local u22 = false;
local l__Volume__23 = workspace.Theme.Volume;
function v130.musicMute(p27, p28, p29, p30)
	l__UI__16.Loading.Visible = true;
	u22 = true;
	if p29 == "ON" then
		v128[p27] = "OFF";
		p28.Text = "OFF";
		p28.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
		workspace.Theme.Volume = 0;
	elseif p29 == "OFF" then
		v128[p27] = "ON";
		p28.Text = "ON";
		p28.Parent.BackgroundColor3 = Color3.fromRGB(170, 255, 127);
		workspace.Theme.Volume = l__Volume__23;
	end;
	if not p30 then
		local v131, v132 = v17:InvokeServer("setSettings", p27, v128[p27]);
		if not v131 then
			output(unpack(v132));
		end;
	end;
	u22 = false;
	l__UI__16.Loading.Visible = false;
end;
function v130.humMute(p31, p32, p33, p34)
	l__UI__16.Loading.Visible = true;
	u22 = true;
	if p33 == "ON" then
		v128[p31] = "OFF";
		p32.Text = "OFF";
		p32.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
		l__Assets__15.Sounds.hum.Volume = 0;
	elseif p33 == "OFF" then
		v128[p31] = "ON";
		p32.Text = "ON";
		p32.Parent.BackgroundColor3 = Color3.fromRGB(170, 255, 127);
		l__Assets__15.Sounds.hum.Volume = 0.15;
	end;
	if not p34 then
		local v133, v134 = v17:InvokeServer("setSettings", p31, v128[p31]);
		if not v133 then
			output(unpack(v134));
		end;
	end;
	u22 = false;
	l__UI__16.Loading.Visible = false;
end;
for v135, v136 in pairs(l__UI__16.Frame:GetDescendants()) do
	if v130[v136.Name] and v128[v136.Name] then
		local l__Name__137 = v136.Name;
		if v128[l__Name__137] == "OFF" then
			local v138 = "ON";
		else
			v138 = "OFF";
		end;
		v130[l__Name__137](l__Name__137, v136.button, v138, true);
	end;
end;
function gamemodeSet(p35)
	if not p35 then
		if not (#v19 < u7 + 1) then
			if p35 then
				if u7 - 1 < 1 then
					return false;
				end;
			end;
		else
			return false;
		end;
	elseif p35 then
		if u7 - 1 < 1 then
			return false;
		end;
	end;
	if p35 then
		local v139 = -1;
	else
		v139 = 1;
	end;
	u7 = u7 + v139;
	l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeType.Text = v19[u7].name;
	l__UI__16.Frame.mainFrame.roomFrame.panel.gamemodeDesc.desc.Text = v19[u7].desc;
	if p35 then
		local v140 = true;
		if not (u7 <= 1) then
			v140 = not p35 and #v19 <= u7;
		end;
	else
		v140 = not p35 and #v19 <= u7;
	end;
	return true, v140;
end;
function levelSet(p36)
	if not p36 then
		if not (#v20 < u8 + 1) then
			if p36 then
				if u8 - 1 < 1 then
					return false;
				end;
			end;
		else
			return false;
		end;
	elseif p36 then
		if u8 - 1 < 1 then
			return false;
		end;
	end;
	if p36 then
		local v141 = -1;
	else
		v141 = 1;
	end;
	u8 = u8 + v141;
	l__UI__16.Frame.mainFrame.roomFrame.panel.levelType.Text = v20[u8].level .. ". " .. (v20[u8].level <= u9 and v20[u8].name or getRandomString(#v20[u8].name));
	if p36 then
		local v142 = true;
		if not (u8 <= 1) then
			v142 = not p36 and #v20 <= u8;
		end;
	else
		v142 = not p36 and #v20 <= u8;
	end;
	return true, v142;
end;
local v143 = nil;
local v144 = nil;
for v145, v146 in pairs(l__UI__16.Frame:GetDescendants()) do
	if (v146:IsA("TextButton") or v146:IsA("ImageButton")) and v146.Parent.Name ~= "join" then
		local u24 = v143;
		local u25 = v144;
		local u26 = v22;
		table.insert(v23, v146.MouseEnter:Connect(function()
			if not v25 then
				return;
			end;
			if u24 then
				u24.Parent = u25:IsA("ImageButton") and u25 or u25.Parent;
			end;
			l__stroke__21.Thickness = 7.5;
			l__TweenService__5:Create(l__stroke__21, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
				Thickness = 2.5
			}):Play();
			u24 = v146:IsA("ImageButton") and v146:FindFirstChildWhichIsA("UIStroke") or v146.Parent:FindFirstChildWhichIsA("UIStroke");
			u25 = v146;
			if u24 then
				u24.Parent = nil;
			end;
			l__img__20.Parent = v146:IsA("ImageButton") and v146 or v146.Parent;
			l__stroke__21.Parent = v146:IsA("ImageButton") and v146 or v146.Parent;
			if tick() - u26 >= 0.08333333333333333 then
				u26 = tick();
				playsound(l__Assets__15.Sounds.hover, l__PlayerGui__2);
			end;
		end));
		table.insert(v23, v146.MouseLeave:Connect(function()
			if not v25 then
				return;
			end;
			if u24 then
				u24.Parent = u25:IsA("ImageButton") and u25 or u25.Parent;
			end;
			l__img__20.Parent = nil;
			l__stroke__21.Parent = nil;
			if tick() - u26 >= 0.08333333333333333 then
				u26 = tick();
				playsound(l__Assets__15.Sounds.hover, l__PlayerGui__2);
			end;
		end));
		if v146.Name == "gamemodeL" then
			u11.left = v146;
		elseif v146.Name == "gamemodeR" then
			u11.right = v146;
		elseif v146.Name == "levelL" then
			u12.left = v146;
		elseif v146.Name == "levelR" then
			u12.right = v146;
		end;
		table.insert(v23, v146.MouseButton1Click:Connect(function()
			if not v25 then
				return;
			end;
			clickEffect();
			playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
			l__stroke__21.Thickness = 7.5;
			l__stroke__21.Color = Color3.fromRGB(170, 255, 127);
			l__TweenService__5:Create(l__stroke__21, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
				Thickness = 2.5, 
				Color = Color3.fromRGB(148, 148, 148)
			}):Play();
			if l__UI__16.Loading.Visible then
				return;
			end;
			local v147 = true;
			local v148 = v146:IsA("ImageButton") and v146.Name or v146.Parent.Name;
			if v148 == "create" then
				if not isCreated() then
					l__UI__16.Loading.Visible = true;
					local l__panel__149 = l__UI__16.Frame.mainFrame.lobby.panel;
					local v150 = false;
					if l__panel__149.password.button.Text == "LOCKED" then
						v150 = l__panel__149.passInput.Text;
					end;
					local v151, v152, v153 = v17:InvokeServer("createLobby", l__panel__149.roomInput.Text, v150);
					output(unpack(v152));
					if v151 then
						handleRoom(v153);
					end;
					u5 = v153;
					updateRoom();
					l__UI__16.Loading.Visible = false;
				else
					output("You've already created a lobby.", 5, Color3.fromRGB(255, 0, 0));
				end;
			elseif v148 == "roomLeave" then
				l__UI__16.Loading.Visible = true;
				local v154, v155 = v17:InvokeServer("leaveLobby", u5);
				output(unpack(v155));
				if v154 then
					cleanLobby();
				end;
				l__UI__16.Loading.Visible = false;
			elseif v148 == "joinCode" then
				local v156 = findRoomWithCode((string.lower(l__UI__16.Frame.mainFrame.lobby.panel.input.Text)));
				if v156 then
					output("Room found.", 5, Color3.fromRGB(0, 255, 0));
					joinRoom(v156);
				else
					output("Room not found.", 5, Color3.fromRGB(255, 0, 0));
				end;
			elseif v148 == "roomStart" and u5 then
				if u5.creator.Value == l__LocalPlayer__1.Name then
					playsound(l__Assets__15.Sounds.start, l__PlayerGui__2);
					v17:FireServer("teleport", u5);
				else
					output("Wait for the room owner to start.", 5, Color3.fromRGB(255, 255, 0));
				end;
			elseif v148 == "password" then
				if not isCreated() then
					if v146.Text == "UNLOCKED" then
						v146.Text = "LOCKED";
						v146.Parent.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
					elseif v146.Text == "LOCKED" then
						v146.Text = "UNLOCKED";
						v146.Parent.BackgroundColor3 = Color3.fromRGB(85, 255, 0);
					end;
				end;
			elseif v148 == "enterPW" then
				l__UI__16.Frame.passwordInput.Visible = false;
				u16 = l__UI__16.Frame.passwordInput.passInput.Text;
				l__UI__16.Frame.passwordInput.passInput.Text = "";
				u15 = false;
			elseif v148 == "lobby" or v148 == "settings" or v148 == "about" or v148 == "gamepasses" or v148 == "myGamepasses" or v148 == "titles" then
				changeWindows(v148);
			elseif v148 == "refreshLobby" then
				l__UI__16.Loading.Visible = true;
				output("Refreshing ...", 3, Color3.fromRGB(255, 255, 0));
				task.wait(0.06666666666666667);
				local v157 = updateRoomList();
				if v157 > 0 then
					output("Found " .. v157 .. " room(s).", 3, Color3.fromRGB(0, 255, 0));
				else
					output("No rooms were found.", 3, Color3.fromRGB(255, 0, 0));
				end;
				l__UI__16.Loading.Visible = false;
			elseif v148 == "musicMute" or v148 == "humMute" then
				if not u22 then
					v130[v148](v148, v146, v128[v148] and "ON");
				end;
			elseif v148 == "purchaseGamepass" and v146.Parent.id.Value > 0 then
				l__MarketplaceService__13:PromptGamePassPurchase(l__LocalPlayer__1, v146.Parent.id.Value);
			elseif v148 == "useTitle" and v146.Parent.id.Value > 0 then
				if v146.Parent.locked.Visible then
					v147 = false;
					output("You haven't unlocked this title yet.", 3, Color3.fromRGB(255, 0, 0));
				else
					l__UI__16.Loading.Visible = true;
					local v158, v159 = v17:InvokeServer("setTitle", v21[u4].name, v146.Text == "DISPLAY");
					output(unpack(v159));
					l__UI__16.Loading.Visible = false;
				end;
			elseif v148 == "gamemodeL" and u5 and u5.creator.Value == l__LocalPlayer__1.Name then
				local v160, v161 = gamemodeSet(true);
				if v160 then
					v17:FireServer("setGamemode", u5, u7);
					u11.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
					u11.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
				end;
				if not v160 or v161 then
					u11.left.ImageColor3 = Color3.fromRGB(80, 80, 80);
				end;
			elseif v148 == "gamemodeR" and u5 and u5.creator.Value == l__LocalPlayer__1.Name then
				local v162, v163 = gamemodeSet();
				if v162 then
					v17.FireServer(v17, "setGamemode", u5, u7);
					u11.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
					u11.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
				end;
				if not v162 or v163 then
					u11.right.ImageColor3 = Color3.fromRGB(80, 80, 80);
				end;
			elseif v148 == "levelL" and u5 and u5.creator.Value == l__LocalPlayer__1.Name then
				local v164, v165 = levelSet(true);
				if v164 then
					v17.FireServer(v17, "setLevel", u5, u8);
					u12.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
					u12.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
				end;
				if not v164 or v165 then
					u12.left.ImageColor3 = Color3.fromRGB(80, 80, 80);
				end;
			elseif v148 == "levelR" and u5 and u5.creator.Value == l__LocalPlayer__1.Name then
				local v166, v167 = levelSet();
				if v166 then
					v17.FireServer(v17, "setLevel", u5, u8);
					u12.left.ImageColor3 = Color3.fromRGB(170, 170, 170);
					u12.right.ImageColor3 = Color3.fromRGB(170, 170, 170);
				end;
				if not v166 or v167 then
					u12.right.ImageColor3 = Color3.fromRGB(80, 80, 80);
				end;
			end;
			l__UI__16.Frame.gamepassInfo.Visible = false;
			l__UI__16.Frame.titlesInfo.Visible = not v147;
			if v147 then
				clearTitleEffects();
			end;
		end));
	end;
end;
v17:BindEvents({
	teleport = function(p37, p38)
		l__UI__16.Loading.Visible = p37;
		output(unpack(p38));
	end, 
	message = function(p39)
		output(unpack(p39));
	end, 
	pw = function(p40)
		u6 = p40;
		if u5 then
			local l__roomFrame__168 = l__UI__16.Frame.mainFrame.roomFrame;
			if u5.isLock.Value == false then
				local v169 = "PUBLIC";
			else
				v169 = u5.creator.Value == l__LocalPlayer__1.Name and "PASSWORD: " .. u6 or "PRIVATE";
			end;
			l__roomFrame__168.pw.Text = v169;
			if u5.isLock.Value == false then
				local v170 = "rbxassetid://3523258602";
			else
				v170 = "rbxassetid://3523247585";
			end;
			l__roomFrame__168.passwordIcon.Image = v170;
		end;
	end
});
local v171 = v17:InvokeServer("getTitles");
local v172, v173, v174 = pairs(v21);
while true do
	local v175, v176 = v172(v173, v174);
	if not v175 then
		break;
	end;
	local v177 = l__Assets__15.Miscs.titleList:Clone();
	v177.title.Text = v176.name;
	v177.owned.Visible = v171[v176.name];
	v177.icon.Image = v176.image;
	v177.used.Visible = l__LocalPlayer__1.title.Value == v176.name;
	v177.Parent = l__UI__16.Frame.mainFrame.titles.list;
	if v176.create then
		task.spawn(function()
			v176.create(v177.title, v177.title);
		end);
	end;
	v177.info.button.MouseButton1Click:Connect(function()
		clickEffect();
		playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
		clearTitleEffects();
		u4 = v175;
		l__UI__16.Frame.titlesInfo.useTitle.id.Value = v175;
		l__UI__16.Frame.titlesInfo.title.Text = v176.name;
		l__UI__16.Frame.titlesInfo.desc.info.Text = v176.desc;
		l__UI__16.Frame.titlesInfo.icon.Image = v176.image;
		l__UI__16.Frame.titlesInfo.useTitle.locked.Visible = not v171[v176.name];
		if v171[v176.name] then
			local v178 = 0;
		else
			v178 = 0.7;
		end;
		l__UI__16.Frame.titlesInfo.useTitle.button.TextTransparency = v178;
		if v171[v176.name] and l__LocalPlayer__1.title.Value ~= v176.name then
			local v179 = "DISPLAY";
		elseif v171[v176.name] and l__LocalPlayer__1.title.Value == v176.name then
			v179 = "REMOVE";
		else
			v179 = "LOCKED";
		end;
		l__UI__16.Frame.titlesInfo.useTitle.button.Text = v179;
		if v171[v176.name] and l__LocalPlayer__1.title.Value ~= v176.name then
			local v180 = Color3.fromRGB(170, 255, 127);
			if not v180 then
				if v171[v176.name] then
					v180 = l__LocalPlayer__1.title.Value == v176.name and Color3.fromRGB(201, 255, 235) or Color3.fromRGB(255, 255, 255);
				else
					v180 = Color3.fromRGB(255, 255, 255);
				end;
			end;
		elseif v171[v176.name] then
			v180 = l__LocalPlayer__1.title.Value == v176.name and Color3.fromRGB(201, 255, 235) or Color3.fromRGB(255, 255, 255);
		else
			v180 = Color3.fromRGB(255, 255, 255);
		end;
		l__UI__16.Frame.titlesInfo.useTitle.BackgroundColor3 = v180;
		if v176.create then
			task.spawn(function()
				u3 = v176.create(l__UI__16.Frame.titlesInfo.title, l__UI__16.Frame.titlesInfo.title);
			end);
		end;
		l__UI__16.Frame.titlesInfo.Visible = true;
	end);
	l__LocalPlayer__1.title.Changed:Connect(function()
		v177.used.Visible = l__LocalPlayer__1.title.Value == v176.name;
	end);
end;
output("Titles data loaded.", 5, Color3.fromRGB(0, 255, 0));
task.wait(0.2);
local v181 = {};
local v182 = v17:InvokeServer("getActiveGamepasses");
if v182 then
	output("Backpack data loaded.", 5, Color3.fromRGB(0, 255, 0));
	v181 = shallowCopy(v182);
else
	output("Backpack data failed to load.", 5, Color3.fromRGB(255, 0, 0));
end;
output("Loading store.", 5, Color3.fromRGB(255, 255, 0));
local v183 = false;
for v184, v185 in pairs(v18) do
	local u27 = nil;
	local v186, v187 = pcall(function()
		u27 = l__MarketplaceService__13:GetProductInfo(v185, Enum.InfoType.GamePass);
	end);
	if not v186 then
		output("FAILED TO LOAD GAMEPASS [" .. v185 .. "] INFO | error: " .. v187, 5, Color3.fromRGB(255, 0, 0));
		return;
	end;
	local v188 = l__MarketplaceService__13:UserOwnsGamePassAsync(l__LocalPlayer__1.userId, v185);
	local u28 = false;
	local u29 = v183;
	local v189 = l__Assets__15.Miscs.gamepassList:Clone();
	v189.title.Text = u27.Name;
	v189.icon.Image = "rbxassetid://" .. u27.IconImageAssetId;
	v189.owned.Visible = v188;
	v189.Parent = l__UI__16.Frame.mainFrame.gamepasses.list;
	local u30 = v188;
	v189.info.button.MouseButton1Click:Connect(function()
		clickEffect();
		playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
		if l__UI__16.Loading.Visible then
			return;
		end;
		l__UI__16.Loading.Visible = true;
		u30 = l__MarketplaceService__13:UserOwnsGamePassAsync(l__LocalPlayer__1.userId, v185);
		l__UI__16.Loading.Visible = false;
		v189.owned.Visible = u30;
		l__UI__16.Frame.gamepassInfo.title.Text = u27.Name;
		l__UI__16.Frame.gamepassInfo.icon.Image = "rbxassetid://" .. u27.IconImageAssetId;
		l__UI__16.Frame.gamepassInfo.desc.info.Text = u27.Description;
		l__UI__16.Frame.gamepassInfo.purchaseGamepass.id.Value = v185;
		if u30 then
			local v190 = "OWNED";
		elseif u27.PriceInRobux < 1 then
			v190 = "FREE";
		else
			v190 = u27.PriceInRobux .. " R$";
		end;
		l__UI__16.Frame.gamepassInfo.purchaseGamepass.button.Text = v190;
		l__UI__16.Frame.gamepassInfo.Visible = true;
	end);
	local function u31()
		if not u28 then
			u28 = true;
			local v191 = l__Assets__15.Miscs.myGamepassList:Clone();
			v191.title.Text = u27.Name;
			v191.icon.Image = "rbxassetid://" .. u27.IconImageAssetId;
			if v181[tostring(v185)] == false then
				local v192 = false;
				v191.active.button.Text = "INACTIVE";
				v191.active.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
			else
				v192 = true;
				v191.active.button.Text = "ACTIVE";
				v191.active.BackgroundColor3 = Color3.fromRGB(170, 255, 127);
			end;
			v191.Parent = l__UI__16.Frame.mainFrame.myGamepasses.list;
			local u32 = v192;
			v191.active.button.MouseButton1Click:Connect(function()
				clickEffect();
				playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
				if u29 then
					return;
				end;
				l__UI__16.Loading.Visible = true;
				u29 = true;
				u32 = not u32;
				local v193, v194 = v17:InvokeServer("setActiveGamepass", v185, u32);
				if v193 then
					if not u32 then
						v191.active.button.Text = "INACTIVE";
						v191.active.BackgroundColor3 = Color3.fromRGB(255, 0, 0);
					else
						v191.active.button.Text = "ACTIVE";
						v191.active.BackgroundColor3 = Color3.fromRGB(170, 255, 127);
					end;
				else
					u32 = not u32;
					output(unpack(v194));
				end;
				task.wait(0.03333333333333333);
				u29 = false;
				l__UI__16.Loading.Visible = false;
			end);
		end;
	end;
	l__UI__16.Frame.mainFrame.buttons.myGamepasses.button.MouseButton1Click:Connect(function()
		u30 = l__MarketplaceService__13:UserOwnsGamePassAsync(l__LocalPlayer__1.userId, v185);
		if u30 then
			u31();
		end;
		v24.LayoutOrder = #l__UI__16.Frame.mainFrame.myGamepasses.list:GetChildren();
	end);
	if u30 then
		u31();
	end;
end;
output("Store loaded.", 5, Color3.fromRGB(0, 255, 0));
v24.Parent = l__UI__16.Frame.mainFrame.myGamepasses.list;
v24.LayoutOrder = #l__UI__16.Frame.mainFrame.myGamepasses.list:GetChildren();
v24.button.MouseButton1Click:Connect(function()
	clickEffect();
	playsound(l__Assets__15.Sounds.click, l__PlayerGui__2);
	changeWindows("gamepasses");
end);
if l__TouchEnabled__26 then
	local v195 = 2;
elseif l__GamepadEnabled__27 then
	v195 = 3;
else
	v195 = 1;
end;
v17:FireServer("setPlatform", v195);
l__TweenService__5:Create(l__SoundService__12.Main, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
	Volume = 0.5
}):Play();
l__TweenService__5:Create(l__UI__16.Dark, TweenInfo.new(1, Enum.EasingStyle.Sine), {
	Transparency = 1
}):Play();
output("Data loaded successfully.", 5, Color3.fromRGB(0, 255, 0));
l__UserInputService__14.InputBegan:Connect(function(p41)
	if p41.UserInputType == Enum.UserInputType.MouseButton1 then
		l__TweenService__5:Create(l__UI__16.mouse, TweenInfo.new(0.06666666666666667, Enum.EasingStyle.Quint), {
			ImageColor3 = Color3.fromRGB(170, 255, 127)
		}):Play();
	end;
end);
l__UserInputService__14.InputEnded:Connect(function(p42)
	if p42.UserInputType == Enum.UserInputType.MouseButton1 then
		l__TweenService__5:Create(l__UI__16.mouse, TweenInfo.new(0.06666666666666667, Enum.EasingStyle.Quint), {
			ImageColor3 = Color3.fromRGB(255, 255, 255)
		}):Play();
	end;
end);
l__RunService__6.RenderStepped:Connect(function()
	if not l__TouchEnabled__26 and not l__GamepadEnabled__27 then
		if not l__UserInputService__14.MouseEnabled then
			l__UI__16.mouse.Visible = false;
			return;
		end;
	else
		return;
	end;
	l__UI__16.mouse.Visible = true;
	local v196 = l__UserInputService__14:GetMouseLocation();
	l__UI__16.mouse.Position = UDim2.new(0, v196.x, 0, v196.y);
end);
