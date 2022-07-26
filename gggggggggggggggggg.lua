-- Decompiled with the Synapse X Luau decompiler.

function output(p1, p2)
	return warn("[" .. p1 .. "] : " .. p2);
end;
local v1 = false;
while not false do
	local l__GameSettings__2 = game.ReplicatedStorage:FindFirstChild("GameSettings");
	if l__GameSettings__2 and l__GameSettings__2:FindFirstChild("gameLoaded") and l__GameSettings__2.gameLoaded.Value then
		break;
	end;
	local l__BaseUI__3 = game.Players.LocalPlayer.PlayerGui:FindFirstChild("BaseUI");
	if l__BaseUI__3 and l__BaseUI__3:FindFirstChild("loading") and l__BaseUI__3:FindFirstChild("black") then
		l__BaseUI__3.black.Transparency = 0;
		l__BaseUI__3.loading.Visible = true;
		if not v1 then
			v1 = true;
			local u1 = false;
			task.spawn(function()
				while l__BaseUI__3:IsDescendantOf(PlayerGui) and not u1 do
					local l__loading__4 = l__BaseUI__3.loading;
					l__loading__4.Rotation = l__loading__4.Rotation + 120 * game:GetService("RunService").Heartbeat:Wait();
					task.wait();				
				end;
			end);
		end;
	end;
	task.wait(0.03333333333333333);
end;
local l__LocalPlayer__5 = game:GetService("Players").LocalPlayer;
local l__mouse__6 = l__LocalPlayer__5:GetMouse();
local l__PlayerGui__7 = l__LocalPlayer__5.PlayerGui;
local l__RunService__8 = game:GetService("RunService");
local l__UserInputService__9 = game:GetService("UserInputService");
local l__ReplicatedStorage__10 = game:GetService("ReplicatedStorage");
local l__StarterPlayer__11 = game:GetService("StarterPlayer");
local l__Lighting__12 = game:GetService("Lighting");
local l__TweenService__13 = game:GetService("TweenService");
local l__Debris__14 = game:GetService("Debris");
local l__SoundService__15 = game:GetService("SoundService");
local l__StarterGui__16 = game:GetService("StarterGui");
local l__GuiService__17 = game:GetService("GuiService");
local l__ContentProvider__18 = game:GetService("ContentProvider");
local l__Players__19 = game:GetService("Players");
local l__MarketplaceService__20 = game:GetService("MarketplaceService");
local l__ContextActionService__21 = game:GetService("ContextActionService");
local l__TeleportService__22 = game:GetService("TeleportService");
local v23 = l__RunService__8.RenderStepped:Connect(function()
	local l__CurrentCamera__24 = workspace.CurrentCamera;
	local v25 = workspace.Ignored.ReplicateFocus:FindFirstChild(l__LocalPlayer__5.Name);
	if v25 and l__CurrentCamera__24 then
		if v25.active.Value then
			v25.CFrame = l__CurrentCamera__24.CFrame;
			return;
		end;
	elseif not l__CurrentCamera__24 then
		v25.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
	end;
end);
local l__Assets__26 = l__ReplicatedStorage__10:WaitForChild("Assets");
local v27 = require(l__Assets__26.Modules.Spring);
local v28 = require(l__Assets__26.Modules.LightDetector);
local v29 = require(l__Assets__26.Modules.Network);
local v30 = require(l__Assets__26.Modules.LoadCharacter);
local v31 = require(l__Assets__26.Modules.Monetization);
local v32 = require(l__Assets__26.Modules.ContextActionUtility);
local v33 = require(l__Assets__26.Modules.Gamepasses);
local v34 = require(l__Assets__26.Modules.OldGamepasses);
local l__Character__35 = l__LocalPlayer__5.Character;
local l__Humanoid__36 = l__Character__35:WaitForChild("Humanoid");
local l__CameraScript__37 = script.Parent:WaitForChild("CameraScript");
local l__vars__38 = script.Parent:WaitForChild("vars");
local l__UI__39 = l__PlayerGui__7:WaitForChild("UI");
local l__BaseUI__40 = l__PlayerGui__7:WaitForChild("BaseUI");
local l__GameSettings__41 = l__ReplicatedStorage__10:WaitForChild("GameSettings");
local l__GamepadEnabled__42 = l__UserInputService__9.GamepadEnabled;
local u2 = false;
pcall(function()
	u2 = l__LocalPlayer__5:IsInGroup(15422038);
end);
l__BaseUI__40.wa.Visible = true;
l__UI__39.vignette.Visible = true;
function lerp(p3, p4, p5)
	return p3 + (p4 - p3) * p5;
end;
function shallowCopy(p6)
	local v43 = {};
	local v44, v45, v46 = pairs(p6);
	while true do
		local v47, v48 = v44(v45, v46);
		if v47 then

		else
			break;
		end;
		v46 = v47;
		v43[v47] = v48;	
	end;
	return v43;
end;
function getRandomChildren(p7)
	if 0 < #p7:GetChildren() then
		local v49 = p7:GetChildren()[math.random(#p7:GetChildren())] or nil;
	else
		v49 = nil;
	end;
	return v49;
end;
function playsound(p8, p9, p10, p11, p12, p13)
	local v50 = typeof(p9) == "Vector3";
	if v50 then
		local v51 = Instance.new("Attachment");
		v51.WorldPosition = p9;
		v51.Parent = workspace.Terrain;
		p9 = v51;
	end;
	local v52 = p8:Clone();
	v52.Volume = p10 or v52.Volume;
	v52.PlaybackSpeed = p11 or (p12 and v52.PlaybackSpeed + math.random() * 0.4 or v52.PlaybackSpeed);
	v52.Parent = p9;
	v52:Play();
	if not p13 then
		l__Debris__14:AddItem(not v50 and v52 or p9, v52.TimeLength + 0.5);
	end;
	return v52;
end;
function createParticle(p14, p15, p16, p17)
	local v53 = Instance.new("Attachment");
	v53.WorldPosition = p16;
	v53.Parent = workspace.Terrain;
	local v54 = p14:Clone();
	v54.Parent = v53;
	v54:Emit(p15 and 1);
	l__Debris__14:AddItem(v53, p17);
end;
function getDistance(p18, p19)
	return ((typeof(p18) == "Vector3" and p18 or p18.Position) - (typeof(p19) == "Vector3" and p19 or p19.Position)).magnitude;
end;
function getDirection(p20, p21)
	return (typeof(p20) == "Vector3" and p20 or p20.Position) - (typeof(p21) == "Vector3" and p21 or p21.Position);
end;
function findNearestHostileEntity()
	local v55 = nil;
	local v56 = math.huge;
	local v57, v58, v59 = pairs(workspace.Entities:GetChildren());
	while true do
		local v60, v61 = v57(v58, v59);
		if v60 then

		else
			break;
		end;
		v59 = v60;
		if l__Humanoid__36.RootPart then
			if v61:FindFirstChild("Humanoid") then
				if 0 < v61.Humanoid.Health then
					if v61.Humanoid.RootPart then
						if v61.gVars.isHostile.Value == true then
							if getDistance(v61.Humanoid.RootPart, l__Humanoid__36.RootPart) < v56 then
								v55 = v61;
								v56 = getDistance(v61.Humanoid.RootPart, l__Humanoid__36.RootPart);
							end;
						end;
					end;
				end;
			end;
		end;	
	end;
	return v55;
end;
local u3 = false;
function checkRegionAmbience()
	local v62 = {};
	local v63, v64, v65 = pairs(workspace.Ignored.Regions:GetChildren());
	while true do
		local v66, v67 = v63(v64, v65);
		if v66 then

		else
			break;
		end;
		v65 = v66;
		if 0 < #workspace:FindPartsInRegion3WithWhiteList(Region3.new(Vector3.new(v67.Position.x - v67.Size.x / 2, v67.Position.y - v67.Size.y / 2, v67.Position.z - v67.Size.z / 2), (Vector3.new(v67.Position.x + v67.Size.x / 2, v67.Position.y + v67.Size.y / 2, v67.Position.z + v67.Size.z / 2))), { l__Character__35 }) then
			v62[v67.Name] = {
				volume = v67.Volume.Value, 
				reverbType = v67:FindFirstChild("ReverbType") and v67.ReverbType.Value or Enum.ReverbType.NoReverb
			};
		end;	
	end;
	local v68, v69, v70 = pairs(workspace.Ambiences:GetChildren());
	while true do
		local v71, v72 = v68(v69, v70);
		if v71 then

		else
			break;
		end;
		if v62[v72.Name] then
			if l__vars__38.isCutscene.Value == false then
				l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					Volume = v62[v72.Name].volume
				}):Play();
				l__SoundService__15.AmbientReverb = not u3 and v62[v72.Name].reverbType or Enum.ReverbType.NoReverb;
			elseif v72.Name == "Background" then
				if l__vars__38.isCutscene.Value == true then
					l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
						Volume = 0
					}):Play();
				end;
			else
				l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					Volume = 0
				}):Play();
			end;
		elseif v72.Name == "Background" then
			if l__vars__38.isCutscene.Value == true then
				l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					Volume = 0
				}):Play();
			end;
		else
			l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
				Volume = 0
			}):Play();
		end;
		if v72.Name == "Background" then
			if l__vars__38.isCutscene.Value == false then
				l__TweenService__13:Create(v72, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
					Volume = v72.vol.Value
				}):Play();
			end;
		end;	
	end;
end;
for v73, v74 in pairs(workspace.Ambiences:GetChildren()) do
	if v74.Name ~= "Background" then
		l__TweenService__13:Create(v74, TweenInfo.new(0.03333333333333333, Enum.EasingStyle.Linear), {
			Volume = 0
		}):Play();
	end;
end;
local l__TouchEnabled__4 = l__UserInputService__9.TouchEnabled;
function canLockMouse()
	if not l__StarterGui__16:GetCore("DevConsoleVisible") then
		if l__UI__39.h2p.Visible == true then
			if l__UI__39.h2p:FindFirstChild("done") then
				if not l__TouchEnabled__4 then
					if l__UI__39.input.Visible ~= true then
						local v75 = l__UI__39.image.mouse.Value == true and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
					else
						v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
					end;
				else
					v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
				end;
			else
				v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
			end;
		elseif not l__TouchEnabled__4 then
			if l__UI__39.input.Visible ~= true then
				v75 = l__UI__39.image.mouse.Value == true and Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
			else
				v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
			end;
		else
			v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
		end;
	else
		v75 = Enum.MouseBehavior.Default or Enum.MouseBehavior.LockCenter;
	end;
	return v75;
end;
local l__CurrentCamera__5 = workspace.CurrentCamera;
function findInteractiveObject(p22)
	local v76 = RaycastParams.new();
	v76.FilterDescendantsInstances = { workspace.Ignored.Interacts, workspace.Buildings };
	v76.FilterType = Enum.RaycastFilterType.Whitelist;
	v76.IgnoreWater = true;
	v76.CollisionGroup = "Raycast";
	local v77 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, l__CurrentCamera__5.CFrame.LookVector * p22, v76);
	if v77 then
		if p22 < getDistance(v77.Instance, l__Humanoid__36.RootPart) then
			return false;
		end;
	end;
	return v77 and (v77.Instance:IsDescendantOf(workspace.Ignored.Interacts) and (not v77.Instance:FindFirstChild("success") and (not v77.Instance:FindFirstChild("used") and v77.Instance))), v77 and (v77.Instance:IsDescendantOf(workspace.Ignored.Interacts) and (v77.Instance.Parent:IsA("Model") and v77.Instance.Parent));
end;
function isPartVisible(p23, p24, p25)
	local v78 = RaycastParams.new();
	v78.FilterDescendantsInstances = p25 or { l__Character__35, workspace.Ignored };
	v78.CollisionGroup = "Raycast";
	v78.IgnoreWater = true;
	local v79 = workspace:Raycast(l__Humanoid__36.RootPart.Position, getDirection(p23, l__Humanoid__36.RootPart), v78);
	if v79 then

	else
		return true;
	end;
	return p24 and v79.Instance:IsDescendantOf(p24);
end;
function findHumanoid(p26)
	if p26.Parent:FindFirstChild("Humanoid") then
		return p26.Parent;
	end;
	if p26.Parent ~= workspace then

	else
		return false;
	end;
	return findHumanoid(p26.Parent);
end;
function isInFieldOfView(p27)
	local v80, v81 = l__CurrentCamera__5:WorldToViewportPoint(p27.Position);
	return v81;
end;
function isPartInside(p28, p29)
	return 0 < #workspace:FindPartsInRegion3WithIgnoreList(Region3.new(Vector3.new(p28.Position.x - p28.Size.x / 2, p28.Position.y - p28.Size.y / 2, p28.Position.z - p28.Size.z / 2), (Vector3.new(p28.Position.x + p28.Size.x / 2, p28.Position.y + p28.Size.y / 2, p28.Position.z + p28.Size.z / 2))), p29 or { l__Character__35 });
end;
function loadAnim(p30)
	local v82 = Instance.new("Animation");
	v82.AnimationId = "rbxassetid://" .. p30;
	return l__Humanoid__36.Animator:LoadAnimation(v82), v82:Destroy();
end;
local v83 = {
	leanLeft = loadAnim(10278356110), 
	leanRight = loadAnim(10278361922), 
	crouchIdle = loadAnim(10278365296), 
	crouchMove = loadAnim(10278369129), 
	camEquip = loadAnim(10278372541), 
	camIdle = loadAnim(10278376095), 
	camZoomIdle = loadAnim(10278379516), 
	camUnequip = loadAnim(10278382044), 
	flEquip = loadAnim(10278385499), 
	flUnequip = loadAnim(10278388426), 
	flIdle = loadAnim(10278391315)
};
local v84 = v27.new(0);
v84.Damper = 0.45;
v84.Speed = 12;
local v85 = tick();
local v86 = math.random(100, 120);
local v87 = tick();
local v88 = tick();
local v89 = math.random(80, 120);
local v90 = tick();
local v91 = Vector3.new();
local v92 = tick();
local v93 = Vector3.new();
local v94 = CFrame.new();
if l__GamepadEnabled__42 and not UserSettings().GameSettings.GamepadCameraSensitivity then

end;
local v95 = tick();
local v96 = {};
local v97 = {
	[0] = { "I must find the exit.", "I don't wanna die here, I have to find the exit.", "Where's the exit?" },
	{ "I have to get out of here.", "Where am I?", "I need to do something to get out of here." }, { "What is this place?", "Where am I?" }, { "I have to get out of here.", "I need to do something to get out of here.", "I must get out of here" }, { "This place is so huge.", "Who built these?", "Am I in a sewer?" }, { "This place is so dark. Am I in a cave?", "I feels like someone is following me.", "I hear someone breathing behind my back.", "Someone is following me." }
};
task.spawn(function()
	while l__BaseUI__40:IsDescendantOf(l__PlayerGui__7) and not done do
		local l__loading__98 = l__BaseUI__40.loading;
		l__loading__98.Rotation = l__loading__98.Rotation + 120 * l__RunService__8.Heartbeat:Wait();
		task.wait();	
	end;
end);
local u6 = {};
local u7 = {};
local u8 = 50;
local u9 = 100;
local u10 = 0.085;
local u11 = 1.25;
local u12 = 18;
task.spawn(function()
	local v99 = l__TeleportService__22:GetLocalPlayerTeleportData();
	if not v99 and not l__RunService__8:IsStudio() then
		return output("ERROR", "GAMEPASSES FAILED TO LOAD, SORRY FOR THE INCONVENIENCE. PLEASE REPORT THIS TO THE DEVS! " .. v99);
	end;
	if v99 then
		u6 = shallowCopy(v99.gamepassData);
	end;
	for v100, v101 in pairs(v33) do
		if l__GameSettings__41.gamepassEnabled.Value == true and l__MarketplaceService__20:UserOwnsGamePassAsync(l__LocalPlayer__5.userId, v101.id) then
			local v102 = u6[tostring(v101.id)];
			if v102 ~= nil then
				local v103 = v102;
				if not v103 then
					v103 = false;
					if v102 == nil then
						v103 = true;
					end;
				end;
			else
				v103 = false;
				if v102 == nil then
					v103 = true;
				end;
			end;
			u7[v101.name] = v103;
			if u7[v101.name] then
				if v101.name == "advCam" then
					u8 = 65;
					l__Assets__26.Sounds.vhs_noise.Volume = 0.01;
				elseif v101.name == "metalLungs" then
					u9 = u9 * 2;
					u10 = 0.035;
					u11 = 1.7;
				elseif v101.name == "olym" then
					u12 = u12 * 1.25;
				elseif v101.name == "sixthsense" then
					local v104 = v32:GetButton("sense");
					if v104 then
						v104.Visible = true;
					end;
				end;
			end;
		end;
	end;
	for v105, v106 in pairs(v34) do
		if l__GameSettings__41.gamepassEnabled.Value == true and l__MarketplaceService__20:UserOwnsGamePassAsync(l__LocalPlayer__5.userId, v106.id) then
			local v107 = u6[tostring(v106.id)];
			if v107 ~= nil then
				local v108 = v107;
				if not v108 then
					v108 = false;
					if v107 == nil then
						v108 = true;
					end;
				end;
			else
				v108 = false;
				if v107 == nil then
					v108 = true;
				end;
			end;
			u7[v106.name] = v108;
			if u7[v106.name] then
				if v106.name == "advCam" then
					u8 = 65;
					l__Assets__26.Sounds.vhs_noise.Volume = 0.01;
				elseif v106.name == "metalLungs" then
					u9 = u9 * 2;
					u10 = 0.035;
					u11 = 1.7;
				elseif v106.name == "olym" then
					u12 = u12 * 1.25;
				elseif v106.name == "sixthsense" then
					local v109 = v32:GetButton("sense");
					if v109 then
						v109.Visible = true;
					end;
				end;
			end;
		end;
	end;
end);
if u2 then
	u9 = u9 * 1.3;
end;
if l__GameSettings__41.currentLevel.Value == 6 then
	u11 = u11 * 2.5;
end;
local v110 = l__CurrentCamera__5:WaitForChild(l__LocalPlayer__5.Name .. "-cameraLight");
v110.Attachment.Light.Brightness = 0;
v110.SpotLight.Enabled = false;
for v111, v112 in pairs(l__CurrentCamera__5:GetChildren()) do
	if v112 ~= v110 then
		v112:Destroy();
	end;
end;
local v113 = l__Assets__26.Models.Camera:Clone();
v113.Parent = l__CurrentCamera__5;
local v114 = CFrame.new(0, 0, 0);
local v115 = CFrame.new(0, 0, 0);
local v116 = CFrame.new(0, 0, 0);
local v117 = CFrame.Angles(0, 0, 0);
local v118 = CFrame.new(0, 0, 0);
local v119 = Vector3.new();
local v120 = {};
for v121, v122 in pairs(l__Assets__26.Miscs.cameraLightings:GetChildren()) do
	local v123 = v122:Clone();
	v123.Parent = l__CurrentCamera__5;
	v120[#v120 + 1] = v123;
end;
for v124, v125 in pairs(l__Assets__26.Sounds:GetDescendants()) do
	if v125:IsA("Sound") then
		v125:Stop();
	end;
end;
l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
workspace.Ignored.ClientsCache:ClearAllChildren();
print("A", l__GameSettings__41.testGenerateLevel.Value == true and l__RunService__8:IsStudio() or not l__RunService__8:IsStudio());
if l__GameSettings__41.testGenerateLevel.Value == true and not (not l__RunService__8:IsStudio()) or not l__RunService__8:IsStudio() then
	print("A");
	for v126, v127 in pairs(_G.lightings) do
		v127:Destroy();
	end;
	l__Lighting__12:ClearAllChildren();
	local l__Lightnings__128 = l__Assets__26.Maps[l__GameSettings__41.currentLevel.Value].Lightnings;
	for v129, v130 in pairs(l__Lightnings__128.Settings:GetChildren()) do
		l__Lighting__12[v130.Name] = v130.Value;
	end;
	if #l__Lighting__12:GetChildren() < 1 and #l__Lightnings__128.Instances:GetChildren() > 0 then
		for v131, v132 in pairs(l__Lightnings__128.Instances:GetChildren()) do
			v132:Clone().Parent = l__Lighting__12;
		end;
	end;
	print("B");
end;
local v133 = l__Assets__26.Models.Monsters.Smiler.Model:Clone();
v133.Parent = workspace.Ignored.ClientsCache;
v133.PrimaryPart.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
local v134 = Instance.new("Part");
v134.Anchored = true;
v134.CanCollide = false;
v134.Transparency = 1;
v134.Size = Vector3.new(0.5, 0.5, 0.5);
v134.Parent = workspace.Ignored.ClientsCache;
local v135 = Instance.new("ColorCorrectionEffect");
v135.Parent = l__CurrentCamera__5;
local v136 = Instance.new("BlurEffect");
v136.Size = 0;
v136.Parent = l__CurrentCamera__5;
local v137 = Instance.new("ColorCorrectionEffect");
v137.Parent = l__CurrentCamera__5;
local v138 = Instance.new("BlurEffect");
v138.Size = 0;
v138.Name = "s";
v138.Parent = l__CurrentCamera__5;
l__SoundService__15.Main.Volume = 0;
l__BaseUI__40.black.Transparency = 0;
l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(2, Enum.EasingStyle.Sine), {
	Transparency = 1
}):Play();
local v139 = Instance.new("BlurEffect");
v139.Size = 0;
v139.Parent = l__CurrentCamera__5;
local v140 = Instance.new("ColorCorrectionEffect");
v140.Parent = l__CurrentCamera__5;
l__RunService__8:UnbindFromRenderStep("DIED_SCENE");
l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER_2");
l__RunService__8:UnbindFromRenderStep("DIED_SCENE");
l__RunService__8:UnbindFromRenderStep("Walking");
local v141 = false;
while not l__Humanoid__36.RootPart do
	v141 = true;
	l__RunService__8:UnbindFromRenderStep("DIED_SCENE");
	l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
	l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER_2");
	l__RunService__8:UnbindFromRenderStep("DIED_SCENE");
	l__RunService__8:UnbindFromRenderStep("Walking");
	warn("error: ROOT NOT FOUND.");
	l__BaseUI__40.loading.Visible = true;
	local v142, v143 = pcall(function()
		l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
		v29:FireServer("stream", CFrame.new(l__Humanoid__36:GetAttribute("RootPosition")));
		l__CurrentCamera__5.CFrame = CFrame.new(l__Humanoid__36:GetAttribute("RootPosition"));
	end);
	if not v142 then
		warn("critical error: ", v143);
	end;
	task.wait(0.03333333333333333);
end;
if v141 then
	print("ROOT FOUND.");
end;
local u13 = nil;
local u14 = nil;
function onPlayerDied()
	l__BaseUI__40.wa.Visible = false;
	l__BaseUI__40.loading.Visible = false;
	v23:Disconnect();
	l__UI__39.spectators.Visible = false;
	l__Assets__26.Sounds.underwater:Stop();
	l__RunService__8:UnbindFromRenderStep("Walking");
	pcall(function()
		cameraOff();
	end);
	pcall(function()
		v113.PrimaryPart.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
		v110.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
	end);
	l__UI__39.mobileLR.Visible = false;
	local v144 = false;
	local v145 = 5;
	pcall(function()
		u13:Disconnect();
		u14:Disconnect();
	end);
	while true do
		if l__Humanoid__36:FindFirstChild("creator") then

		else
			break;
		end;
		v144 = true;
		task.wait(0.03333333333333333);	
	end;
	if v144 then
		v145 = 2.5;
	end;
	if l__LocalPlayer__5.data.spectator.Value == true then
		v145 = 0;
	end;
	if not v144 then
		if 0 < v145 then
			playsound(l__Assets__26.Sounds.died, l__PlayerGui__7, nil, nil, nil, true);
		end;
	end;
	local v146, v147, v148 = pairs(l__UI__39.darkGrain:GetChildren());
	while true do
		local v149, v150 = v146(v147, v148);
		if v149 then

		else
			break;
		end;
		v148 = v149;
		v150.ImageTransparency = 1;	
	end;
	local v151, v152, v153 = pairs(l__UI__39.lightGrain:GetChildren());
	while true do
		local v154, v155 = v151(v152, v153);
		if v154 then

		else
			break;
		end;
		v153 = v154;
		v155.ImageTransparency = 1;	
	end;
	local v156, v157, v158 = pairs(l__Assets__26.Sounds:GetDescendants());
	while true do
		local v159, v160 = v156(v157, v158);
		if v159 then

		else
			break;
		end;
		v158 = v159;
		if v160:IsA("Sound") then
			v160:Stop();
		end;	
	end;
	local v161 = Instance.new("BlurEffect");
	v161.Size = 0;
	v161.Parent = l__CurrentCamera__5;
	if 0 < v145 then
		local v162 = 5;
	else
		v162 = 0;
	end;
	l__TweenService__13:Create(v161, TweenInfo.new(v162, Enum.EasingStyle.Sine), {
		Size = 50
	}):Play();
	l__UI__39.died.Transparency = 1;
	l__UI__39.died.Visible = true;
	if 0 < v145 then
		local v163 = 5;
	else
		v163 = 0;
	end;
	l__TweenService__13:Create(l__UI__39.died, TweenInfo.new(v163, Enum.EasingStyle.Sine), {
		Transparency = 0
	}):Play();
	if 0 < v145 then
		local v164 = 3;
	else
		v164 = 0;
	end;
	l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(v164, Enum.EasingStyle.Sine), {
		Volume = 0
	}):Play();
	local u15 = tick();
	local u16 = false;
	local u17 = true;
	local u18 = false;
	l__RunService__8:BindToRenderStep("DIED_SCENE", 1000, function(p31)
		p31 = p31 * 60;
		l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
		l__CurrentCamera__5.CFrame = l__CurrentCamera__5.CFrame + Vector3.new(0, -0.025 * p31, 0);
		if v145 < tick() - u15 then
			l__RunService__8:UnbindFromRenderStep("DIED_SCENE");
			task.spawn(function()
				while true do
					if l__UI__39:IsDescendantOf(l__PlayerGui__7) then

					else
						break;
					end;
					if not u16 then

					else
						break;
					end;
					if l__UI__39.spectate.Visible == false then
						if string.find(l__UI__39.died.title.Text, "_") then
							l__UI__39.died.title.Text = string.gsub(l__UI__39.died.title.Text, "_", "");
							playsound(l__Assets__26.Sounds.Typing["in"], l__PlayerGui__7);
						else
							l__UI__39.died.title.Text = l__UI__39.died.title.Text .. "_";
							playsound(l__Assets__26.Sounds.Typing.out, l__PlayerGui__7);
						end;
					end;
					task.wait(0.75);				
				end;
			end);
			l__UI__39.died.title.Text = "YOU ARE DEAD_";
			l__UI__39.died.title.Visible = true;
			if 0 < v145 then
				task.wait(2.5);
			end;
			if l__GameSettings__41.respawnType.Value == 0 then
				l__UI__39.died.title.Text = "DO YOU WISH TO RESPAWN?_";
			else
				l__UI__39.died.title.Text = "YOU CANNOT RESPAWN UNLESS EVERYONE IS DEAD_";
			end;
			if 0 < v145 then
				task.wait(1.5);
			end;
			if 0 < l__LocalPlayer__5.data.lives.Value then
				if l__GameSettings__41.respawnType.Value == 0 then
					l__UI__39.died.y.Text = "> YES <" .. l__LocalPlayer__5.data.lives.Value .. " LIVES LEFT>";
				else
					l__UI__39.died.y.Text = "> RESPAWN LOCKED";
				end;
			elseif l__GameSettings__41.gamemode.Value ~= "Nightmare" then
				u17 = false;
				l__UI__39.died.y.Text = "> YES <40 R$>";
			else
				u17 = false;
				l__UI__39.died.y.Text = "> NO <CAN'T BE RESPAWNED>";
			end;
			l__UI__39.died.y.Visible = true;
			if 0 < v145 then
				task.wait(0.5);
			end;
			l__UI__39.died.n.Visible = true;
			task.spawn(function()
				while true do
					if l__Character__35:IsDescendantOf(workspace) then

					else
						break;
					end;
					local v165 = false;
					local v166, v167, v168 = pairs(workspace.Characters:GetChildren());
					while true do
						local v169, v170 = v166(v167, v168);
						if v169 then

						else
							break;
						end;
						v168 = v169;
						if v170 ~= l__Character__35 then
							v165 = true;
							break;
						end;					
					end;
					if v165 then
						if 0 < v145 then
							task.wait(0.5);
						end;
						l__UI__39.died.s.Visible = true;
						return;
					end;
					task.wait();				
				end;
			end);
			task.spawn(function()
				while true do
					if l__Character__35:IsDescendantOf(workspace) then

					else
						break;
					end;
					l__UserInputService__9.MouseBehavior = Enum.MouseBehavior.Default;
					task.wait();				
				end;
			end);
			local u19 = {};
			l__LocalPlayer__5.data.lives.Changed:Connect(function()
				pcall(function()
					if 0 < l__LocalPlayer__5.data.lives.Value then

					elseif l__GameSettings__41.gamemode.Value ~= "Nightmare" then
						u17 = false;
						l__UI__39.died.y.Text = "> YES <40 R$>";
						return;
					else
						u17 = false;
						l__UI__39.died.y.Text = "> NO <CAN'T BE RESPAWNED>";
						return;
					end;
					u17 = true;
					if l__GameSettings__41.respawnType.Value == 0 then

					else
						l__UI__39.died.y.Text = "> RESPAWN LOCKED";
						return;
					end;
					l__UI__39.died.y.Text = "> YES <" .. l__LocalPlayer__5.data.lives.Value .. " LIVES LEFT>";
				end);
			end);
			pcall(function()
				u13:Disconnect();
				u14:Disconnect();
			end);
			local v171, v172, v173 = pairs(l__UI__39.died:GetChildren());
			while true do
				local v174, v175 = v171(v172, v173);
				if v174 then

				else
					break;
				end;
				v173 = v174;
				if v175:IsA("TextButton") then
					table.insert(u19, v175.MouseEnter:Connect(function()
						if v175.Visible then
							playsound(l__Assets__26.Sounds.hover, l__PlayerGui__7);
							v175.BackgroundTransparency = 0.5;
						end;
					end));
					table.insert(u19, v175.MouseLeave:Connect(function()
						v175.BackgroundTransparency = 1;
					end));
					table.insert(u19, v175.MouseButton1Click:Connect(function()
						local v176 = nil;
						if not v175.Visible then
							return;
						end;
						playsound(l__Assets__26.Sounds.click, l__PlayerGui__7);
						task.spawn(function()
							local v177 = 1 - 1;
							while true do
								if v175.BackgroundTransparency == 1 then
									local v178 = 0.5;
								else
									v178 = 1;
								end;
								v175.BackgroundTransparency = v178;
								task.wait(0.06666666666666667);
								if 0 <= 1 then
									if v177 < 3 then

									else
										break;
									end;
								elseif 3 < v177 then

								else
									break;
								end;
								v177 = v177 + 1;							
							end;
						end);
						if u18 then
							return;
						end;
						local l__Name__179 = v175.Name;
						if l__Name__179 == "y" then
							if l__GameSettings__41.respawnType.Value == 0 then
								if u17 then
									l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
										Transparency = 0
									}):Play();
									u16 = true;
									local v180, v181, v182 = pairs(u19);
									while true do
										local v183, v184 = v180(v181, v182);
										if v183 then

										else
											break;
										end;
										v182 = v183;
										v184:Disconnect();									
									end;
									task.wait(1.5);
									v29:FireServer("respawn");
									return;
								elseif l__GameSettings__41.gamemode.Value ~= "Nightmare" then
									u18 = true;
									l__MarketplaceService__20:PromptProductPurchase(l__LocalPlayer__5, v31.life);
									local u20 = nil;
									u20 = l__Assets__26.Events.Monetize.OnClientEvent:Connect(function()
										u20:Disconnect();
										u18 = false;
									end);
									return;
								else
									l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
										Transparency = 0
									}):Play();
									u16 = true;
									local v185, v186, v187 = pairs(u19);
									while true do
										local v188, v189 = v185(v186, v187);
										if v188 then

										else
											break;
										end;
										v187 = v188;
										v189:Disconnect();									
									end;
									task.wait(1);
									l__LocalPlayer__5:Kick("\nYOU LEFT THE SESSION.");
									return;
								end;
							end;
						end;
						if l__Name__179 == "n" then
							l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
								Transparency = 0
							}):Play();
							u16 = true;
							local v190, v191, v192 = pairs(u19);
							while true do
								local v193, v194 = v190(v191, v192);
								if v193 then

								else
									break;
								end;
								v192 = v193;
								v194:Disconnect();							
							end;
							v29:FireServer("lobby");
							task.wait(20);
							l__LocalPlayer__5:Kick("\nTELEPORT FAILED. USING KICKING METHOD.");
							return;
						end;
						if l__Name__179 == "s" then
							l__UserInputService__9.MouseBehavior = Enum.MouseBehavior.Default;
							l__CurrentCamera__5.FieldOfView = 70;
							local v195, v196, v197 = pairs(l__CurrentCamera__5:GetChildren());
							while true do
								local v198, v199 = v195(v196, v197);
								if v198 then

								else
									break;
								end;
								v197 = v198;
								if not v199:IsA("BlurEffect") then
									v176 = v199;
									if v199.IsA(v176, "ColorCorrectionEffect") then
										v176 = v199;
										v199.Destroy(v176);
									end;
								else
									v176 = v199;
									v199.Destroy(v176);
								end;							
							end;
							local v200 = workspace.Ignored.ReplicateFocus:WaitForChild(l__LocalPlayer__5.Name);
							local u21 = 0;
							local u22 = 0;
							local u23 = {};
							local function v201()
								u21 = 0;
								u22 = 0;
								local v202, v203, v204 = pairs(u23);
								while true do
									local v205 = v202(v203, v204);
									if v205 then

									else
										break;
									end;
									v204 = v205;
									u23[v205] = nil;								
								end;
								local v206, v207, v208 = pairs(workspace.Characters:GetChildren());
								while true do
									local v209, v210 = v206(v207, v208);
									if v209 then

									else
										break;
									end;
									v208 = v209;
									local l__Humanoid__211 = v210:FindFirstChild("Humanoid");
									if v210 ~= l__Character__35 then
										if l__Humanoid__211 then
											u22 = u22 + 1;
											u23[#u23 + 1] = v210;
										end;
									end;								
								end;
							end;
							v201();
							local function u24()
								local v212 = 0;
								local v213, v214, v215 = pairs(workspace.Characters:GetChildren());
								while true do
									local v216, v217 = v213(v214, v215);
									if v216 then

									else
										break;
									end;
									v215 = v216;
									local l__Humanoid__218 = v217:FindFirstChild("Humanoid");
									if v217 ~= l__Character__35 then
										if l__Humanoid__218 then
											v212 = v212 + 1;
										end;
									end;								
								end;
								return v212;
							end;
							local function u25(p32)
								if p32 then
									u21 = u21 - 1;
								else
									u21 = u21 + 1;
								end;
								if u22 < u21 then
									u21 = 1;
								elseif u21 < 1 then
									u21 = #u23;
								end;
								local v219 = CFrame.new(u23[u21].Humanoid:GetAttribute("RootPosition")) or v29:InvokeServer("getCFrame", u23[u21]);
								v29:FireServer("stream", v219);
								if v219 then
									v200.CFrame = v219;
								end;
								if u23[u21] then
									if not u23[u21]:IsDescendantOf(workspace) then
										v201();
										u23[u21] = nil;
										return u25();
									end;
								end;
								if u23[u21] then
									if u22 < u24() then

									else
										return u23[u21];
									end;
								end;
								v201();
								return u25(true);
							end;
							local v220 = u25();
							if v220 then
								u18 = true;
								v161:Destroy();
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								task.wait(0.5);
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Transparency = 1
								}):Play();
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
									Volume = 1.5
								}):Play();
								l__UI__39.spectate.Visible = true;
								l__UI__39.died.Visible = false;
								l__CurrentCamera__5.CameraType = Enum.CameraType.Follow;
								l__CurrentCamera__5.CameraSubject = v220:FindFirstChild("Head") and v220;
								l__UI__39.spectate.username.Text = "SPECTATING: <font color=\"rgb(0, 255, 0)\">" .. v220.Name .. "</font>";
								v29:FireServer("spectate", v220.Name);
								local u26 = {};
								local function u27()
									l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
										Volume = 0
									}):Play();
									local v221, v222, v223 = pairs(u26);
									while true do
										local v224, v225 = v221(v222, v223);
										if v224 then

										else
											break;
										end;
										v223 = v224;
										v225:Disconnect();									
									end;
								end;
								table.insert(u26, l__RunService__8.Stepped:Connect(function()
									v200.CFrame = l__CurrentCamera__5.CFrame;
									if not l__Humanoid__36:IsDescendantOf(workspace) then
										u27();
										return;
									end;
									l__LocalPlayer__5.CameraMode = Enum.CameraMode.Classic;
									l__LocalPlayer__5.CameraMinZoomDistance = 10;
									l__LocalPlayer__5.CameraMaxZoomDistance = 10;
									u13:Disconnect();
									u14:Disconnect();
								end));
								local v226, v227, v228 = pairs(l__UI__39.spectate:GetChildren());
								while true do
									local v229, v230 = v226(v227, v228);
									if v229 then

									else
										break;
									end;
									v228 = v229;
									if v230:IsA("TextButton") then
										table.insert(u26, v230.MouseButton1Click:Connect(function()
											playsound(l__Assets__26.Sounds.click, l__PlayerGui__7);
											local l__Name__231 = v230.Name;
											if l__Name__231 == "leave" then
												v29:FireServer("spectate");
												l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
													Transparency = 0
												}):Play();
												task.wait(0.5);
												l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
													Transparency = 1
												}):Play();
												u27();
												l__UI__39.spectate.Visible = false;
												l__UI__39.died.Visible = true;
												u18 = false;
												return;
											end;
											if l__Name__231 == "L" then
												local v232 = u25(true);
												l__CurrentCamera__5.CameraType = Enum.CameraType.Follow;
												l__CurrentCamera__5.CameraSubject = v232:FindFirstChild("Head") and v232;
												l__UI__39.spectate.username.Text = "SPECTATING: <font color=\"rgb(0, 255, 0)\">" .. v232.Name .. "</font>";
												v29:FireServer("spectate", v232.Name);
												return;
											end;
											if l__Name__231 == "R" then
												local v233 = u25();
												l__CurrentCamera__5.CameraType = Enum.CameraType.Follow;
												l__CurrentCamera__5.CameraSubject = v233:FindFirstChild("Head") and v233;
												l__UI__39.spectate.username.Text = "SPECTATING: <font color=\"rgb(0, 255, 0)\">" .. v233.Name .. "</font>";
												v29:FireServer("spectate", v233.Name);
											end;
										end));
									end;								
								end;
							end;
						end;
					end));
				end;			
			end;
			l__UserInputService__9.MouseBehavior = Enum.MouseBehavior.Default;
			l__UserInputService__9.MouseIconEnabled = true;
		end;
	end);
end;
if l__GameSettings__41.testGenerateLevel.Value == true and not (not l__RunService__8:IsStudio()) or not l__RunService__8:IsStudio() then
	l__Humanoid__36.RootPart.Anchored = true;
	local v234 = RaycastParams.new();
	v234.FilterDescendantsInstances = { workspace.Buildings, workspace.Terrain };
	v234.FilterType = Enum.RaycastFilterType.Whitelist;
	local v235 = 0;
	local v236 = 0;
	local v237 = tick();
	while l__Humanoid__36:IsDescendantOf(workspace) and not l__LocalPlayer__5.data.spectator.Value do
		if tick() - v237 >= 5 then
			if l__Humanoid__36.RootPart then
				l__Humanoid__36.RootPart.CFrame = l__LocalPlayer__5.data.pos.Value;
			end;
			warn("critical error: timeout. floor not found.");
			break;
		end;
		if tick() - v235 >= 0.5 then
			v235 = tick();
			warn("error: Player is not at the spawn!");
		end;
		local v238, v239 = pcall(function()
			l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
			v29:FireServer("stream", CFrame.new(l__Humanoid__36:GetAttribute("RootPosition")));
			l__CurrentCamera__5.CFrame = CFrame.new(l__Humanoid__36:GetAttribute("RootPosition"));
		end);
		if not v238 then
			warn("critical error: ", v239);
		end;
		l__BaseUI__40.loading.Visible = true;
		if l__Humanoid__36.RootPart then
			if tick() - v236 >= 0.5 then
				v236 = tick();
				warn("error: " .. tick() - v237);
			end;
			l__Humanoid__36.RootPart.CFrame = l__LocalPlayer__5.data.pos.Value;
			local v240 = workspace:Raycast(l__Humanoid__36.RootPart.Position, Vector3.new(0, -100, 0), v234);
			if v240 and ((v240.Instance:IsDescendantOf(workspace.Buildings) or v240.Instance:IsA("Terrain")) and v240.Instance.Parent.Name ~= "Studio") then
				break;
			end;
		end;
		task.wait();	
	end;
	if l__LocalPlayer__5.data.spectator.Value then
		onPlayerDied();
		return;
	end;
	print("player spawned");
end;
while not l__LocalPlayer__5:FindFirstChild("data") do
	l__BaseUI__40.loading.Visible = true;
	task.wait(0.03333333333333333);
end;
warn("client loaded", tick() - tick());
if l__GameSettings__41.testGenerateLevel.Value == true and not (not l__RunService__8:IsStudio()) and l__GameSettings__41.testIntro.Value == true or not l__RunService__8:IsStudio() then
	local v241, v242 = pcall(function()
		if l__ReplicatedStorage__10.Users.intro.Value == false then
			l__ReplicatedStorage__10.Users.intro.Value = true;
			l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
			l__CurrentCamera__5.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
			local l__gameIntro__243 = l__UI__39.gameIntro;
			l__gameIntro__243.Visible = true;
			l__gameIntro__243.gameLogo.fade["in"].Offset = Vector2.new(-1, 0);
			l__gameIntro__243.gameLogo.Visible = true;
			l__BaseUI__40.loading.Visible = true;
			l__BaseUI__40.wa.Visible = false;
			local v244 = {};
			for v245, v246 in pairs(l__gameIntro__243:GetDescendants()) do
				if v246:IsA("ImageLabel") then
					v244[#v244 + 1] = v246;
				end;
			end;
			for v247 = 1, #v244 do
				print("loading intro: " .. v247 .. "/" .. #v244);
				l__ContentProvider__18:PreloadAsync({ v244[v247] });
			end;
			warn("intro loaded.");
			l__BaseUI__40.loading.Visible = false;
			print(l__BaseUI__40.loading.Visible);
			playsound(l__Assets__26.Sounds.vhs_insert, l__PlayerGui__7);
			task.wait(0.2);
			l__TweenService__13:Create(l__gameIntro__243.gameLogo.fade["in"], TweenInfo.new(6, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(4);
			l__gameIntro__243.gameLogo.fade["in"].Enabled = false;
			l__gameIntro__243.gameLogo.fade.out.Enabled = true;
			l__TweenService__13:Create(l__gameIntro__243.gameLogo.fade.out, TweenInfo.new(2, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(2.5);
			l__gameIntro__243.gameLogo.Visible = false;
			local v248 = playsound(l__Assets__26.Sounds.woosh, l__PlayerGui__7);
			l__gameIntro__243.warnings.fade["in"].Offset = Vector2.new(-1, 0);
			l__gameIntro__243.warnings.Visible = true;
			l__TweenService__13:Create(l__gameIntro__243.warnings.fade["in"], TweenInfo.new(3, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(5.5);
			l__TweenService__13:Create(v248, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Volume = 0
			}):Play();
			l__gameIntro__243.warnings.fade["in"].Enabled = false;
			l__gameIntro__243.warnings.fade.out.Enabled = true;
			l__TweenService__13:Create(l__gameIntro__243.warnings.fade.out, TweenInfo.new(2, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(2.5);
			l__gameIntro__243.warnings.Visible = false;
			local v249 = playsound(l__Assets__26.Sounds.door_knock, l__PlayerGui__7);
			l__gameIntro__243.headphones.fade["in"].Offset = Vector2.new(-1, 0);
			l__gameIntro__243.headphones.Visible = true;
			l__TweenService__13:Create(l__gameIntro__243.headphones.fade["in"], TweenInfo.new(3, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(3);
			l__TweenService__13:Create(v249, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Volume = 0
			}):Play();
			l__gameIntro__243.headphones.fade["in"].Enabled = false;
			l__gameIntro__243.headphones.fade.out.Enabled = true;
			l__TweenService__13:Create(l__gameIntro__243.headphones.fade.out, TweenInfo.new(2, Enum.EasingStyle.Sine), {
				Offset = Vector2.new(1, 0)
			}):Play();
			task.wait(2);
			l__gameIntro__243.headphones.Visible = false;
			l__BaseUI__40.loading.Visible = true;
			task.wait(2);
		end;
	end);
	if not v241 then
		l__UI__39.gameIntro.Visible = false;
	end;
end;
l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(3, Enum.EasingStyle.Sine), {
	Volume = 5
}):Play();
local u28 = false;
local u29 = 0;
function closeSub()
	u28 = true;
	u29 = tick();
	if u28 then
		while true do
			if tick() - u29 < math.max(#l__BaseUI__40.output.Text / 10, 1) then

			else
				break;
			end;
			task.wait(0.03333333333333333);		
		end;
		u28 = false;
		l__BaseUI__40.output.Visible = false;
	end;
end;
l__BaseUI__40.output.Visible = false;
if l__TouchEnabled__4 then
	local v250 = "Double-tap to skip";
elseif l__GamepadEnabled__42 then
	v250 = "Press Button X to skip";
else
	v250 = "Press SPACE to skip";
end;
local u30 = false;
function isSkipped()
	local v251 = true;
	if u30 ~= true then
		v251 = not l__Humanoid__36.RootPart or not l__Character__35:IsDescendantOf(workspace);
	end;
	return v251;
end;
local u31 = false;
local u32 = {};
local u33 = {};
local u34 = {};
local u35 = nil;
local u36 = {};
local u37 = {};
local u38 = nil;
local u39 = nil;
local u40 = nil;
function stopCutscene(p33, p34)
	if p33 then
		print("cutscene skipped.");
	end;
	l__BaseUI__40.skip.Text = v250 .. " (" .. #l__Players__19:GetPlayers() .. "/" .. #l__Players__19:GetPlayers() .. ")";
	u30 = true;
	if not p34 then
		l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
		l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER_2");
		l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
			Transparency = 0
		}):Play();
		task.wait(0.5);
		local v252, v253, v254 = pairs(u32);
		while true do
			local v255, v256 = v252(v253, v254);
			if v255 then

			else
				break;
			end;
			v254 = v255;
			if not v256:IsDescendantOf(l__Lighting__12) then
				l__Lighting__12:ClearAllChildren();
				break;
			end;		
		end;
		local v257, v258, v259 = pairs(u32);
		while true do
			local v260, v261 = v257(v258, v259);
			if v260 then

			else
				break;
			end;
			v259 = v260;
			v261.Parent = l__Lighting__12;		
		end;
		local v262, v263, v264 = pairs(l__Assets__26.Maps[l__LocalPlayer__5.data.currentLevel.Value].Lightnings.Settings:GetChildren());
		while true do
			local v265, v266 = v262(v263, v264);
			if v265 then

			else
				break;
			end;
			v264 = v265;
			l__Lighting__12[v266.Name] = v266.Value;		
		end;
	end;
	local v267, v268, v269 = pairs(u33);
	while true do
		local v270, v271 = v267(v268, v269);
		if v270 then

		else
			break;
		end;
		v269 = v270;
		v271:Disconnect();	
	end;
	local v272, v273, v274 = pairs(u34);
	while true do
		local v275, v276 = v272(v273, v274);
		if v275 then

		else
			break;
		end;
		v274 = v275;
		v276:Disconnect();	
	end;
	if not p34 then
		if u35 then
			local v277 = Instance.new("StringValue");
			v277.Name = "used";
			v277.Parent = u35;
		end;
		local v278, v279, v280 = pairs(u36);
		while true do
			local v281, v282 = v278(v279, v280);
			if v281 then

			else
				break;
			end;
			v280 = v281;
			v282:Destroy();		
		end;
		local v283, v284, v285 = pairs(u37);
		while true do
			local v286, v287 = v283(v284, v285);
			if v286 then

			else
				break;
			end;
			v285 = v286;
			l__TweenService__13:Create(v287, TweenInfo.new(0.00016, Enum.EasingStyle.Linear), {
				Volume = 0
			}):Play();
			v287:Stop();		
		end;
		closeSub();
		l__BaseUI__40.skip.Visible = false;
		l__vars__38.isCutscene.Value = false;
		l__Humanoid__36.AutoRotate = true;
		l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Sine), {
			Transparency = 1
		}):Play();
		l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
			Volume = 5
		}):Play();
		l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
		l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
		if u38 then
			u38.Parent = u39;
		end;
	end;
	if u40 then
		u40:Disconnect();
	end;
end;
function tobeContinued()
	stopCutscene(false);
	l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(0.00016, Enum.EasingStyle.Sine), {
		Volume = 0
	}):Play();
	local l__tbc__288 = l__BaseUI__40.tbc;
	l__tbc__288.Transparency = 1;
	l__tbc__288.top.TextTransparency = 1;
	l__tbc__288.bottom.TextTransparency = 1;
	l__tbc__288.bottom1.TextTransparency = 1;
	l__tbc__288.Visible = true;
	l__TweenService__13:Create(l__tbc__288, TweenInfo.new(0.15, Enum.EasingStyle.Sine), {
		Transparency = 0
	}):Play();
	l__TweenService__13:Create(l__tbc__288.top, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		TextTransparency = 0
	}):Play();
	task.wait(1.5);
	l__TweenService__13:Create(l__tbc__288.bottom, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
		TextTransparency = 0
	}):Play();
	task.wait(1);
	l__TweenService__13:Create(l__tbc__288.bottom1, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
		TextTransparency = 0
	}):Play();
	task.wait(8);
	v29:FireServer("lobby");
end;
local function u41()
	if u31 then
		return;
	end;
	if #l__Players__19:GetPlayers() <= #l__GameSettings__41.Skipped:GetChildren() then
		u31 = true;
	end;
	l__BaseUI__40.skip.Text = v250 .. " (" .. #l__GameSettings__41.Skipped:GetChildren() .. "/" .. #l__Players__19:GetPlayers() .. ")";
end;
local v289, v290 = pcall(function()
	local function v291()
		u40 = l__Assets__26.Events.Skip.OnClientEvent:Connect(function()
			playsound(l__Assets__26.Sounds.click, l__PlayerGui__7);
			stopCutscene(true);
		end);
		table.insert(u34, l__UserInputService__9.InputBegan:Connect(function(p35, p36)
			if not p36 and (p35.KeyCode == Enum.KeyCode.Space or p35.KeyCode == Enum.KeyCode.ButtonX) then
				v29:FireServer("skipCutscene");
			end;
		end));
		local u42 = 0;
		table.insert(u34, l__UserInputService__9.TouchStarted:Connect(function()
			if tick() - u42 < 0.2 then
				v29:FireServer("skipCutscene");
			end;
		end));
		table.insert(u34, l__UserInputService__9.TouchEnded:Connect(function()
			u42 = tick();
		end));
		u41();
		table.insert(u34, l__GameSettings__41.Skipped.ChildAdded:Connect(u41));
		table.insert(u34, l__GameSettings__41.Skipped.ChildRemoved:Connect(u41));
	end;
	print(l__GameSettings__41.currentLevel.Value);
	u35 = l__Assets__26.Maps[l__GameSettings__41.currentLevel.Value]:FindFirstChild("Cutscenes");
	if not (not u35) and l__GameSettings__41.testGenerateLevel.Value == true and not (not l__RunService__8:IsStudio()) and l__GameSettings__41.testCutscene.Value == true or not l__RunService__8:IsStudio() then
		if not u35 or not (not u35:FindFirstChild("used")) or isSkipped() then
			return;
		else
			local v292 = nil;
			local v293 = nil;
			local v294 = nil;
			local v295 = nil;
			local v296 = nil;
			local v297 = nil;
			l__Humanoid__36.AutoRotate = false;
			if l__GameSettings__41.currentLevel.Value == 0 then
				v291();
				l__BaseUI__40.skip.Visible = true;
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__BaseUI__40.loading.Visible = true;
				l__vars__38.isCutscene.Value = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				for v298, v299 in pairs(l__Lighting__12:GetChildren()) do
					v299.Parent = nil;
					u32[#u32 + 1] = v299;
				end;
				for v300, v301 in pairs(u35.Lightnings.Instances:GetChildren()) do
					v301:Clone().Parent = l__Lighting__12;
				end;
				for v302, v303 in pairs(u35.Lightnings.Settings:GetChildren()) do
					l__Lighting__12[v303.Name] = v303.Value;
				end;
				local v304 = Instance.new("BindableEvent");
				local u43 = {};
				local u44 = {};
				local u45 = false;
				v304.Event:Connect(function()
					v304:Destroy();
					for v305, v306 in pairs(u35.Rigs:GetDescendants()) do
						if v306:IsA("Animation") then
							u43[#u43 + 1] = v306;
						end;
					end;
					for v307, v308 in pairs(u35.Sounds:GetDescendants()) do
						if v308:IsA("Sound") then
							u44[#u44 + 1] = v308;
						end;
					end;
					for v309 = 1, #u43 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v309 .. "/" .. #u43);
						l__ContentProvider__18:PreloadAsync({ u43[v309] });
					end;
					for v310 = 1, #u44 do
						if isSkipped() then
							break;
						end;
						print("loading sounds: " .. v310 .. "/" .. #u44);
						l__ContentProvider__18:PreloadAsync({ u44[v310] });
					end;
					u45 = true;
				end);
				v304:Fire();
				while not u45 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__SoundService__15.AmbientReverb = Enum.ReverbType.NoReverb;
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v311 = u35.Model:Clone();
				v311.Parent = workspace.Ignored;
				u36[#u36 + 1] = v311;
				local v312 = nil;
				local v313 = nil;
				local v314 = nil;
				local v315 = nil;
				local v316 = {};
				local v317 = {};
				local v318 = {};
				for v319, v320 in pairs(u35.Rigs:GetChildren()) do
					local v321 = v320:Clone();
					local l__Animation__322 = v321.Animation;
					if v321.Name == "CameraRig" then
						pcall(function()
							v30(l__LocalPlayer__5.Name, workspace.Ignored, v321, true);
						end);
						task.delay(0.03333333333333333, function()
							for v323, v324 in pairs(v321:GetDescendants()) do
								pcall(function()
									if v324.Parent.Parent:IsA("Accoutrement") and (v324.Name == "FaceFrontAttachment" or v324.Name == "HatAttachment" or v324.Name == "NeckAttachment" or v324.Name == "HairAttachment" or v324.Name == "FaceCenterAttachment") then
										v324.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v312 = v321.Head;
						v313 = v321.Humanoid.Animator:LoadAnimation(l__Animation__322);
						v314 = v321.Humanoid.Animator:LoadAnimation(v321.Getup);
						v316[#v316 + 1] = v313;
					else
						for v325, v326 in pairs(l__Players__19:GetPlayers()) do
							if v326 ~= l__LocalPlayer__5 and v317[v326.Name] == nil then
								v317[v326.Name] = v326.Name;
								for v327, v328 in pairs(v321:GetChildren()) do
									if not (not v328:IsA("Accoutrement")) or not (not v328:IsA("Shirt")) or not (not v328:IsA("Pants")) or v328:IsA("ShirtGraphic") then
										v328:Destroy();
									end;
								end;
								pcall(function()
									v30(v326.Name, workspace.Ignored, v321, true);
								end);
								break;
							end;
						end;
						v321.Parent = workspace.Ignored;
						local v329 = v321.Humanoid.Animator:LoadAnimation(l__Animation__322);
						if v321.Name == "Director" then
							v315 = v329;
						end;
						v316[#v316 + 1] = v329;
					end;
					v318[v321.Name] = v321;
					u36[#u36 + 1] = v321;
				end;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					playsound(u35.Sounds.VL.cameraroll, l__PlayerGui__7);
					l__BaseUI__40.output.Visible = true;
					l__BaseUI__40.output.Text = u35.Sounds.VL.cameraroll.sub.Value;
					closeSub();
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						u37[#u37 + 1] = u35.Sounds.ambience;
						u35.Sounds.ambience:Play();
						for v330, v331 in pairs(v316) do
							v331:Play();
						end;
						for v332, v333 in pairs(u35.Sounds.VL:GetChildren()) do
							table.insert(u33, v315:GetMarkerReachedSignal(v333.Name):Connect(function()
								l__BaseUI__40.output.Visible = true;
								l__BaseUI__40.output.Text = v333.sub.Value;
								playsound(v333, v318[v333.char.Value].Head);
								closeSub();
							end));
						end;
						local u46 = false;
						local u47 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1000, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v312.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v313.IsPlaying and v313.Length > 0 and v313.Length - 0.35 < v313.TimePosition and not u46 then
								u46 = true;
								l__TweenService__13:Create(u35.Sounds.ambience, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Volume = 0
								}):Play();
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								for v334, v335 in pairs(u33) do
									v335:Disconnect();
								end;
								task.delay(0.25, function()
									l__BaseUI__40.output.Visible = true;
									l__BaseUI__40.output.Text = "You: WOAH";
									task.spawn(closeSub);
								end);
								playsound(getRandomChildren(u35.Sounds.Falls), l__PlayerGui__7);
								task.wait(1.5);
								l__SoundService__15.AmbientReverb = Enum.ReverbType.City;
								u35.Sounds.ambience:Stop();
								u35.Sounds.ambience.Volume = u35.Sounds.ambience.Volume;
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								l__Lighting__12:ClearAllChildren();
								for v336, v337 in pairs(u32) do
									v337.Parent = l__Lighting__12;
								end;
								for v338, v339 in pairs(l__Assets__26.Maps[l__LocalPlayer__5.data.currentLevel.Value].Lightnings.Settings:GetChildren()) do
									l__Lighting__12[v339.Name] = v339.Value;
								end;
								v311:Destroy();
								local v340 = nil;
								for v341, v342 in pairs(v318) do
									if v342.Name ~= "CameraRig" then
										v342:Destroy();
									else
										v340 = v342;
									end;
								end;
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								for v343, v344 in pairs(v316) do
									v344:Stop();
								end;
								v340.Humanoid.RootPart.CFrame = l__Humanoid__36.RootPart.CFrame;
								v314:Play();
								task.spawn(function()
									task.wait(1);
									l__BaseUI__40.output.Visible = true;
									l__BaseUI__40.output.Text = playsound(u35.Sounds.cough, v340.Head).text.Value;
									task.spawn(closeSub);
									task.wait(3);
									l__BaseUI__40.output.Visible = true;
									l__BaseUI__40.output.Text = playsound(getRandomChildren(u35.Sounds.hello), v340.Head).text.Value;
									task.spawn(closeSub);
									task.wait(3);
									l__BaseUI__40.output.Visible = true;
									l__BaseUI__40.output.Text = playsound(getRandomChildren(u35.Sounds.anybody), v340.Head).text.Value;
									task.spawn(closeSub);
									task.wait(5);
									l__BaseUI__40.output.Visible = true;
									l__BaseUI__40.output.Text = "You: Uh..";
									task.spawn(closeSub);
								end);
								l__RunService__8:BindToRenderStep("CUTSCENE_RENDER_2", 1001, function()
									if isSkipped() then
										stopCutscene(true);
										return;
									end;
									l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
									l__CurrentCamera__5.CFrame = v312.CFrame;
									l__CurrentCamera__5.FieldOfView = 90;
									if v314.IsPlaying and v314.Length > 0 and v314.Length - 0.25 <= v314.TimePosition and not u47 then
										u47 = true;
										l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
											Transparency = 0
										}):Play();
										task.wait(0.25);
										local v345 = Instance.new("StringValue");
										v345.Name = "used";
										v345.Parent = u35;
										v340:Destroy();
										l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER_2");
										l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
										l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
										l__vars__38.isCutscene.Value = false;
										task.wait(0.25);
										l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
											Transparency = 1
										}):Play();
										stopCutscene();
									end;
								end);
								return;
							end;
							if not u46 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(8, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						v292 = l__Humanoid__36;
						v294 = true;
						v293 = "AutoRotate";
						v295 = v292;
						v296 = v293;
						v297 = v294;
						v295[v296] = v297;
						return;
					end;
				end;
			elseif l__GameSettings__41.currentLevel.Value == 2 or l__GameSettings__41.currentLevel.Value == 3 then
				v291();
				l__BaseUI__40.skip.Visible = true;
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__vars__38.isCutscene.Value = true;
				l__BaseUI__40.loading.Visible = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				local v346 = Instance.new("BindableEvent");
				local u48 = v346;
				local u49 = {};
				local u50 = false;
				v346.Event:Connect(function()
					u48:Destroy();
					for v347, v348 in pairs(u35.Rigs:GetDescendants()) do
						if v348:IsA("Animation") then
							u49[#u49 + 1] = v348;
						end;
					end;
					for v349 = 1, #u49 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v349 .. "/" .. #u49);
						l__ContentProvider__18:PreloadAsync({ u49[v349] });
					end;
					u50 = true;
				end);
				u48:Fire();
				while not u50 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v350 = nil;
				local v351 = nil;
				local v352 = {};
				local v353 = {};
				local v354 = {};
				local v355 = nil;
				for v356, v357 in pairs(u35.Rigs:GetChildren()) do
					local v358 = v357:Clone();
					if v358.Name == "CameraRig" then
						v30(l__LocalPlayer__5.Name, workspace.Ignored, v358, true);
						task.delay(0.03333333333333333, function()
							for v359, v360 in pairs(v358:GetDescendants()) do
								pcall(function()
									if v360.Parent.Parent:IsA("Accoutrement") and (v360.Name == "FaceFrontAttachment" or v360.Name == "HatAttachment" or v360.Name == "NeckAttachment" or v360.Name == "HairAttachment" or v360.Name == "FaceCenterAttachment") then
										v360.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v355 = v358;
						v350 = v358.Head;
						v351 = v358.Humanoid.Animator:LoadAnimation(v358.Animation);
						v352[#v352 + 1] = v351;
					end;
					v354[#v354 + 1] = v358;
					u36[#u36 + 1] = v358;
				end;
				v355.Humanoid.RootPart.CFrame = l__Humanoid__36.RootPart.CFrame;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						if l__GameSettings__41.currentLevel.Value == 3 then
							u37[#u37 + 1] = u35.Sounds.ambience;
							u35.Sounds.ambience:Play();
						end;
						for v361, v362 in pairs(v352) do
							v362:Play();
						end;
						l__BaseUI__40.output.Visible = true;
						local v363 = { "You: God dammit, my head!", "You: Ah, crap.", "You: What's going on.." };
						l__BaseUI__40.output.Text = v363[math.random(#v363)];
						closeSub();
						local u51 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1001, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v350.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v351.IsPlaying and v351.Length > 0 and v351.Length - 0.25 <= v351.TimePosition and not u51 then
								u51 = true;
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								task.wait(0.25);
								if l__GameSettings__41.currentLevel.Value == 3 then
									l__TweenService__13:Create(u35.Sounds.ambience, TweenInfo.new(1, Enum.EasingStyle.Quint), {
										Volume = 0
									}):Play();
									local l__Volume__52 = u35.Sounds.ambience.Volume;
									task.delay(1, function()
										u35.Sounds.ambience:Stop();
										u35.Sounds.ambience.Volume = l__Volume__52;
									end);
								end;
								local v364 = Instance.new("StringValue");
								v364.Name = "used";
								v364.Parent = u35;
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								v355:Destroy();
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
								l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
								l__vars__38.isCutscene.Value = false;
								task.wait(0.25);
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								stopCutscene();
								return;
							end;
							if not u51 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(8, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						u49 = l__Humanoid__36;
						u48 = true;
						v293 = "AutoRotate";
						v295 = u49;
						v296 = v293;
						v297 = u48;
						v295[v296] = v297;
						return;
					end;
				end;
			elseif l__GameSettings__41.currentLevel.Value == 6 then
				v291();
				l__BaseUI__40.skip.Visible = true;
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__vars__38.isCutscene.Value = true;
				l__BaseUI__40.loading.Visible = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				local v365 = Instance.new("BindableEvent");
				local u53 = {};
				local u54 = false;
				v365.Event:Connect(function()
					v365:Destroy();
					for v366, v367 in pairs(u35.Rigs:GetDescendants()) do
						if v367:IsA("Animation") then
							u53[#u53 + 1] = v367;
						end;
					end;
					for v368 = 1, #u53 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v368 .. "/" .. #u53);
						l__ContentProvider__18:PreloadAsync({ u53[v368] });
					end;
					u54 = true;
				end);
				v365:Fire();
				while not u54 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v369 = nil;
				local v370 = nil;
				local v371 = {};
				local v372 = {};
				local v373 = {};
				local v374 = nil;
				for v375, v376 in pairs(u35.Rigs:GetChildren()) do
					local v377 = v376:Clone();
					if v377.Name == "CameraRig" then
						v30(l__LocalPlayer__5.Name, workspace.Ignored, v377, true);
						task.delay(0.03333333333333333, function()
							for v378, v379 in pairs(v377:GetDescendants()) do
								pcall(function()
									if v379.Parent.Parent:IsA("Accoutrement") and (v379.Name == "FaceFrontAttachment" or v379.Name == "HatAttachment" or v379.Name == "NeckAttachment" or v379.Name == "HairAttachment" or v379.Name == "FaceCenterAttachment") then
										v379.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v374 = v377;
						v369 = v377.Head;
						v370 = v377.Humanoid.Animator:LoadAnimation(v377.Animation);
						v371[#v371 + 1] = v370;
					end;
					v373[#v373 + 1] = v377;
					u36[#u36 + 1] = v377;
				end;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						u37[#u37 + 1] = u35.Sounds.ambience;
						u35.Sounds.ambience:Play();
						for v380, v381 in pairs(v371) do
							v381:Play();
						end;
						l__BaseUI__40.output.Visible = true;
						local v382 = { "What is this place!?" };
						l__BaseUI__40.output.Text = v382[math.random(#v382)];
						closeSub();
						l__SoundService__15.AmbientReverb = Enum.ReverbType.Hallway;
						table.insert(u34, v370:GetMarkerReachedSignal("spot"):Connect(function()
							local l__Smiler__383 = workspace.Entities:FindFirstChild("Smiler");
							if l__Smiler__383 and l__Smiler__383:FindFirstChild("Intro") then
								local v384 = l__Smiler__383.Humanoid.Animator:LoadAnimation(l__Smiler__383.Intro);
								v384:Play();
								table.insert(u34, v384:GetMarkerReachedSignal("step"):Connect(function()
									l__Assets__26.Events.Shake:Fire("Explosion");
									playsound(getRandomChildren(l__Assets__26.Sounds.Monsters.SmilerCHASE.Footsteps), l__Smiler__383.RootPart);
								end));
							end;
						end));
						local v385 = RaycastParams.new();
						v385.FilterDescendantsInstances = { workspace.Buildings };
						v385.FilterType = Enum.RaycastFilterType.Whitelist;
						v385.CollisionGroup = "Raycast";
						table.insert(u34, v370:GetMarkerReachedSignal("step"):Connect(function()
							local v386 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, Vector3.new(0, -100, 0), v385);
							if v386 then
								local v387 = l__Assets__26.Events.Footsteps:Invoke(v386.Instance.Material);
								if v387 then
									local v388 = v387:Clone();
									v388.RollOffMinDistance = 0.75;
									v388.RollOffMaxDistance = 5;
									v388.Volume = 0.3;
									v388.PlaybackSpeed = v388.PlaybackSpeed + math.random() * 0.4;
									v388.Parent = v374.LowerTorso;
									v388:Play();
									l__Debris__14:AddItem(v388, 3);
								end;
							end;
						end));
						local u55 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1001, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v369.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v370.IsPlaying and v370.Length > 0 and v370.Length - 0.25 <= v370.TimePosition and not u55 then
								u55 = true;
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								task.wait(0.25);
								l__TweenService__13:Create(u35.Sounds.ambience, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Volume = 0
								}):Play();
								local l__Volume__56 = u35.Sounds.ambience.Volume;
								task.delay(1, function()
									u35.Sounds.ambience:Stop();
									u35.Sounds.ambience.Volume = l__Volume__56;
								end);
								local v389 = Instance.new("StringValue");
								v389.Name = "used";
								v389.Parent = u35;
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								v374:Destroy();
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
								l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
								l__vars__38.isCutscene.Value = false;
								task.wait(0.25);
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								stopCutscene();
								return;
							end;
							if not u55 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						v292 = l__Humanoid__36;
						v294 = true;
						v293 = "AutoRotate";
						v295 = v292;
						v296 = v293;
						v297 = v294;
						v295[v296] = v297;
						return;
					end;
				end;
			elseif l__GameSettings__41.currentLevel.Value == 7 then
				v291();
				l__BaseUI__40.skip.Visible = true;
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__vars__38.isCutscene.Value = true;
				l__BaseUI__40.loading.Visible = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				for v390, v391 in pairs(l__Lighting__12:GetChildren()) do
					v391.Parent = nil;
					u32[#u32 + 1] = v391;
				end;
				for v392, v393 in pairs(u35.Lightnings.Instances:GetChildren()) do
					v393:Clone().Parent = l__Lighting__12;
				end;
				for v394, v395 in pairs(u35.Lightnings.Settings:GetChildren()) do
					l__Lighting__12[v395.Name] = v395.Value;
				end;
				local v396 = Instance.new("BindableEvent");
				local u57 = {};
				local u58 = false;
				v396.Event:Connect(function()
					v396:Destroy();
					for v397, v398 in pairs(u35.Rigs:GetDescendants()) do
						if v398:IsA("Animation") then
							u57[#u57 + 1] = v398;
						end;
					end;
					for v399 = 1, #u57 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v399 .. "/" .. #u57);
						l__ContentProvider__18:PreloadAsync({ u57[v399] });
					end;
					u58 = true;
				end);
				v396:Fire();
				while not u58 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v400 = nil;
				local v401 = nil;
				local v402 = nil;
				local v403 = {};
				local v404 = {};
				local v405 = {};
				local v406 = nil;
				for v407, v408 in pairs(u35.Rigs:GetChildren()) do
					local v409 = v408:Clone();
					if v409.Name == "CameraRig" then
						v30(l__LocalPlayer__5.Name, workspace.Ignored, v409, true);
						task.delay(0.03333333333333333, function()
							for v410, v411 in pairs(v409:GetDescendants()) do
								pcall(function()
									if v411.Parent.Parent:IsA("Accoutrement") and (v411.Name == "FaceFrontAttachment" or v411.Name == "HatAttachment" or v411.Name == "NeckAttachment" or v411.Name == "HairAttachment" or v411.Name == "FaceCenterAttachment") then
										v411.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v406 = v409;
						v400 = v409.Head;
						v401 = v409.Humanoid.Animator:LoadAnimation(v409.Animation);
						v402 = v409.Humanoid.Animator:LoadAnimation(v409.Second);
						v403[#v403 + 1] = v401;
					end;
					v405[#v405 + 1] = v409;
					u36[#u36 + 1] = v409;
				end;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						u37[#u37 + 1] = u35.Sounds.ambience;
						u35.Sounds.ambience:Play();
						for v412, v413 in pairs(v403) do
							v413:Play();
						end;
						table.insert(u34, v401:GetMarkerReachedSignal("slam"):Connect(function()
							playsound(getRandomChildren(u35.Sounds.slam), l__PlayerGui__7);
						end));
						local v414 = RaycastParams.new();
						v414.FilterDescendantsInstances = { workspace.Buildings };
						v414.FilterType = Enum.RaycastFilterType.Whitelist;
						v414.CollisionGroup = "Raycast";
						table.insert(u34, v401:GetMarkerReachedSignal("step"):Connect(function()
							local v415 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, Vector3.new(0, -100, 0), v414);
							if v415 then
								local v416 = l__Assets__26.Events.Footsteps:Invoke(v415.Instance.Material);
								if v416 then
									local v417 = v416:Clone();
									v417.RollOffMinDistance = 0.75;
									v417.RollOffMaxDistance = 5;
									v417.Volume = 0.3;
									v417.PlaybackSpeed = v417.PlaybackSpeed + math.random() * 0.4;
									v417.Parent = v406.LowerTorso;
									v417:Play();
									l__Debris__14:AddItem(v417, 3);
								end;
							end;
						end));
						table.insert(u34, v402:GetMarkerReachedSignal("step"):Connect(function()
							local v418 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, Vector3.new(0, -100, 0), v414);
							if v418 then
								local v419 = l__Assets__26.Events.Footsteps:Invoke(v418.Instance.Material);
								if v419 then
									local v420 = v419:Clone();
									v420.RollOffMinDistance = 0.75;
									v420.RollOffMaxDistance = 5;
									v420.Volume = 0.3;
									v420.PlaybackSpeed = v420.PlaybackSpeed + math.random() * 0.4;
									v420.Parent = v406.LowerTorso;
									v420:Play();
									l__Debris__14:AddItem(v420, 3);
								end;
							end;
						end));
						local u59 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1001, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v400.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v401.IsPlaying and v401.Length > 0 and v401.Length - 0.75 <= v401.TimePosition and not u59 then
								u59 = true;
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								for v421, v422 in pairs(u33) do
									v422:Disconnect();
								end;
								l__TweenService__13:Create(u35.Sounds.ambience, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Volume = 0
								}):Play();
								local l__Volume__60 = u35.Sounds.ambience.Volume;
								task.delay(1, function()
									u35.Sounds.ambience:Stop();
									u35.Sounds.ambience.Volume = l__Volume__60;
								end);
								task.wait(2.5);
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								l__Lighting__12:ClearAllChildren();
								for v423, v424 in pairs(u32) do
									v424.Parent = l__Lighting__12;
								end;
								for v425, v426 in pairs(l__Assets__26.Maps[l__LocalPlayer__5.data.currentLevel.Value].Lightnings.Settings:GetChildren()) do
									l__Lighting__12[v426.Name] = v426.Value;
								end;
								local v427 = nil;
								for v428, v429 in pairs(v405) do
									if v429.Name ~= "CameraRig" then
										v429:Destroy();
									else
										v427 = v429;
									end;
								end;
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								for v430, v431 in pairs(v403) do
									v431:Stop();
								end;
								v427.Humanoid.RootPart.CFrame = u35.SecondPos.CFrame;
								v402:Play();
								local v432 = workspace.Buildings:FindFirstChild("7") and workspace.Buildings["7"]:FindFirstChild("Poster");
								local v433, v434 = CFrame.new();
								local u61 = v433;
								local u62 = v434;
								table.insert(u34, v402:GetMarkerReachedSignal("pick"):Connect(function()
									if v432 then
										playsound(u35.Sounds.paper, v432.PrimaryPart);
										u61 = v432.PrimaryPart.CFrame;
										v432.PrimaryPart.Anchored = false;
										u62 = Instance.new("Weld");
										u62.C0 = v427.RightHand.CFrame:toObjectSpace(v432.PrimaryPart.CFrame);
										u62.Part0 = v427.RightHand;
										u62.Part1 = v432.PrimaryPart;
										u62.Parent = v427;
									end;
								end));
								l__RunService__8:BindToRenderStep("CUTSCENE_RENDER_2", 1001, function()
									if isSkipped() then
										stopCutscene(true);
										return;
									end;
									l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
									l__CurrentCamera__5.CFrame = v400.CFrame;
									l__CurrentCamera__5.FieldOfView = 90;
									if v402.IsPlaying and v402.Length > 0 and v402.Length - 0.25 <= v402.TimePosition and not process2 then
										process2 = true;
										l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
											Transparency = 0
										}):Play();
										task.wait(0.25);
										if u62 then
											u62:Destroy();
										end;
										if v432 then
											v432.PrimaryPart.CFrame = u61;
											v432.PrimaryPart.Anchored = true;
										end;
										local v435 = Instance.new("StringValue");
										v435.Name = "used";
										v435.Parent = u35;
										v427:Destroy();
										l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER_2");
										l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
										l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
										l__vars__38.isCutscene.Value = false;
										task.wait(0.25);
										l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
											Transparency = 1
										}):Play();
										stopCutscene();
									end;
								end);
								return;
							end;
							if not u59 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(11, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						v292 = l__Humanoid__36;
						v294 = true;
						v293 = "AutoRotate";
						v295 = v292;
						v296 = v293;
						v297 = v294;
						v295[v296] = v297;
						return;
					end;
				end;
			elseif l__GameSettings__41.currentLevel.Value == 8 then
				v291();
				l__BaseUI__40.skip.Visible = true;
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__vars__38.isCutscene.Value = true;
				l__BaseUI__40.loading.Visible = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				u38 = workspace.Buildings:FindFirstChild("CutsceneOBJECTS", true);
				if u38 then
					u39 = u38.Parent;
					u38.Parent = nil;
				end;
				local v436 = Instance.new("BindableEvent");
				local u63 = {};
				local u64 = false;
				v436.Event:Connect(function()
					v436:Destroy();
					for v437, v438 in pairs(u35.Rigs:GetDescendants()) do
						if v438:IsA("Animation") then
							u63[#u63 + 1] = v438;
						end;
					end;
					for v439 = 1, #u63 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v439 .. "/" .. #u63);
						l__ContentProvider__18:PreloadAsync({ u63[v439] });
					end;
					u64 = true;
				end);
				v436:Fire();
				while not u64 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v440 = nil;
				local v441 = nil;
				local v442 = {};
				local v443 = {};
				local v444 = {};
				local v445 = nil;
				for v446, v447 in pairs(u35.Rigs:GetChildren()) do
					local v448 = v447:Clone();
					if v448.Name == "CameraRig" then
						v30(l__LocalPlayer__5.Name, workspace.Ignored, v448, true);
						task.delay(0.03333333333333333, function()
							for v449, v450 in pairs(v448:GetDescendants()) do
								pcall(function()
									if v450.Parent.Parent:IsA("Accoutrement") and (v450.Name == "FaceFrontAttachment" or v450.Name == "HatAttachment" or v450.Name == "NeckAttachment" or v450.Name == "HairAttachment" or v450.Name == "FaceCenterAttachment") then
										v450.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v445 = v448;
						v440 = v448.Head;
						v441 = v448.Humanoid.Animator:LoadAnimation(v448.Animation);
						v442[#v442 + 1] = v441;
					end;
					v444[#v444 + 1] = v448;
					u36[#u36 + 1] = v448;
				end;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						for v451, v452 in pairs(v442) do
							v452:Play();
						end;
						local v453 = RaycastParams.new();
						v453.FilterDescendantsInstances = { workspace.Buildings };
						v453.FilterType = Enum.RaycastFilterType.Whitelist;
						v453.CollisionGroup = "Raycast";
						table.insert(u34, v441:GetMarkerReachedSignal("step"):Connect(function()
							local v454 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, Vector3.new(0, -100, 0), v453);
							if v454 then
								local v455 = l__Assets__26.Events.Footsteps:Invoke(v454.Instance.Material);
								if v455 then
									local v456 = v455:Clone();
									v456.RollOffMinDistance = 0.75;
									v456.RollOffMaxDistance = 5;
									v456.Volume = 0.3;
									v456.PlaybackSpeed = v456.PlaybackSpeed + math.random() * 0.4;
									v456.Parent = v445.LowerTorso;
									v456:Play();
									l__Debris__14:AddItem(v456, 3);
								end;
							end;
						end));
						local u65 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1001, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v440.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v441.IsPlaying and v441.Length > 0 and v441.Length - 0.25 <= v441.TimePosition and not u65 then
								u65 = true;
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								task.wait(0.25);
								local v457 = Instance.new("StringValue");
								v457.Name = "used";
								v457.Parent = u35;
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								v445:Destroy();
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
								l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
								l__vars__38.isCutscene.Value = false;
								task.wait(0.25);
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								stopCutscene();
								return;
							end;
							if not u65 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						v292 = l__Humanoid__36;
						v294 = true;
						v293 = "AutoRotate";
						v295 = v292;
						v296 = v293;
						v297 = v294;
						v295[v296] = v297;
						return;
					end;
				end;
			elseif l__GameSettings__41.currentLevel.Value == 11 then
				l__Humanoid__36.WalkSpeed = 0;
				l__Humanoid__36.JumpPower = 0;
				l__vars__38.isCutscene.Value = true;
				l__BaseUI__40.loading.Visible = true;
				l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Volume = 0
				}):Play();
				l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Quint), {
					Transparency = 0
				}):Play();
				local v458 = Instance.new("BindableEvent");
				local u66 = {};
				local u67 = false;
				v458.Event:Connect(function()
					v458:Destroy();
					for v459, v460 in pairs(u35.Rigs:GetDescendants()) do
						if v460:IsA("Animation") then
							u66[#u66 + 1] = v460;
						end;
					end;
					for v461 = 1, #u66 do
						if isSkipped() then
							break;
						end;
						print("loading animations: " .. v461 .. "/" .. #u66);
						l__ContentProvider__18:PreloadAsync({ u66[v461] });
					end;
					u67 = true;
				end);
				v458:Fire();
				while not u67 do
					if isSkipped() then
						stopCutscene(true);
						return;
					end;
					task.wait(0.03333333333333333);				
				end;
				warn("scene loaded.");
				l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
					Transparency = 1
				}):Play();
				local v462 = nil;
				local v463 = nil;
				local v464 = {};
				local v465 = {};
				local v466 = {};
				local v467 = nil;
				for v468, v469 in pairs(u35.Rigs:GetChildren()) do
					local v470 = v469:Clone();
					if v470.Name == "CameraRig" then
						v30(l__LocalPlayer__5.Name, workspace.Ignored, v470, true);
						task.delay(0.03333333333333333, function()
							for v471, v472 in pairs(v470:GetDescendants()) do
								pcall(function()
									if v472.Parent.Parent:IsA("Accoutrement") and (v472.Name == "FaceFrontAttachment" or v472.Name == "HatAttachment" or v472.Name == "NeckAttachment" or v472.Name == "HairAttachment" or v472.Name == "FaceCenterAttachment") then
										v472.Parent.Parent:Destroy();
									end;
								end);
							end;
						end);
						v467 = v470;
						v462 = v470.Head;
						v463 = v470.Humanoid.Animator:LoadAnimation(v470.Animation);
						v464[#v464 + 1] = v463;
					end;
					v466[#v466 + 1] = v470;
					u36[#u36 + 1] = v470;
				end;
				if isSkipped() then
					stopCutscene(true);
					return;
				else
					task.wait(1);
					if isSkipped() then
						stopCutscene(true);
						return;
					else
						l__BaseUI__40.loading.Visible = false;
						u37[#u37 + 1] = u35.Sounds.ambience;
						u35.Sounds.ambience:Play();
						for v473, v474 in pairs(v464) do
							v474:Play();
						end;
						local v475 = RaycastParams.new();
						v475.FilterDescendantsInstances = { workspace.Buildings };
						v475.FilterType = Enum.RaycastFilterType.Whitelist;
						v475.CollisionGroup = "Raycast";
						table.insert(u34, v463:GetMarkerReachedSignal("step"):Connect(function()
							local v476 = workspace:Raycast(l__CurrentCamera__5.CFrame.Position, Vector3.new(0, -100, 0), v475);
							if v476 then
								local v477 = l__Assets__26.Events.Footsteps:Invoke(v476.Instance.Material);
								if v477 then
									local v478 = v477:Clone();
									v478.RollOffMinDistance = 0.75;
									v478.RollOffMaxDistance = 5;
									v478.Volume = 0.3;
									v478.PlaybackSpeed = v478.PlaybackSpeed + math.random() * 0.4;
									v478.Parent = v467.LowerTorso;
									v478:Play();
									l__Debris__14:AddItem(v478, 3);
								end;
							end;
						end));
						local u68 = false;
						l__RunService__8:BindToRenderStep("CUTSCENE_RENDER", 1001, function()
							if isSkipped() then
								stopCutscene(true);
								return;
							end;
							l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
							l__CurrentCamera__5.CFrame = v462.CFrame;
							l__CurrentCamera__5.FieldOfView = 90;
							if v463.IsPlaying and v463.Length > 0 and v463.Length - 0.25 <= v463.TimePosition and not u68 then
								u68 = true;
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.1, Enum.EasingStyle.Quint), {
									Transparency = 0
								}):Play();
								task.wait(0.25);
								l__TweenService__13:Create(u35.Sounds.ambience, TweenInfo.new(1, Enum.EasingStyle.Quint), {
									Volume = 0
								}):Play();
								local l__Volume__69 = u35.Sounds.ambience.Volume;
								task.delay(1, function()
									u35.Sounds.ambience:Stop();
									u35.Sounds.ambience.Volume = l__Volume__69;
								end);
								local v479 = Instance.new("StringValue");
								v479.Name = "used";
								v479.Parent = u35;
								l__TweenService__13:Create(l__SoundService__15.Main, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
									Volume = 5
								}):Play();
								v467:Destroy();
								l__RunService__8:UnbindFromRenderStep("CUTSCENE_RENDER");
								l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
								l__CurrentCamera__5.CameraSubject = l__Humanoid__36;
								l__vars__38.isCutscene.Value = false;
								task.wait(0.25);
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
								tobeContinued();
								return;
							end;
							if not u68 then
								l__TweenService__13:Create(l__BaseUI__40.black, TweenInfo.new(1, Enum.EasingStyle.Sine), {
									Transparency = 1
								}):Play();
							end;
						end);
						v292 = l__Humanoid__36;
						v294 = true;
						v293 = "AutoRotate";
						v295 = v292;
						v296 = v293;
						v297 = v294;
						v295[v296] = v297;
						return;
					end;
				end;
			else
				v292 = l__Humanoid__36;
				v294 = true;
				v293 = "AutoRotate";
				v295 = v292;
				v296 = v293;
				v297 = v294;
				v295[v296] = v297;
				return;
			end;
		end;
	end;
	stopCutscene(nil, true);
	l__BaseUI__40.skip.Visible = false;
end);
if not v289 then
	warn("error: " .. v290);
	stopCutscene();
end;
l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
l__Humanoid__36.RootPart.Anchored = false;
l__BaseUI__40.wa.Visible = false;
l__BaseUI__40.loading.Visible = false;
l__TweenService__13:Create(l__UI__39.gameIntro, TweenInfo.new(1, Enum.EasingStyle.Sine), {
	Transparency = 1
}):Play();
if l__GameSettings__41.currentLevel.Value == 1 then
	l__BaseUI__40.output.Visible = true;
	local v480 = { "You: Wait what? this is not the exit? where am I?" };
	l__BaseUI__40.output.Text = v480[math.random(#v480)];
	task.spawn(closeSub);
end;
local v481 = l__GamepadEnabled__42 and l__UI__39.h2pgpad or l__UI__39.h2p;
local v482 = {};
local v483 = {};
for v484, v485 in pairs(v481.Frame:GetDescendants()) do
	if v485:IsA("TextLabel") then
		v482[#v482 + 1] = {
			instance = v485, 
			transparency = v485.TextTransparency
		};
		v485.TextTransparency = 1;
	elseif v485:IsA("ImageLabel") then
		v483[#v483 + 1] = {
			instance = v485, 
			transparency = v485.ImageTransparency
		};
		v485.ImageTransparency = 1;
	end;
end;
function showH2P()
	if v481.Visible then
		return;
	end;
	v481.Transparency = 1;
	local v486, v487, v488 = pairs(v481:GetChildren());
	while true do
		local v489, v490 = v486(v487, v488);
		if v489 then

		else
			break;
		end;
		v488 = v489;
		if v490:IsA("StringValue") then
			v490:Destroy();
		else
			v490.Visible = true;
		end;	
	end;
	v481.Frame.Transparency = 1;
	v481.Frame.ok.TextTransparency = 1;
	v481.Frame.ok.TextStrokeTransparency = 1;
	if l__GamepadEnabled__42 then
		v481.Frame.ok.Text = "CLOSE (PRESS L3 TO OPEN)";
	end;
	v481.Frame.UIStroke.Transparency = 1;
	v481.Visible = true;
	local function v491(p37)
		local v492 = {};
		if p37 then
			local v493 = 0.8;
		else
			v493 = 1;
		end;
		v492.Transparency = v493;
		l__TweenService__13:Create(v481.Frame.UIStroke, TweenInfo.new(1, Enum.EasingStyle.Sine), v492):Play();
		local v494 = {};
		if p37 then
			local v495 = 0.35;
		else
			v495 = 1;
		end;
		v494.Transparency = v495;
		l__TweenService__13:Create(v481, TweenInfo.new(1, Enum.EasingStyle.Sine), v494):Play();
		local v496 = {};
		if p37 then
			local v497 = 0;
		else
			v497 = 1;
		end;
		v496.Transparency = v497;
		l__TweenService__13:Create(v481.Frame, TweenInfo.new(1, Enum.EasingStyle.Sine), v496):Play();
		local v498 = {};
		if p37 then
			local v499 = 0;
		else
			v499 = 1;
		end;
		v498.TextTransparency = v499;
		if p37 then
			local v500 = 0.8;
		else
			v500 = 1;
		end;
		v498.TextStrokeTransparency = v500;
		l__TweenService__13:Create(v481.Frame.ok, TweenInfo.new(1, Enum.EasingStyle.Sine), v498):Play();
		local v501, v502, v503 = pairs(v482);
		while true do
			local v504, v505 = v501(v502, v503);
			if v504 then

			else
				break;
			end;
			v503 = v504;
			l__TweenService__13:Create(v505.instance, TweenInfo.new(0.8, Enum.EasingStyle.Sine), {
				TextTransparency = p37 and v505.transparency or 1
			}):Play();		
		end;
		local v506, v507, v508 = pairs(v483);
		while true do
			local v509, v510 = v506(v507, v508);
			if v509 then

			else
				break;
			end;
			v508 = v509;
			l__TweenService__13:Create(v510.instance, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				ImageTransparency = p37 and v510.transparency or 1
			}):Play();		
		end;
		if not p37 then
			local v511 = Instance.new("StringValue");
			v511.Name = "done";
			v511.Parent = v481;
			task.delay(1, function()
				v481.Visible = false;
			end);
		end;
	end;
	playsound(l__Assets__26.Sounds.woosh2, l__PlayerGui__7);
	v491(true);
	local u70 = nil;
	u70 = v481.Frame.ok.MouseButton1Click:Connect(function()
		u70:Disconnect();
		playsound(l__Assets__26.Sounds.click, l__PlayerGui__7);
		v491(false);
	end);
end;
task.spawn(function()
	if not l__TouchEnabled__4 and l__GameSettings__41.currentLevel.Value < 1 then
		while l__vars__38.isCutscene.Value == true do
			task.wait(0.03333333333333333);		
		end;
		task.wait(2.5);
		if l__ReplicatedStorage__10.Users.h2p.Value == false then
			l__ReplicatedStorage__10.Users.h2p.Value = true;
			showH2P();
			return;
		end;
	elseif l__GameSettings__41.currentLevel.Value >= 1 then
		l__ReplicatedStorage__10.Users.h2p.Value = true;
	end;
end);
local u71 = v95;
local u72 = v92;
local u73 = v85;
task.spawn(function()
	while l__vars__38.isCutscene.Value == true do
		l__Humanoid__36.RootPart.Anchored = true;
		task.wait(0.03333333333333333);	
	end;
	u71 = tick();
	u72 = tick();
	u73 = tick();
	l__vars__38.isInteract.Value = false;
	l__vars__38.isCutscene.Value = false;
	v29:FireServer("ready");
	local v512, v513 = pcall(function()
		local v514 = workspace.Ignored.ReplicateFocus:FindFirstChild(l__LocalPlayer__5.Name);
		if v514 then
			v29:FireServer("stream", CFrame.new(l__Humanoid__36:GetAttribute("RootPosition")));
			v514.CFrame = CFrame.new(l__Humanoid__36:GetAttribute("RootPosition"));
		end;
	end);
	if v512 then
		l__Humanoid__36.RootPart.Anchored = false;
		return;
	end;
	warn("error: ", v513);
	l__Humanoid__36.Health = 0;
end);
function hideUI()
	local v515, v516 = pcall(function()
		l__StarterGui__16:SetCoreGuiEnabled(Enum.CoreGuiType.Backpack, false);
		l__StarterGui__16:SetCoreGuiEnabled(Enum.CoreGuiType.Health, false);
	end);
	if not v515 then

	else
		return;
	end;
	task.wait(0.03333333333333333);
	return hideUI();
end;
task.spawn(hideUI);
local u74 = {};
function hideImage()
	local v517, v518, v519 = pairs(u74);
	while true do
		local v520, v521 = v517(v518, v519);
		if v520 then

		else
			break;
		end;
		v519 = v520;
		v521:Disconnect();	
	end;
	local l__JumpButton__522 = l__PlayerGui__7:FindFirstChild("JumpButton", true);
	if l__JumpButton__522 then
		l__JumpButton__522.Visible = true;
	end;
	l__UI__39.image.active.Value = false;
	l__UI__39.image.mouse.Value = false;
	l__TweenService__13:Create(l__UI__39.image, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		Transparency = 1
	}):Play();
	l__TweenService__13:Create(l__UI__39.image.ImageLabel, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		ImageTransparency = 1
	}):Play();
	l__TweenService__13:Create(l__UI__39.image.ImageLabel.text, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		TextTransparency = 1
	}):Play();
	l__TweenService__13:Create(l__UI__39.image.ImageLabel.L, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		TextTransparency = 1, 
		TextStrokeTransparency = 1
	}):Play();
	l__TweenService__13:Create(l__UI__39.image.ImageLabel.R, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		TextTransparency = 1, 
		TextStrokeTransparency = 1
	}):Play();
end;
local v523 = Instance.new("ColorCorrectionEffect");
v523.Parent = l__CurrentCamera__5;
local v524 = Instance.new("BlurEffect");
v524.Size = 0;
v524.Parent = l__CurrentCamera__5;
l__GuiService__17.MenuOpened:Connect(function()
	l__TweenService__13:Create(v523, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		Saturation = -1
	}):Play();
	l__TweenService__13:Create(v524, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		Size = 30
	}):Play();
end);
l__GuiService__17.MenuClosed:Connect(function()
	l__TweenService__13:Create(v523, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		Saturation = 0
	}):Play();
	l__TweenService__13:Create(v524, TweenInfo.new(1, Enum.EasingStyle.Sine), {
		Size = 0
	}):Play();
end);
local v525 = {};
local u75 = false;
local u76 = 0;
local u77 = false;
local u78 = 0;
function v525.sprint(p38)
	u75 = p38;
	if p38 then
		if not l__Humanoid__36.RootPart or not (l__StarterPlayer__11.CharacterWalkSpeed / 2 < l__Humanoid__36.RootPart.Velocity.magnitude) then
			return;
		end;
	else
		u77 = false;
		u78 = 0;
		return;
	end;
	u76 = tick();
	u77 = true;
end;
local u79 = false;
local u80 = false;
function v525.camera(p39)
	if not u79 then
		u80 = not u80;
		v29:FireServer("baseItem", "camera", u80);
		local v526 = v32:GetButton("zoom");
		if v526 then
			v526.Visible = u80;
		end;
		if not u80 then
			v83.camIdle:Stop();
			v83.camUnequip:Play();
			return;
		end;
	else
		return;
	end;
	v83.camIdle:Play();
	v83.camEquip:Play();
end;
local u81 = 0;
local u82 = false;
function v525.flashlight(p40)
	if tick() - u81 >= 0.5 and v110:IsDescendantOf(workspace) then
		u81 = tick();
		u82 = not u82;
		v110.isOn.Value = u82;
		if u82 then
			v83.flIdle:Play();
			v83.flEquip:Play();
			playsound(l__Assets__26.Sounds.flashlight1, v110);
			local v527 = {};
			if u7.advFlashlight then
				local v528 = 2;
			else
				v528 = 1;
			end;
			v527.Brightness = v528;
			l__TweenService__13:Create(v110.Attachment.Light, TweenInfo.new(0.05, Enum.EasingStyle.Sine), v527):Play();
		else
			v83.flIdle:Stop();
			v83.flUnequip:Play();
			playsound(l__Assets__26.Sounds.flashlight0, v110);
			l__TweenService__13:Create(v110.Attachment.Light, TweenInfo.new(0.05, Enum.EasingStyle.Sine), {
				Brightness = 0
			}):Play();
		end;
		v110.SpotLight.Enabled = u82;
		v29:FireServer("baseItem", "flashlight", u82);
	end;
end;
local u83 = false;
function v525.crouch(p41)
	if p41 then
		if not u3 and l__vars__38.isInteract.Value == false and l__vars__38.water.Value > 999 and not l__Character__35.Welds:FindFirstChild("lockerWeld") then
			u83 = true;
			playsound(l__Assets__26.Sounds.crouch0, l__Humanoid__36.RootPart);
			return;
		end;
	elseif l__vars__38.isInteract.Value == false and u83 then
		u83 = false;
		playsound(l__Assets__26.Sounds.crouch1, l__Humanoid__36.RootPart);
	end;
end;
local u84 = false;
local u85 = false;
local u86 = 0;
local u87 = 0;
function v525.peekL(p42)
	if p42 then
		if l__vars__38.isInteract.Value ~= false then
			return;
		end;
	else
		u85 = false;
		u86 = 0;
		u87 = 0;
		v83.leanLeft:Stop(0.5);
		v83.leanRight:Stop(0.5);
		return;
	end;
	u84 = false;
	u85 = true;
	u86 = 15;
	u87 = -1.5;
	v83.leanRight:Stop();
	v83.leanLeft:Play(0.5);
end;
function v525.peekR(p43)
	if p43 then
		if l__vars__38.isInteract.Value ~= false then
			return;
		end;
	else
		u84 = false;
		u86 = 0;
		u87 = 0;
		v83.leanLeft:Stop(0.5);
		v83.leanRight:Stop(0.5);
		return;
	end;
	u85 = false;
	u84 = true;
	u86 = -15;
	u87 = 1.5;
	v83.leanLeft:Stop();
	v83.leanRight:Play(0.5);
end;
function v525.whistle(p44)
	if l__vars__38.isCutscene.Value == false then
		v29:FireServer("whistle");
	end;
end;
local u88 = 0;
local u89 = false;
local u90 = {};
function v525.nv()
	if tick() - u88 >= 2 and u7.advCam and u80 and u79 then
		u88 = tick();
		u89 = not u89;
		if u89 then
			playsound(l__Assets__26.Sounds.nv, l__PlayerGui__7);
			local v529 = l__Assets__26.Miscs.nightVision.ColorCorrection:Clone();
			v529.Parent = l__CurrentCamera__5;
			local v530 = l__Assets__26.Miscs.nightVision.Blur:Clone();
			v530.Parent = l__CurrentCamera__5;
			local v531 = l__Assets__26.Miscs.nightVision.CameraLight:Clone();
			v531.Parent = l__CurrentCamera__5;
			u90.color = v529;
			u90.blur = v530;
			u90.light = v531;
			u90.ambient = l__Lighting__12.Ambient;
			u90.exposure = l__Lighting__12.ExposureCompensation;
			u90.fog = {
				start = l__Lighting__12.FogStart, 
				["end"] = l__Lighting__12.FogEnd, 
				color = l__Lighting__12.FogColor
			};
			u90.instances = {};
			for v532, v533 in pairs(l__Lighting__12:GetChildren()) do
				u90.instances[#u90.instances + 1] = v533;
				v533.Parent = nil;
			end;
			local u91 = nil;
			u91 = l__RunService__8.RenderStepped:Connect(function()
				if v531:IsDescendantOf(workspace) then
					v531.CFrame = l__CurrentCamera__5.CFrame;
					return;
				end;
				u91:Disconnect();
			end);
			v529.Brightness = 0;
			v529.Contrast = 0;
			v529.Saturation = 0;
			v529.TintColor = Color3.fromRGB(0, 0, 0);
			v530.Size = 0;
			v531.LightAttachment.SurfaceLight.Brightness = 0;
			v529.Enabled = true;
			v530.Enabled = true;
			l__TweenService__13:Create(v529, TweenInfo.new(2, Enum.EasingStyle.Sine), {
				Brightness = v529.Brightness, 
				Contrast = v529.Contrast, 
				Saturation = v529.Saturation, 
				TintColor = v529.TintColor
			}):Play();
			l__TweenService__13:Create(v530, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
				Size = v530.Size
			}):Play();
			l__TweenService__13:Create(v531.LightAttachment.SurfaceLight, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Brightness = v531.LightAttachment.SurfaceLight.Brightness
			}):Play();
			l__TweenService__13:Create(l__Lighting__12, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
				Ambient = Color3.fromRGB(255, 255, 255), 
				FogStart = 10, 
				FogEnd = 300, 
				FogColor = Color3.fromRGB(255, 255, 255)
			}):Play();
			return;
		else
			playsound(l__Assets__26.Sounds.nv.nv1, l__PlayerGui__7);
			u90.color:Destroy();
			u90.blur:Destroy();
			u90.light:Destroy();
			local v534 = Instance.new("ColorCorrectionEffect");
			v534.Brightness = -1;
			v534.Parent = l__CurrentCamera__5;
			l__TweenService__13:Create(v534, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Brightness = 0
			}):Play();
			l__Debris__14:AddItem(v534, 1);
			l__TweenService__13:Create(l__Lighting__12, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
				Ambient = u90.ambient, 
				ExposureCompensation = u90.exposure, 
				FogStart = u90.fog.start, 
				FogEnd = u90.fog["end"], 
				FogColor = u90.fog.color
			}):Play();
			for v535, v536 in pairs(u90.instances) do
				u90.instances[v535] = nil;
				v536.Parent = l__Lighting__12;
			end;
		end;
	end;
end;
local u92 = 0;
local u93 = false;
local u94 = 0;
function v525.cameraZoom(p45)
	local v537 = p45 > 0;
	if v537 then
		u92 = math.min(u92 + 5, u8);
	else
		u92 = math.max(u92 - 5, 0);
	end;
	if not u93 and u92 > 0 and u92 < u8 then
		u93 = true;
		l__Assets__26.Sounds.zoom:Play();
		local v538 = nil;
		if v537 then
			v538 = Instance.new("BlurEffect");
			v538.Parent = l__CurrentCamera__5;
			v538.Size = 0;
			l__TweenService__13:Create(v538, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Size = 30
			}):Play();
		end;
		while tick() - u94 < 0.2 and u92 > 0 and u92 < u8 do
			task.wait();		
		end;
		if v537 then
			l__TweenService__13:Create(v538, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Size = 0
			}):Play();
			l__Debris__14:AddItem(v538, 1);
		end;
		l__Assets__26.Sounds.zoom:Stop();
		u93 = false;
	end;
end;
local u95 = false;
local u96 = v115;
function cameraOff()
	u79 = false;
	if u89 then
		u89 = false;
		playsound(l__Assets__26.Sounds.nv.nv1, l__PlayerGui__7);
		u90.color:Destroy();
		u90.blur:Destroy();
		u90.light:Destroy();
		local v539 = Instance.new("ColorCorrectionEffect");
		v539.Brightness = -1;
		v539.Parent = l__CurrentCamera__5;
		l__TweenService__13:Create(v539, TweenInfo.new(1, Enum.EasingStyle.Sine), {
			Brightness = 0
		}):Play();
		l__Debris__14:AddItem(v539, 1);
		l__TweenService__13:Create(l__Lighting__12, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
			Ambient = u90.ambient, 
			ExposureCompensation = u90.exposure, 
			FogStart = u90.fog.start, 
			FogEnd = u90.fog["end"], 
			FogColor = u90.fog.color
		}):Play();
		local v540, v541, v542 = pairs(u90.instances);
		while true do
			local v543, v544 = v540(v541, v542);
			if v543 then

			else
				break;
			end;
			v542 = v543;
			u90.instances[v543] = nil;
			v544.Parent = l__Lighting__12;		
		end;
	end;
	v83.camZoomIdle:Stop(0.15);
	u95 = false;
	l__Assets__26.Sounds.vhs_noise:Stop();
	u96 = CFrame.new(0, 0, 0);
	local v545 = Instance.new("ColorCorrectionEffect");
	v545.Parent = l__CurrentCamera__5;
	v545.Brightness = -1.5;
	l__Debris__14:AddItem(v545, 0.5);
	l__TweenService__13:Create(v545, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		Brightness = 0
	}):Play();
	l__UI__39.noise.Visible = u79;
	l__UI__39.noise2.Visible = u79;
	l__UI__39.camera.Visible = u79;
end;
local u97 = 0;
local u98 = {
	speedLerp = 0.05, 
	fovLerp = 0.05
};
function v525.zoom()
	if tick() - u97 >= 1 and u80 and l__Humanoid__36.Health > 0 then
		u97 = tick();
		u79 = not u79;
		l__UI__39.isCamera.Value = u79;
		local v546 = v32:GetButton("zoomin");
		local v547 = v32:GetButton("zoomout");
		local v548 = v32:GetButton("nv");
		if v546 and v547 and v548 then
			v546.Visible = u79;
			v547.Visible = u79;
			v548.Visible = u79;
		end;
		if u79 then
			v83.camZoomIdle:Play(0.15);
			u98.fovLerp = 1;
			task.wait(0.25);
			u95 = true;
			playsound(l__Assets__26.Sounds.camera0, l__LocalPlayer__5.PlayerGui);
			l__Assets__26.Sounds.vhs_noise:Play();
			u96 = CFrame.new(5, -5, 0);
			local v549 = Instance.new("ColorCorrectionEffect");
			v549.Parent = l__CurrentCamera__5;
			v549.Brightness = 1.5;
			l__Debris__14:AddItem(v549, 0.85);
			l__TweenService__13:Create(v549, TweenInfo.new(0.85, Enum.EasingStyle.Quint), {
				Brightness = 0
			}):Play();
			task.wait(0.03333333333333333);
			u98.fovLerp = 0.05;
		else
			cameraOff();
		end;
		if not u7.advCam then
			for v550, v551 in pairs(v120) do
				v551.Enabled = u79;
			end;
		end;
		l__UI__39.noise.Visible = u79;
		l__UI__39.noise2.Visible = u79;
		l__UI__39.camera.Visible = u79;
	end;
end;
local v552 = {};
local u99 = nil;
local u100 = v87;
local u101 = nil;
local u102 = nil;
local u103 = {};
function v525.interact()
	if not u99 or l__vars__38.isInteract.Value ~= false then
		hideImage();
		l__UI__39.input.Visible = false;
		return;
	end;
	u100 = tick();
	l__vars__38.isInteract.Value = true;
	local v553 = u101 and u101.PrimaryPart.id or u99.id;
	if v553.Value ~= "7" and v553.Value ~= "10" then
		hideImage();
	elseif v553.Value ~= "8" then
		l__UI__39.input.Visible = false;
	end;
	if v553.Value == "1" then
		l__CurrentCamera__5.CameraType = Enum.CameraType.Scriptable;
		local l__CFrame__554 = l__CurrentCamera__5.CFrame;
		local v555 = tick();
		local v556 = {};
		local v557 = u99:FindFirstChild("ang") and u99.ang.Value or 0;
		local v558 = u99:FindFirstChild("last") and u99.last.Value or u99.CFrame;
		local function v559()
			for v560, v561 in pairs(u99:GetChildren()) do
				if v561:IsA("Sound") then
					v561:Destroy();
				end;
			end;
		end;
		if l__TouchEnabled__4 then
			l__UI__39.mobileLR.Visible = true;
			local u104 = false;
			local u105 = v557;
			table.insert(v556, l__UI__39.mobileLR.L.MouseButton1Down:Connect(function()
				v559();
				playsound(l__Assets__26.Sounds.valve, u99, nil, nil, true);
				u104 = true;
				while u104 do
					u105 = math.max(u105 - 150 * l__RunService__8.Heartbeat:Wait(), 0);
					task.wait();				
				end;
			end));
			local u106 = false;
			table.insert(v556, l__UI__39.mobileLR.R.MouseButton1Down:Connect(function()
				v559();
				playsound(l__Assets__26.Sounds.valve, u99, nil, nil, true);
				u106 = true;
				while u106 do
					u105 = u105 + 150 * l__RunService__8.Heartbeat:Wait();
					task.wait();				
				end;
			end));
			table.insert(v556, l__UserInputService__9.TouchEnded:Connect(function()
				u104 = false;
				u106 = false;
			end));
			local u107 = false;
			table.insert(v556, l__UI__39.mobileLR.C.MouseButton1Click:Connect(function()
				u107 = true;
			end));
		else
			l__BaseUI__40.output.Visible = true;
			if l__GamepadEnabled__42 then
				local v562 = "PRESS DPAD-LEFT OR DPAD-RIGHT TO ROTATE | BUTTON X TO CANCEL";
			else
				v562 = "PRESS A OR D TO ROTATE";
			end;
			l__BaseUI__40.output.Text = v562;
			task.spawn(closeSub);
		end;
		local u108 = v557;
		table.insert(v556, l__UserInputService__9.InputBegan:Connect(function(p46, p47)
			if not p47 then
				v559();
				if p46.KeyCode == Enum.KeyCode.A or p46.KeyCode == Enum.KeyCode.DPadLeft then
					playsound(l__Assets__26.Sounds.valve, u99, nil, nil, true);
					while true do
						if not l__UserInputService__9:IsKeyDown(Enum.KeyCode.A) then
							if not u102 then
								break;
							end;
							if not l__UserInputService__9:IsGamepadButtonDown(u102, Enum.KeyCode.DPadLeft) then
								break;
							end;
						end;
						u108 = math.max(u108 - 150 * l__RunService__8.Heartbeat:Wait(), 0);
						task.wait();					
					end;
				elseif p46.KeyCode == Enum.KeyCode.D or p46.KeyCode == Enum.KeyCode.DPadRight then
					playsound(l__Assets__26.Sounds.valve, u99, nil, nil, true);
					while true do
						if not l__UserInputService__9:IsKeyDown(Enum.KeyCode.D) then
							if not u102 then
								break;
							end;
							if not l__UserInputService__9:IsGamepadButtonDown(u102, Enum.KeyCode.DPadRight) then
								break;
							end;
						end;
						u108 = u108 + 150 * l__RunService__8.Heartbeat:Wait();
						task.wait();					
					end;
				end;
			end;
		end));
		local v563 = tick();
		while u99:IsDescendantOf(workspace) and l__Humanoid__36.Health > 0 do
			if not l__UserInputService__9:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
				if (not (not u102) and not (not l__UserInputService__9:IsGamepadButtonDown(u102, Enum.KeyCode.ButtonX)) and not l__TouchEnabled__4 or false) and tick() - v555 >= 0.25 then
					break;
				end;
			elseif (not l__TouchEnabled__4 or false) and tick() - v555 >= 0.25 then
				break;
			end;
			if u108 >= 360 then
				if not u99:FindFirstChild("success") then
					v29:FireServer("interacts", v553, u99);
				end;
				local v564 = u99:FindFirstChild("success") or Instance.new("StringValue");
				v564.Name = "success";
				v564.Parent = u99;
				if tick() - v563 >= 0.35 then
					break;
				end;
			else
				v563 = tick();
			end;
			u99.CFrame = v558 * CFrame.Angles(math.rad(math.min(u108, 360)), 0, 0);
			l__TweenService__13:Create(l__CurrentCamera__5, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				CFrame = CFrame.new(u99.offset.WorldPosition, u99.Position)
			}):Play();
			task.wait();		
		end;
		for v565, v566 in pairs(v556) do
			v566:Disconnect();
		end;
		local v567 = u99:FindFirstChild("last") or Instance.new("CFrameValue");
		v567.Value = v558;
		v567.Name = "last";
		v567.Parent = u99;
		local v568 = u99:FindFirstChild("ang") or Instance.new("NumberValue");
		v568.Value = u108;
		v568.Name = "ang";
		v568.Parent = u99;
		local v569 = nil;
		while getDistance(l__CurrentCamera__5.CFrame.Position, l__CFrame__554.Position) > 0.5 and l__Humanoid__36.Health > 0 do
			v569 = l__TweenService__13:Create(l__CurrentCamera__5, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				CFrame = l__CFrame__554
			});
			v569:Play();
			task.wait();		
		end;
		v569:Cancel();
		l__CurrentCamera__5.CameraType = Enum.CameraType.Custom;
	elseif v553.Value == "2" then
		if u101.button.originPos.Value.magnitude < 1 then
			u101.button.originPos.Value = u101.button.Position;
		end;
		playsound(l__Assets__26.Sounds.button_press, u99);
		u101.button.Position = u101.PrimaryPart.Position;
		l__TweenService__13:Create(u101.button, TweenInfo.new(0.15, Enum.EasingStyle.Bounce), {
			Position = u101.button.originPos.Value
		}):Play();
		v29:FireServer("interacts", v553, u99, u101);
	elseif v553.Value == "3" or v553.Value == "4" or v553.Value == "5" or v553.Value == "6" then
		v29:FireServer("interacts", v553, u99, u101);
	elseif v553.Value == "7" then
		if l__UI__39.image.active.Value == false then
			l__UI__39.image.ImageLabel.text.Text = "";
			l__UI__39.image.ImageLabel.Image = u99.Decal.Texture;
			l__UI__39.image.Transparency = 1;
			l__UI__39.image.ImageLabel.ImageTransparency = 1;
			l__UI__39.image.ImageLabel.L.TextTransparency = 1;
			l__UI__39.image.ImageLabel.R.TextTransparency = 1;
			l__UI__39.image.ImageLabel.L.TextStrokeTransparency = 1;
			l__UI__39.image.ImageLabel.R.TextStrokeTransparency = 1;
			l__UI__39.image.Visible = true;
			l__UI__39.image.active.Value = true;
			l__TweenService__13:Create(l__UI__39.image, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Transparency = 0.5
			}):Play();
			l__TweenService__13:Create(l__UI__39.image.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				ImageTransparency = 0
			}):Play();
			playsound(l__Assets__26.Sounds.paper, l__PlayerGui__7, nil, nil, true);
			if not u103[u99] then
				u103[u99] = 0;
			end;
			local l__highlight__570 = u99:FindFirstChild("highlight");
			if l__highlight__570 then
				l__highlight__570:Destroy();
			end;
			if u103[u99] <= 3 then
				if u99.Name == "paper1" and u103[u99] < 1 then
					playsound(l__Assets__26.Sounds.Voices.valves, l__Character__35.Head);
				end;
				l__BaseUI__40.output.Visible = true;
				l__BaseUI__40.output.Text = u99.text.Value;
				task.spawn(closeSub);
			end;
			u103[u99] = u103[u99] + 1;
		else
			hideImage();
		end;
	elseif v553.Value == "8" then
		l__UI__39.input.Visible = not l__UI__39.input.Visible;
	elseif v553.Value == "10" then
		local l__JumpButton__571 = l__PlayerGui__7:FindFirstChild("JumpButton", true);
		if l__JumpButton__571 then
			l__JumpButton__571.Visible = false;
		end;
		for v572, v573 in pairs(u74) do
			v573:Disconnect();
		end;
		local u109 = 1;
		local u110 = {
			ent = { "rbxassetid://9654060465", "rbxassetid://9654060648", "rbxassetid://9654060950" }, 
			res = { "rbxassetid://9654267831", "rbxassetid://9654061537" }, 
			lv = { "rbxassetid://9654061237", "rbxassetid://9654061846" }
		};
		local l__Value__111 = u99.type.Value;
		u109 = math.clamp(u109 + -1, 1, #u110[l__Value__111]);
		l__UI__39.image.ImageLabel.Image = u110[l__Value__111][u109];
		table.insert(u74, l__UI__39.image.ImageLabel.L.MouseButton1Click:Connect(function()
			u109 = math.clamp(u109 + -1, 1, #u110[l__Value__111]);
			if u109 ~= u109 then
				playsound(getRandomChildren(l__Assets__26.Sounds.PaperTurns), l__PlayerGui__7, nil, nil, true);
			end;
			l__UI__39.image.ImageLabel.Image = u110[l__Value__111][u109];
		end));
		local function u112(p48, p49)
			if p48 then
				local v574 = -1;
			else
				v574 = 1;
			end;
			u109 = math.clamp(u109 + v574, 1, #u110[l__Value__111]);
			if not p49 and u109 ~= u109 then
				playsound(getRandomChildren(l__Assets__26.Sounds.PaperTurns), l__PlayerGui__7, nil, nil, true);
			end;
			l__UI__39.image.ImageLabel.Image = u110[l__Value__111][u109];
		end;
		table.insert(u74, l__UI__39.image.ImageLabel.R.MouseButton1Click:Connect(function()
			u112();
		end));
		if l__UI__39.image.active.Value == false then
			l__UI__39.image.Transparency = 1;
			l__UI__39.image.ImageLabel.ImageTransparency = 1;
			l__UI__39.image.ImageLabel.L.TextTransparency = 1;
			l__UI__39.image.ImageLabel.R.TextTransparency = 1;
			l__UI__39.image.ImageLabel.L.TextStrokeTransparency = 1;
			l__UI__39.image.ImageLabel.R.TextStrokeTransparency = 1;
			l__UI__39.image.Visible = true;
			l__UI__39.image.active.Value = true;
			l__UI__39.image.mouse.Value = true;
			l__TweenService__13:Create(l__UI__39.image, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Transparency = 0.5
			}):Play();
			l__TweenService__13:Create(l__UI__39.image.ImageLabel, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				ImageTransparency = 0
			}):Play();
			l__TweenService__13:Create(l__UI__39.image.ImageLabel.text, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				TextTransparency = 0
			}):Play();
			l__TweenService__13:Create(l__UI__39.image.ImageLabel.L, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				TextTransparency = 0, 
				TextStrokeTransparency = 0.6
			}):Play();
			l__TweenService__13:Create(l__UI__39.image.ImageLabel.R, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				TextTransparency = 0, 
				TextStrokeTransparency = 0.6
			}):Play();
			playsound(l__Assets__26.Sounds.book_open, l__PlayerGui__7, nil, nil, true);
		else
			hideImage();
		end;
	end;
	l__vars__38.isInteract.Value = false;
	l__UI__39.mobileLR.Visible = false;
end;
local u113 = false;
local u114 = 0;
local u115 = 0;
function v525.sense()
	if u7.sixthsense and not u113 and tick() - u114 >= 1.5 and l__Humanoid__36.Health > 0 then
		u113 = true;
		local v575 = RaycastParams.new();
		v575.FilterDescendantsInstances = { workspace.Buildings, workspace.Terrain };
		v575.FilterType = Enum.RaycastFilterType.Whitelist;
		local v576 = workspace:Raycast(l__Humanoid__36.RootPart.Position, Vector3.new(0, -100, 0), v575);
		if v576 then
			playsound(l__Assets__26.Sounds.Sense.intro, l__PlayerGui__7);
			playsound(getRandomChildren(l__Assets__26.Sounds.Sense.whispers), l__PlayerGui__7);
			local v577 = Instance.new("ColorCorrectionEffect");
			v577.Saturation = -1;
			v577.Brightness = 0.4;
			v577.Parent = l__CurrentCamera__5;
			local v578 = l__Assets__26.Miscs.sense:Clone();
			v578.Position = v576.Position - Vector3.new(0, 2.5, 0);
			v578.Parent = workspace.Ignored.ClientsCache;
			local l__y__579 = v578.Size.y;
			v578.Size = Vector3.new(0, l__y__579, 0);
			l__TweenService__13:Create(v578, TweenInfo.new(3.5, Enum.EasingStyle.Sine), {
				Size = Vector3.new(200, l__y__579, 200)
			}):Play();
			l__TweenService__13:Create(v577, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Saturation = 0, 
				Brightness = 0
			}):Play();
			l__Debris__14:AddItem(v577, 3);
			l__Debris__14:AddItem(v578, 3);
			local v580 = OverlapParams.new();
			v580.FilterDescendantsInstances = { workspace.Entities, workspace.Characters };
			v580.FilterType = Enum.RaycastFilterType.Whitelist;
			local u116 = {};
			local u117 = false;
			local u118 = Instance.new("BindableEvent");
			local u119 = nil;
			u119 = l__RunService__8.RenderStepped:Connect(function(p50)
				p50 = p50 * 60;
				local v581, v582, v583 = pairs((workspace:GetPartBoundsInRadius(v578.Position, v578.Size.x, v580)));
				while true do
					local v584, v585 = v581(v582, v583);
					if not v584 then
						break;
					end;
					local v586 = not v585:IsDescendantOf(l__Character__35) and findHumanoid(v585);
					if v586 and not u116[v586] then
						u116[v586] = true;
						playsound(getRandomChildren(l__Assets__26.Sounds.Sense.detect), l__PlayerGui__7, nil, nil, true);
						local v587 = v578.senseHit:Clone();
						v587.WorldCFrame = v586.HumanoidRootPart.CFrame;
						v587.Parent = workspace.Terrain;
						local v588 = getDistance(v586.Humanoid.RootPart, l__Humanoid__36.RootPart);
						v587.ui.ImageLabel.ImageTransparency = math.min(v588 / 200, 0.85);
						v587.ui.ImageLabel.ImageColor3 = v586:IsDescendantOf(workspace.Characters) and Color3.fromRGB(0, 255, 0) or Color3.fromRGB(255, 0, 0);
						v587.ui.Size = UDim2.new(0, 0, 0, 0);
						l__TweenService__13:Create(v587.ui, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
							Size = UDim2.new(0, 150, 0, 150)
						}):Play();
						l__TweenService__13:Create(v587.ui.ImageLabel, TweenInfo.new(2.5, Enum.EasingStyle.Sine), {
							ImageTransparency = 1
						}):Play();
						l__Debris__14:AddItem(v587, 5);
						local v589 = Instance.new("Highlight");
						v589.FillColor = v587.ui.ImageLabel.ImageColor3;
						v589.FillTransparency = 1;
						v589.OutlineColor = v587.ui.ImageLabel.ImageColor3;
						v589.OutlineTransparency = 1;
						v589.Parent = v586;
						l__TweenService__13:Create(v589, TweenInfo.new(1.5, Enum.EasingStyle.Sine), {
							OutlineTransparency = math.clamp(v588 / 100, 0, 0.85)
						}):Play();
						l__Debris__14:AddItem(v589, 5);
						task.delay(3, function()
							l__TweenService__13:Create(v589, TweenInfo.new(2, Enum.EasingStyle.Sine), {
								OutlineTransparency = 1
							}):Play();
						end);
						break;
					end;				
				end;
				if not u117 then
					u115 = lerp(u115, -7, 0.25 * p50);
					if u115 < -6.5 then
						u117 = true;
					end;
				else
					u115 = lerp(u115, 0, 0.03 * p50);
				end;
				if not v578:IsDescendantOf(workspace) then
					u118:Fire();
					u119:Disconnect();
				end;
			end);
			u118.Event:Wait();
			u118:Destroy();
			u114 = tick();
			u113 = false;
			return;
		else
			u113 = false;
		end;
	end;
end;
l__UI__39.input.confirm.MouseButton1Click:Connect(function()
	playsound(l__Assets__26.Sounds.click, l__PlayerGui__7);
	v29:FireServer("input", l__UI__39.input.Text, u99, u101);
end);
function GetActiveGamepad()
	local v590 = nil;
	local v591 = {};
	local v592 = l__UserInputService__9:GetNavigationGamepads();
	if 1 < #v592 then
		local v593 = #v592;
		local v594 = 1 - 1;
		while true do
			if v590 == nil then
				v590 = v592[v594];
			elseif v592[v594].Value < v590.Value then
				v590 = v592[v594];
			end;
			if 0 <= 1 then
				if v594 < v593 then

				else
					break;
				end;
			elseif v593 < v594 then

			else
				break;
			end;
			v594 = v594 + 1;		
		end;
		return v590;
	end;
	local v595 = {};
	local v596 = l__UserInputService__9:GetConnectedGamepads();
	if 0 < #v596 then
		local v597 = #v596;
		local v598 = 1 - 1;
		while true do
			if v590 == nil then
				v590 = v596[v598];
			elseif v596[v598].Value < v590.Value then
				v590 = v596[v598];
			end;
			if 0 <= 1 then
				if v598 < v597 then

				else
					break;
				end;
			elseif v597 < v598 then

			else
				break;
			end;
			v598 = v598 + 1;		
		end;
	end;
	if v590 == nil then
		v590 = Enum.UserInputType.Gamepad1;
	end;
	return v590;
end;
if l__GamepadEnabled__42 then
	u102 = GetActiveGamepad();
end;
l__UserInputService__9.InputBegan:Connect(function(p51, p52)
	if (not p52 or p51.KeyCode == Enum.KeyCode.ButtonR3) and l__vars__38.isCutscene.Value == false then
		if p51.KeyCode == Enum.KeyCode.LeftShift or p51.KeyCode == Enum.KeyCode.ButtonA then
			v525.sprint(not u77);
			return;
		end;
		if p51.UserInputType == Enum.UserInputType.MouseButton1 or p51.KeyCode == Enum.KeyCode.ButtonX then
			v525.interact();
			return;
		end;
		if p51.UserInputType == Enum.UserInputType.Touch and l__UI__39.image.active.Value == true then
			hideImage();
			l__UI__39.input.Visible = false;
			return;
		end;
		if p51.UserInputType == Enum.UserInputType.MouseButton2 or p51.KeyCode == Enum.KeyCode.ButtonR3 then
			v525.zoom();
			return;
		end;
		if (p51.KeyCode == Enum.KeyCode.T or p51.KeyCode == Enum.KeyCode.ButtonL1) and u79 then
			v525.nv();
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.B or p51.KeyCode == Enum.KeyCode.ButtonL3 then
			showH2P();
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.F or p51.KeyCode == Enum.KeyCode.ButtonR1 then
			v525.flashlight(true);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.LeftControl or p51.KeyCode == Enum.KeyCode.ButtonR2 then
			v525.crouch(not u83);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.Q or p51.KeyCode == Enum.KeyCode.DPadLeft then
			v525.peekL(not u85);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.E or p51.KeyCode == Enum.KeyCode.DPadRight then
			v525.peekR(not u84);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.R or p51.KeyCode == Enum.KeyCode.ButtonL2 then
			v525.sense();
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.Z or p51.KeyCode == Enum.KeyCode.ButtonL1 then
			v525.camera(not u80);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.H or p51.KeyCode == Enum.KeyCode.ButtonY then
			v525.whistle(true);
			return;
		end;
		if p51.KeyCode == Enum.KeyCode.DPadUp and u79 then
			while l__UserInputService__9:IsGamepadButtonDown(u102, Enum.KeyCode.DPadUp) and u79 do
				u94 = tick();
				task.spawn(function()
					v525.cameraZoom(1);
				end);
				task.wait(0.06666666666666667);			
			end;
		elseif p51.KeyCode == Enum.KeyCode.DPadDown and u79 then
			while l__UserInputService__9:IsGamepadButtonDown(u102, Enum.KeyCode.DPadDown) and u79 do
				u94 = tick();
				task.spawn(function()
					v525.cameraZoom(-1);
				end);
				task.wait(0.06666666666666667);			
			end;
		end;
	end;
end);
l__UserInputService__9.InputEnded:Connect(function(p53, p54)
	if p53.KeyCode == Enum.KeyCode.LeftShift then
		v525.sprint(false);
		return;
	end;
	if p53.KeyCode == Enum.KeyCode.LeftControl then
		v525.crouch(false);
		return;
	end;
	if p53.KeyCode == Enum.KeyCode.Q then
		v525.peekL(false);
		return;
	end;
	if p53.KeyCode == Enum.KeyCode.E then
		v525.peekR(false);
	end;
end);
l__UserInputService__9.InputChanged:Connect(function(p55)
	if p55.UserInputType == Enum.UserInputType.MouseWheel and u79 and u80 then
		u94 = tick();
		v525.cameraZoom(p55.Position.z);
	end;
end);
l__Humanoid__36.StateChanged:Connect(function(p56, p57)
	if p57 == Enum.HumanoidStateType.Jumping then
		local v599 = l__Humanoid__36.RootPart and Vector3.new(l__Humanoid__36.RootPart.Velocity.x, 0, l__Humanoid__36.RootPart.Velocity.z).magnitude or 0;
		local v600 = Vector3.new(l__Humanoid__36.MoveDirection.x, 0, l__Humanoid__36.MoveDirection.z);
		if v599 and l__Humanoid__36.WalkSpeed / 2 <= v599 and v600.magnitude > 0 then
			local v601 = Instance.new("BodyVelocity");
			v601.MaxForce = Vector3.new(20000, 0, 20000);
			v601.Velocity = v600 * math.max(v599, 12) * 1.5;
			v601.Name = "jumpForce";
			v601.Parent = l__Humanoid__36.RootPart;
		end;
	elseif p57 == Enum.HumanoidStateType.Landed then
		local v602 = math.abs(l__Humanoid__36.RootPart.Velocity.Y);
		if v602 > 10 and l__vars__38.water.Value > 999 then
			playsound(getRandomChildren(l__Assets__26.Sounds.Landed), l__Humanoid__36.RootPart);
		end;
		v84:Impulse(math.min(v602 / 6, 5));
		local l__jumpForce__603 = l__Humanoid__36.RootPart:FindFirstChild("jumpForce");
		if l__jumpForce__603 then
			l__jumpForce__603:Destroy();
		end;
	elseif p57 == Enum.HumanoidStateType.Running or p57 == Enum.HumanoidStateType.Climbing or p57 == Enum.HumanoidStateType.Swimming then
		local l__jumpForce__604 = l__Humanoid__36.RootPart:FindFirstChild("jumpForce");
		if l__jumpForce__604 then
			l__jumpForce__604:Destroy();
		end;
	end;
	if p56 == Enum.HumanoidStateType.Swimming then
		local v605 = Instance.new("BodyVelocity");
		v605.MaxForce = Vector3.new(0, 40000, 0);
		v605.Velocity = Vector3.new(0, 10, 0);
		v605.Parent = l__Humanoid__36.RootPart;
		l__Debris__14:AddItem(v605, 0.25);
	end;
end);
function updateSpectators()
	local v606 = nil;
	if 0 < l__Humanoid__36.Health then
		v606 = l__LocalPlayer__5.data.spectators;
		if 0 < #v606:GetChildren() then

		else
			l__UI__39.spectators.Visible = false;
			return;
		end;
	else
		return;
	end;
	l__UI__39.spectators.Visible = true;
	l__UI__39.spectators.text.Text = #v606:GetChildren();
end;
updateSpectators();
l__LocalPlayer__5.data.spectators.ChildAdded:Connect(updateSpectators);
l__LocalPlayer__5.data.spectators.ChildRemoved:Connect(updateSpectators);
l__Humanoid__36.Died:Connect(onPlayerDied);
local u120 = 0;
local u121 = v91;
task.spawn(function()
	while l__Humanoid__36:IsDescendantOf(workspace) do
		u120 = (l__CurrentCamera__5.CFrame.lookVector - u121).magnitude;
		v139.Size = math.abs(u120) * 5;
		u121 = l__CurrentCamera__5.CFrame.LookVector;
		task.wait(0.03333333333333333);	
	end;
end);
local v607 = {};
for v608, v609 in pairs(workspace.Lights:GetChildren()) do
	if v609:IsA("Model") then
		v607[#v607 + 1] = v609;
	end;
end;
u13 = l__RunService__8.Heartbeat:Connect(function()
	checkRegionAmbience();
	if u7.advFlashlight then
		v110.Attachment.Light.Angle = 60;
	end;
	local v610 = l__CurrentCamera__5.CFrame.Position + l__CurrentCamera__5.CFrame.UpVector;
	local u122 = Region3.new(v610 - Vector3.new(0.1, 0.1, 0.1), v610 + Vector3.new(0.1, 0.1, 0.1)):ExpandToGrid(4);
	pcall(function()
		u3 = workspace.Terrain:ReadVoxels(u122, 4)[1][1][1] == Enum.Material.Water;
	end);
	local v611 = l__CurrentCamera__5.CFrame.Position - l__CurrentCamera__5.CFrame.LookVector;
	for v612, v613 in pairs((workspace:FindPartsInRegion3WithWhiteList(Region3.new(v611 - Vector3.new(1.5, 1.5, 1.5), v611 + Vector3.new(1.5, 1.5, 1.5)), { workspace.Buildings }))) do
		if v613.CanCollide == true then
			u85 = false;
			u84 = false;
			u87 = 0;
			u86 = 0;
			v83.leanLeft:Stop(0.5);
			v83.leanRight:Stop(0.5);
			break;
		end;
	end;
	v29:FireServer("cf", { l__CurrentCamera__5.CFrame });
end);
local u123 = 0;
local u124 = v114;
local u125 = v116;
local u126 = v119;
local u127 = v118;
local u128 = 0;
local u129 = 0;
local u130 = v88;
local u131 = v89;
local u132 = false;
local u133 = v94;
local u134 = v90;
local u135 = 0;
local u136 = {};
local u137 = 0;
local u138 = 0;
local u139 = v117;
local u140 = 0;
local u141 = { 1, 0, 0, 0, 1, 0, 0, 0, 1 };
local u142 = 0;
local u143 = false;
local u144 = v86;
local u145 = 0;
local u146 = 0;
local u147 = {};
local u148 = 0;
local u149 = 2;
local u150 = l__StarterPlayer__11.CharacterWalkSpeed;
local u151 = 0;
local u152 = 0;
local u153 = l__StarterPlayer__11.CharacterWalkSpeed;
local u154 = 70;
local u155 = v93;
u14 = l__RunService__8.RenderStepped:Connect(function(p58)
	u123 = p58;
	p58 = p58 * 60;
	if l__Humanoid__36.Health <= 0 or l__Humanoid__36:GetState() == Enum.HumanoidStateType.Dead then
		u13:Disconnect();
		u14:Disconnect();
		return;
	end;
	pcall(function()
		l__UserInputService__9.MouseBehavior = canLockMouse();
	end);
	l__UserInputService__9.MouseIconEnabled = l__UserInputService__9.MouseBehavior == Enum.MouseBehavior.Default;
	l__Assets__26.Sounds.wind.Playing = math.abs(u120) > 0;
	l__Assets__26.Sounds.wind.Volume = math.min(lerp(l__Assets__26.Sounds.wind.Volume, math.abs(u120) / 50, 0.08), 0.15 * p58);
	l__Assets__26.Sounds.wind2.Playing = true;
	if l__Humanoid__36.RootPart and (l__Humanoid__36:GetState() ~= Enum.HumanoidStateType.Climbing or l__Humanoid__36:GetState() ~= Enum.HumanoidStateType.Swimming) then
		l__Assets__26.Sounds.wind2.Volume = lerp(l__Assets__26.Sounds.wind2.Volume, math.min(l__Humanoid__36.RootPart.Velocity.y < -20 and math.abs(l__Humanoid__36.RootPart.Velocity.y) / 200 or 0, 0.05), 0.15 * p58);
	else
		l__Assets__26.Sounds.wind2.Volume = 0;
	end;
	if l__Humanoid__36.RootPart and not l__Humanoid__36.RootPart.Velocity.magnitude then

	end;
	local v614 = l__Humanoid__36.RootPart and Vector3.new(l__Humanoid__36.RootPart.Velocity.x, 0, l__Humanoid__36.RootPart.Velocity.z).magnitude or 0;
	if u79 then
		u124 = u124:lerp(v113.AimPart.CFrame:toObjectSpace(l__CurrentCamera__5.CFrame), 0.05 * p58);
		v113.PrimaryPart.CFrame = l__CurrentCamera__5.CFrame * u124 * u96;
	else
		if v614 > 11 then
			u125 = u125:lerp(CFrame.new(-1, -2.5, 0), 0.1 * p58);
		else
			u125 = u125:lerp(CFrame.new(0, 0, 0), 0.15 * p58);
		end;
		if u80 then
			u124 = u124:lerp(CFrame.new(0, -1.25, 0), 0.1 * p58);
		else
			u124 = u124:lerp(CFrame.new(1, -3, 0), 0.1 * p58);
		end;
		local v615 = math.cos(tick() * 0.5 * 10) * 0.005 * p58;
		if l__vars__38.isInteract.Value == false and l__vars__38.isCutscene.Value == false and v113:IsDescendantOf(workspace) then
			v113.PrimaryPart.CFrame = l__CurrentCamera__5.CFrame * u124 + l__CurrentCamera__5.CFrame.RightVector * 1.15 + l__CurrentCamera__5.CFrame.LookVector * 2;
			v113.PrimaryPart.CFrame = CFrame.new(v113.PrimaryPart.CFrame.Position, v113.PrimaryPart.CFrame.Position + u126);
			local l__PrimaryPart__616 = v113.PrimaryPart;
			l__PrimaryPart__616.CFrame = l__PrimaryPart__616.CFrame * (CFrame.fromEulerAnglesXYZ(math.rad(v84.Position * 20 * p58), 0, -l__CameraScript__37.vars.tilt.Value) * CFrame.Angles(0, math.rad(v84.Position * -10 * p58), -l__CameraScript__37.vars.y.Value) * CFrame.new(0, -l__CameraScript__37.vars.x.Value / 10, l__CameraScript__37.vars.y.Value) * CFrame.new(-v615, v615, v615) * CFrame.Angles(0, 0, math.rad(v615)) * u125 * u127 * CFrame.Angles(0, 0, math.rad(u128)) * CFrame.new(u129, 0, 0));
		end;
	end;
	if u7.sixthsense then
		local v617 = v32:GetButton("sense");
		if v617 then
			v617.Visible = true;
		end;
	end;
	if (l__LocalPlayer__5.data.currentLevel.Value <= 1 or l__LocalPlayer__5.data.currentLevel.Value == 10) and l__vars__38.isCutscene.Value == false and l__vars__38.isInteract.Value == false then
		if u131 <= tick() - u130 then
			u132 = false;
			v133.PrimaryPart.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
			u131 = 1.5;
			u130 = tick();
			v134.Position = l__Humanoid__36.RootPart.Position + Vector3.new(math.random(-30, 30), 0, math.random(-30, 30));
			local v618 = false;
			if typeof(v134) == "Instance" then
				v618 = v28.DetectLight(v134);
			end;
			if v618 and not v618.IsInLight and not u132 and (not isPartInside(v134, { v134, l__Character__35, workspace.Ignored }) and (v134 and getDistance(l__Humanoid__36.RootPart, v134)) >= 20) and not isPartVisible(v133.PrimaryPart, v133, { l__Character__35, v134 }) then
				u132 = true;
				u131 = math.random(80, 120);
				v133.PrimaryPart.CFrame = CFrame.new(v134.CFrame.Position, l__Humanoid__36.RootPart.Position);
			end;
		end;
		if u132 and isInFieldOfView(v133.Face) and isPartVisible(v133.Face, v133, { l__Character__35, v134 }) then
			if not l__PlayerGui__7:FindFirstChild("smilersJumpscare") then
				u133 = v133.Face.CFrame;
				playsound(getRandomChildren(l__Assets__26.Sounds.Monsters.Smilers.Jumpscares), l__PlayerGui__7);
			end;
			if math.clamp(getDistance(l__Humanoid__36.RootPart, v133.PrimaryPart) * 0.25 / 25, 0.25, 0.55) <= tick() - u134 then
				u131 = math.random(180, 250);
				u130 = tick();
				u132 = false;
				v133.PrimaryPart.CFrame = CFrame.new(10000000000, 10000000000, 10000000000);
			end;
		else
			u134 = tick();
		end;
		if u132 then
			v133.PrimaryPart.CFrame = CFrame.new(v133.PrimaryPart.CFrame.Position, l__Humanoid__36.RootPart.Position);
		end;
	end;
	local l__smilersJumpscare__619 = l__PlayerGui__7:FindFirstChild("smilersJumpscare");
	if l__smilersJumpscare__619 then
		local v620 = l__smilersJumpscare__619:FindFirstChild("t");
		if not v620 then
			v620 = Instance.new("NumberValue");
			v620.Name = "t";
			v620.Value = tick();
			v620.Parent = l__smilersJumpscare__619;
		end;
		u135 = lerp(u135, -l__smilersJumpscare__619.PlaybackLoudness / 15, 0.35 * p58);
		local v621 = math.max(-l__smilersJumpscare__619.PlaybackLoudness / 5, 1);
		if tick() - v620.Value < 0.25 then
			if not u136[v133] then
				u136[v133] = true;
				l__BaseUI__40.output.Visible = true;
				l__BaseUI__40.output.Text = playsound(getRandomChildren(l__Assets__26.Sounds.Voices.SmilerJS), l__Character__35.Head).text.Value;
				task.spawn(closeSub);
			end;
			l__TweenService__13:Create(v140, TweenInfo.new(0.15, Enum.EasingStyle.Quint), {
				Saturation = v621 * 10, 
				Brightness = v621 / 2, 
				TintColor = Color3.fromRGB(170, 0, 255)
			}):Play();
			l__CurrentCamera__5.CFrame = l__CurrentCamera__5.CFrame:lerp(CFrame.new(l__Character__35.Head.Position, u133.Position), 0.1);
		else
			l__TweenService__13:Create(v140, TweenInfo.new(1, Enum.EasingStyle.Sine), {
				Saturation = 0, 
				Brightness = 0, 
				TintColor = Color3.fromRGB(255, 255, 255)
			}):Play();
		end;
	else
		u135 = lerp(u135, 0, 0.01 * p58);
	end;
	if tick() - u137 >= 30 then
		local v622 = getRandomChildren(workspace.Lights);
		local v623 = v622 and v622:FindFirstChildWhichIsA("Light", true);
		if v622 and v622:FindFirstChildWhichIsA("BasePart") and getDistance(v622:FindFirstChildWhichIsA("BasePart"), l__CurrentCamera__5.CFrame.Position) < 100 and v623 then
			u137 = tick();
			playsound(getRandomChildren(l__Assets__26.Sounds.light_flickers), v623.Parent);
			task.spawn(function()
				local v624 = nil;
				local v625 = nil;
				for v626, v627 in pairs(v622:GetDescendants()) do
					if v627:IsA("BasePart") and v627.Transparency < 1 and v627.Material == Enum.Material.Neon then
						v624 = v627;
						v625 = v627.Material;
						break;
					end;
				end;
				for v628 = 1, math.random(3, 6) do
					v623.Enabled = not v623.Enabled;
					if not v623.Enabled then
						v624.Material = v625;
					else
						v624.Material = Enum.Material.SmoothPlastic;
					end;
					task.wait(math.random(2, 6) / 100);
				end;
				v623.Enabled = true;
				v624.Material = v625;
			end);
		end;
	end;
	local v629 = findNearestHostileEntity();
	local v630 = false;
	if v629 and v629.gVars.isDanger.Value == true then
		v630 = true;
	end;
	if v629 and (getDistance(v629.Humanoid.RootPart, l__Humanoid__36.RootPart) <= 80 or v630) and (isPartVisible(v629.Humanoid.RootPart, v629) or v630) then
		if v629.Name == "CSmilers" then
			workspace.Ambiences.RUNFORYOURLIFE.PlaybackSpeed = math.clamp(200 / getDistance(v629.Humanoid.RootPart, l__Humanoid__36.RootPart) / 10, 0.5, 1.4);
		end;
		local v631 = math.min(53.333333333333336 / getDistance(v629.Humanoid.RootPart, l__Humanoid__36.RootPart), 3.5);
		u138 = math.clamp(1 / getDistance(v629.Humanoid.RootPart, l__Humanoid__36.RootPart), 0, 0.15);
		if v630 then
			v631 = 2;
			u138 = 0.15;
		end;
		l__Assets__26.Sounds.beat.PlaybackSpeed = math.clamp(v631 * p58, 0.9, 2);
		l__Assets__26.Sounds.beat.Playing = true;
		if p58 < 2 then
			u139 = CFrame.Angles(math.rad(math.random(-10, 10) / 10) * v631 * p58, math.rad(math.random(-10, 10) / 10) * v631 * p58, math.rad(math.random(-10, 10) / 10) * v631 * p58);
			u127 = CFrame.new(math.random(-1, 1) / 100 * v631 * p58, math.random(-1, 1) / 100 * v631 * p58, math.random(-1, 1) / 100 * v631 * p58);
			l__CurrentCamera__5.CFrame = l__CurrentCamera__5.CFrame * CFrame.Angles(math.rad(math.random(-10, 10) / 100) * v631 * p58, math.rad(math.random(-10, 10) / 100) * v631 * p58, math.rad(math.random(-10, 10) / 100) * v631 * p58);
		end;
		local v632 = math.clamp(getDistance(v629.Humanoid.RootPart, l__Humanoid__36.RootPart) / 200, 0.1, 1);
		for v633, v634 in pairs(l__UI__39.darkGrain:GetChildren()) do
			v634.ImageTransparency = v632;
		end;
		for v635, v636 in pairs(l__UI__39.lightGrain:GetChildren()) do
			v636.ImageTransparency = v632;
		end;
		local v637 = false;
		for v638, v639 in pairs(v629.Humanoid.RootPart:GetChildren()) do
			if v639:IsA("Sound") and v639.Name ~= "hum" and v639.Name ~= "steps" and not string.find(v639.Name, "glitch") and v639.PlaybackLoudness > 0 and p58 < 2 then
				v637 = true;
				l__UI__39.flash.Transparency = lerp(l__UI__39.flash.Transparency, 1 - v639.PlaybackLoudness / 1500, 0.35 * p58);
				u140 = -(v639.PlaybackLoudness / 100);
				u141[1] = lerp(u141[1], math.clamp(1 - v639.PlaybackLoudness / 1200, 0.5, 1), 0.8 * p58);
				u141[5] = lerp(u141[5], math.clamp(1 - v639.PlaybackLoudness / 800, 0.5, 1), 0.8 * p58);
			end;
		end;
		if not v637 then
			l__TweenService__13:Create(l__UI__39.flash, TweenInfo.new(5, Enum.EasingStyle.Sine), {
				Transparency = 1
			}):Play();
			u140 = lerp(u140, 0, 0.1 * p58);
			u141[1] = lerp(u141[1], 1, 0.1 * p58);
			u141[5] = lerp(u141[5], 1, 0.1 * p58);
		end;
		if isPartVisible(v629.Humanoid.RootPart, v629) and not u136[v629] then
			u136[v629] = true;
			if v629.Name == "Howler" then
				l__BaseUI__40.output.Visible = true;
				local v640 = { "You: WHAT THE?" };
				l__BaseUI__40.output.Text = v640[math.random(#v640)];
				task.spawn(closeSub);
			elseif v629.Name == "Starfish" then
				l__BaseUI__40.output.Visible = true;
				local v641 = { "You: You: I hope it doesn't sees me.", "You: I don't wanna be seen by it.", "You: I need to find covers." };
				l__BaseUI__40.output.Text = v641[math.random(#v641)];
				task.spawn(closeSub);
			elseif v629.Name == "Hounds" then
				l__BaseUI__40.output.Visible = true;
				local v642 = { "You: I must be quiet.", "You: Don't even make a single sound.", "You: I need to be quiet." };
				l__BaseUI__40.output.Text = v642[math.random(#v642)];
				task.spawn(closeSub);
			end;
		end;
	else
		u138 = 0;
		l__Assets__26.Sounds.beat.Playing = false;
		u139 = CFrame.Angles(0, 0, 0);
		u127 = CFrame.new(0, 0, 0);
		for v643, v644 in pairs(l__UI__39.darkGrain:GetChildren()) do
			v644.ImageTransparency = 1;
		end;
		for v645, v646 in pairs(l__UI__39.lightGrain:GetChildren()) do
			v646.ImageTransparency = 1;
		end;
		l__TweenService__13:Create(l__UI__39.flash, TweenInfo.new(5, Enum.EasingStyle.Sine), {
			Transparency = 1
		}):Play();
		u140 = lerp(u140, 0, 0.1 * p58);
		u141[1] = lerp(u141[1], 1, 0.1 * p58);
		u141[5] = lerp(u141[5], 1, 0.1 * p58);
	end;
	if l__vars__38.isCutscene.Value == false then
		v110.CFrame = CFrame.new(l__CurrentCamera__5.CFrame.Position, l__CurrentCamera__5.CFrame.Position + u126 + Vector3.new(0, u142, 0) + l__CurrentCamera__5.CFrame.RightVector * -u142 / 2) * CFrame.fromEulerAnglesXYZ(math.rad(l__CameraScript__37.vars.x.Value * 25), math.rad(l__CameraScript__37.vars.x.Value * 10), math.rad(l__CameraScript__37.vars.x.Value * 20)) * CFrame.Angles(math.rad(v84.Position * 20 * p58), 0, 0) * u139 * CFrame.Angles(0, 0, math.rad(u128)) * CFrame.new(u129, 0, 0);
	end;
	u128 = lerp(u128, u86, 0.08 * p58);
	u129 = lerp(u129, u87, 0.08 * p58);
	if v110:IsDescendantOf(workspace) and v110.isOn.Value == true then
		u142 = lerp(u142, 0, 0.25 * p58);
	else
		u142 = lerp(u142, -1, 0.25 * p58);
	end;
	if u77 and tick() - u76 >= 1.5 and not l__Assets__26.Sounds.breath.IsPlaying and u9 > 20 then
		u78 = 0.25;
		l__Assets__26.Sounds.breath:Play();
	end;
	if v614 < l__StarterPlayer__11.CharacterWalkSpeed and not u143 or u9 <= 20 then
		u76 = tick();
		u78 = 0;
	end;
	l__Assets__26.Sounds.breath.Volume = lerp(l__Assets__26.Sounds.breath.Volume, u78, 0.05 * p58);
	if l__Assets__26.Sounds.breath.Volume <= 0.05 and l__Assets__26.Sounds.breath.IsPlaying then
		l__Assets__26.Sounds.breath:Stop();
	end;
	if v614 < 11 and u9 > 50 then
		l__Assets__26.Sounds.breath_idle.Playing = true;
		if not v629 and not l__Assets__26.Sounds.breath.IsPlaying and not u143 then
			l__Assets__26.Sounds.breath_idle.Volume = lerp(l__Assets__26.Sounds.breath_idle.Volume, 0.15, 0.025 * p58);
		else
			l__Assets__26.Sounds.breath_idle.Volume = lerp(l__Assets__26.Sounds.breath_idle.Volume, 0, 0.025 * p58);
		end;
	else
		l__Assets__26.Sounds.breath_idle.Volume = lerp(l__Assets__26.Sounds.breath_idle.Volume, 0, 0.025 * p58);
	end;
	if u9 <= 25 or u143 then
		l__Assets__26.Sounds.tired.Playing = true;
		l__Assets__26.Sounds.tired.Volume = lerp(l__Assets__26.Sounds.tired.Volume, 0.008, 0.01 * p58);
	else
		l__Assets__26.Sounds.tired.Volume = lerp(l__Assets__26.Sounds.tired.Volume, 0, 0.025 * p58);
	end;
	l__Assets__26.Sounds.beat.Volume = lerp(l__Assets__26.Sounds.beat.Volume, u138, 0.1 * p58);
	if l__Assets__26.Sounds.beat.Volume <= 0.01 and l__Assets__26.Sounds.beat.IsPlaying then
		l__Assets__26.Sounds.beat:Stop();
	end;
	if u144 <= tick() - u73 and l__Assets__26.Sounds.Jumpscares:FindFirstChild(l__LocalPlayer__5.data.currentLevel.Value) then
		u73 = tick();
		u144 = math.random(80, 120);
		local v647 = getRandomChildren(l__Assets__26.Sounds.Jumpscares[l__LocalPlayer__5.data.currentLevel.Value]);
		local v648 = playsound(v647, l__CurrentCamera__5.CFrame.Position + Vector3.new(math.random(-200, 200), 0, math.random(-200, 200)), v647.Volume * math.max(math.random(10, 20) / 10, 1));
		if not v647:FindFirstChild("stay") then
			l__TweenService__13:Create(v648.Parent, TweenInfo.new(math.random(5, 10), Enum.EasingStyle.Linear), {
				WorldPosition = v648.Parent.WorldPosition + Vector3.new(math.random(-500, 500), 0, -500, 500)
			}):Play();
		end;
	end;
	l__TweenService__13:Create(l__UI__39.camera.slider.frame, TweenInfo.new(0.5, Enum.EasingStyle.Quint), {
		Position = UDim2.new(u92 / u8, 0, 0, 0)
	}):Play();
	local function v649()
		local l__underwaterBlur__650 = l__CurrentCamera__5:FindFirstChild("underwaterBlur");
		if l__underwaterBlur__650 then
			l__underwaterBlur__650.Name = l__underwaterBlur__650.Name .. "__debris";
			l__underwaterBlur__650.Size = 30;
			l__Debris__14:AddItem(l__underwaterBlur__650, 3.5);
			l__TweenService__13:Create(l__underwaterBlur__650, TweenInfo.new(3.5, Enum.EasingStyle.Sine), {
				Size = 0
			}):Play();
		end;
	end;
	if u3 then
		l__Humanoid__36:SetStateEnabled(Enum.HumanoidStateType.Swimming, true);
		u77 = false;
		u83 = false;
		local v651 = tick() - u72;
		v136.Size = v651 * 2.5;
		if v651 > 15 then
			l__TweenService__13:Create(v135, TweenInfo.new(4, Enum.EasingStyle.Sine), {
				Contrast = v651 * 0.05, 
				Brightness = v651 * -0.05
			}):Play();
		end;
		if v651 > 10 and v651 < 25 and (math.max(2 * (25 - v651) / 15, 1) <= tick() - u145 and l__Humanoid__36.Health > 0) then
			u145 = tick();
			playsound(l__Assets__26.Sounds.gulp, l__PlayerGui__7, nil, nil, true);
		end;
		if v651 >= 25 and l__Humanoid__36.Health > 0 and l__Humanoid__36:GetState() ~= Enum.HumanoidStateType.Dead then
			playsound(l__Assets__26.Sounds.choke, l__PlayerGui__7);
			l__Humanoid__36.Health = 0;
		end;
		l__SoundService__15.Main.Underwater.HighGain = lerp(l__SoundService__15.Main.Underwater.HighGain, -80, 0.15 * p58);
		l__SoundService__15.Main.Underwater.MidGain = lerp(l__SoundService__15.Main.Underwater.MidGain, -30, 0.15 * p58);
		l__SoundService__15.Main.Underwater.LowGain = lerp(l__SoundService__15.Main.Underwater.LowGain, -10, 0.15 * p58);
		if not u79 then
			local l__underwaterBlur__debris__652 = l__CurrentCamera__5:FindFirstChild("underwaterBlur__debris");
			if l__underwaterBlur__debris__652 then
				l__underwaterBlur__debris__652:Destroy();
			end;
			if not l__CurrentCamera__5:FindFirstChild("underwaterBlur") then
				local v653 = Instance.new("BlurEffect");
				v653.Name = "underwaterBlur";
				v653.Size = 50;
				v653.Parent = l__CurrentCamera__5;
				l__TweenService__13:Create(v653, TweenInfo.new(3.5, Enum.EasingStyle.Quint), {
					Size = 15
				}):Play();
			end;
		else
			v649();
		end;
		local v654 = v110:FindFirstChild("bubbles");
		if not v654 then
			v654 = l__Assets__26.Particles.bubbles:Clone();
			v654.Parent = v110;
			task.spawn(function()
				for v655 = 1, math.random(8, 13) do
					if not v654:IsDescendantOf(workspace) then
						break;
					end;
					v654:Emit(1);
					task.wait(math.random(1, 2) / 15);
				end;
			end);
		end;
		if math.random(8, 20) / 10 <= tick() - u146 then
			u146 = tick();
			v654:Emit(math.random(2, 3));
		end;
		if not l__CurrentCamera__5:FindFirstChild("underwaterColor") then
			local v656 = Instance.new("ColorCorrectionEffect");
			v656.Name = "underwaterColor";
			v656.TintColor = workspace.Terrain.WaterColor;
			v656.Parent = l__CurrentCamera__5;
			if not u147.splash or tick() - u147.splash >= 0.8 then
				u147.splash = tick();
				if v614 > 12 then
					playsound(l__Assets__26.Sounds.hard_splash, l__Humanoid__36.RootPart, nil, nil, true);
				elseif v614 > 6 then
					playsound(l__Assets__26.Sounds.light_splash, l__Humanoid__36.RootPart, nil, nil, true);
				else
					playsound(l__Assets__26.Sounds.watersplash, l__Humanoid__36.RootPart, nil, nil, true);
				end;
				createParticle(l__Assets__26.Particles.splash, math.random(5, 8), l__Humanoid__36.RootPart.Position, 1.5);
			end;
		end;
		l__Assets__26.Sounds.underwater.Volume = lerp(l__Assets__26.Sounds.underwater.Volume, 0.25, 0.15 * p58);
		l__Assets__26.Sounds.underwater.Playing = true;
	else
		local v657 = RaycastParams.new();
		v657.FilterDescendantsInstances = { l__Character__35, workspace.Ignored, workspace.Entities };
		v657.IgnoreWater = true;
		if l__Humanoid__36:GetState() == Enum.HumanoidStateType.Swimming and workspace:Raycast(l__Humanoid__36.RootPart.Position + l__Humanoid__36.RootPart.Velocity, Vector3.new(0, -6, 0), v657) then
			l__Humanoid__36:ChangeState(Enum.HumanoidStateType.Running);
		end;
		l__Humanoid__36:SetStateEnabled(Enum.HumanoidStateType.Swimming, false);
		l__TweenService__13:Create(v136, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {
			Size = 0
		}):Play();
		l__TweenService__13:Create(v135, TweenInfo.new(3, Enum.EasingStyle.Sine), {
			Contrast = 0, 
			Brightness = 0
		}):Play();
		u72 = tick();
		l__SoundService__15.Main.Underwater.HighGain = lerp(l__SoundService__15.Main.Underwater.HighGain, 0, 0.05 * p58);
		l__SoundService__15.Main.Underwater.MidGain = lerp(l__SoundService__15.Main.Underwater.MidGain, 0, 0.05 * p58);
		l__SoundService__15.Main.Underwater.LowGain = lerp(l__SoundService__15.Main.Underwater.LowGain, 0, 0.05 * p58);
		v649();
		local l__underwaterColor__658 = l__CurrentCamera__5:FindFirstChild("underwaterColor");
		if l__underwaterColor__658 then
			if not u147.splash or tick() - u147.splash >= 0.8 then
				u147.splash = tick();
				playsound(l__Assets__26.Sounds.watersplash, l__Humanoid__36.RootPart, nil, nil, true);
				createParticle(l__Assets__26.Particles.splash, math.random(5, 8), l__Humanoid__36.RootPart.Position, 1.5);
			end;
			l__underwaterColor__658:Destroy();
		end;
		l__Assets__26.Sounds.underwater.Volume = lerp(l__Assets__26.Sounds.underwater.Volume, 0, 0.15 * p58);
		local l__bubbles__659 = v110:FindFirstChild("bubbles");
		if l__bubbles__659 then
			l__bubbles__659:Destroy();
		end;
		local v660 = RaycastParams.new();
		v660.FilterDescendantsInstances = { workspace.Buildings };
		v660.FilterType = Enum.RaycastFilterType.Whitelist;
		v660.IgnoreWater = true;
		if l__Humanoid__36.RootPart and not l__GamepadEnabled__42 and not l__TouchEnabled__4 then
			if u83 then
				local v661 = 3.5;
			else
				v661 = 2.5;
			end;
			local v662 = workspace:Raycast(l__Humanoid__36.RootPart.Position, Vector3.new(0, v661, 0), v660);
			if v662 and v662.Instance.CanCollide == true then
				u83 = true;
			elseif not l__UserInputService__9:IsKeyDown(Enum.KeyCode.LeftControl) then
				u83 = false;
			end;
		end;
	end;
	l__UI__39.crosshair.Visible = not l__UI__39.input.Visible;
	local v663, v664 = findInteractiveObject(10);
	u99 = v663;
	u101 = v664;
	if u99 and l__vars__38.isInteract.Value == false then
		l__UI__39.selection.Adornee = u99;
		l__TweenService__13:Create(l__UI__39.selection, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
			FillTransparency = 0.5, 
			OutlineTransparency = 0
		}):Play();
		if not l__TouchEnabled__4 then
			l__TweenService__13:Create(l__UI__39.crosshair, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
				Transparency = 0.5
			}):Play();
			l__TweenService__13:Create(l__UI__39.crosshair.UIScale, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Scale = 2
			}):Play();
		else
			local v665 = v32:GetButton("interact");
			if v665 then
				v665.Visible = true;
			end;
		end;
	elseif l__UI__39.crosshair.Transparency < 1 then
		l__TweenService__13:Create(l__UI__39.selection, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
			FillTransparency = 1, 
			OutlineTransparency = 1
		}):Play();
		if not l__TouchEnabled__4 then
			l__TweenService__13:Create(l__UI__39.crosshair, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
				Transparency = 1
			}):Play();
			l__TweenService__13:Create(l__UI__39.crosshair.UIScale, TweenInfo.new(1, Enum.EasingStyle.Quint), {
				Scale = 1
			}):Play();
		else
			local v666 = v32:GetButton("interact");
			if v666 then
				v666.Visible = false;
			end;
		end;
	end;
	if u83 then
		u148 = lerp(u148, -8, 0.035 * p58);
		u77 = false;
		u78 = 0;
		u149 = 1;
		u150 = 3.5;
		if not v83.crouchIdle.IsPlaying then
			v83.crouchIdle:Play(0.25);
		end;
		if v614 > 0.1 then
			if not v83.crouchMove.IsPlaying then
				v83.crouchMove:Play();
			end;
		else
			v83.crouchMove:Stop();
		end;
		l__Humanoid__36.CameraOffset = l__Humanoid__36.CameraOffset:lerp(Vector3.new(0, -0.75, 0), 0.05);
	else
		if u75 then
			u77 = true;
		end;
		u149 = 2;
		if v83.crouchIdle.IsPlaying then
			v83.crouchIdle:Stop(0.25);
			v83.crouchMove:Stop();
		end;
		l__Humanoid__36.CameraOffset = l__Humanoid__36.CameraOffset:lerp(Vector3.new(0, 0, 0), 0.05);
	end;
	if p58 > 1 and p58 < 1.8 then
		local v667 = -v84.Position / (u123 * 240);
	elseif p58 >= 1.8 then
		v667 = -v84.Position / p58;
	else
		v667 = -v84.Position * p58;
	end;
	l__Humanoid__36.CameraOffset = l__Humanoid__36.CameraOffset + Vector3.new(0, v667, 0);
	if u87 ~= 0 then
		u150 = 2;
	end;
	if l__vars__38.isInteract.Value == true then
		u150 = 0;
		u83 = false;
		u77 = false;
	end;
	if l__vars__38.water.Value < 1000 then
		u83 = false;
	end;
	local v668 = l__Humanoid__36.MoveDirection:Dot(-l__CurrentCamera__5.CFrame.LookVector);
	if u77 and l__Humanoid__36.MoveDirection:Dot(l__CurrentCamera__5.CFrame.LookVector) > 0.15 and u9 > 0 and not u143 then
		u151 = tick();
		u9 = u9 - u10 * p58;
		if u9 <= 0 then
			u143 = true;
			u77 = false;
		end;
		u148 = lerp(u148, 12.5, 0.035 * p58);
		u98.speedLerp = 0.35;
		if u9 <= 20 then
			v137.Contrast = lerp(v137.Contrast, math.min(10 / math.max(u9, 5), 1), 0.05 * p58);
			v138.Size = lerp(v138.Size, math.max(100 / math.max(u9, 5), 1), 0.05 * p58);
			u150 = u12 - math.min(80 / math.max(u9, 5), 10);
		else
			u150 = u12;
		end;
		u85 = false;
		u84 = false;
		u87 = 0;
		u86 = 0;
		v83.leanLeft:Stop(0.5);
		v83.leanRight:Stop(0.5);
	else
		if not u83 and u87 == 0 and l__vars__38.isInteract.Value == false then
			u98.speedLerp = 0.15;
			u150 = l__StarterPlayer__11.CharacterWalkSpeed;
			u148 = lerp(u148, 0, 0.05 * p58);
		end;
		if not u143 then
			u9 = u9 + (u83 and 0.15 * u11 or 0.1 * u11) * p58;
			v137.Contrast = lerp(v137.Contrast, 0, 0.035 * p58);
			v138.Size = lerp(v138.Size, 0, 0.05 * p58);
		else
			v137.Contrast = lerp(v137.Contrast, 0, 0.001 * p58);
			v138.Size = lerp(v138.Size, 0, 0.005 * p58);
		end;
	end;
	if l__Character__35.Welds:FindFirstChild("lockerWeld") then
		u85 = false;
		u84 = false;
		u87 = 0;
		u86 = 0;
		v83.leanLeft:Stop(0.5);
		v83.leanRight:Stop(0.5);
		u83 = false;
		u77 = false;
	end;
	if u143 then
		if u83 then
			local v669 = 0.95;
		else
			v669 = 1.5;
		end;
		if v669 <= tick() - u151 then
			u9 = u9 + 0.25 * p58;
			if u9 >= 100 then
				u143 = false;
			end;
		end;
	end;
	u9 = math.clamp(u9, 0, 100);
	if v614 < 10 and l__Humanoid__36.RootPart then
		local l__jumpForce__670 = l__Humanoid__36.RootPart:FindFirstChild("jumpForce");
		if l__jumpForce__670 then
			l__jumpForce__670:Destroy();
		end;
	end;
	local v671 = l__Assets__26.Sounds.beat.PlaybackLoudness / 250;
	u152 = math.clamp(lerp(u152, p58 < 2 and v671 or 0, 0.5 * p58), -10, 10);
	if u3 then
		local v672 = 15;
	else
		v672 = l__vars__38.water.Value < 1000 and math.min(u153 - l__vars__38.water.Value * 5, u153) or u153;
	end;
	l__Humanoid__36.WalkSpeed = v672;
	if v668 > 0.15 then
		l__Humanoid__36.WalkSpeed = l__Humanoid__36.WalkSpeed / 1.5;
	end;
	l__Humanoid__36.JumpPower = l__StarterPlayer__11.CharacterJumpPower;
	l__Humanoid__36.HipHeight = lerp(l__Humanoid__36.HipHeight, u149, 0.035 * p58);
	if l__vars__38.isCutscene.Value == false then
		l__CurrentCamera__5.FieldOfView = u154 + u152 + u148 + u140 + u135 + u115;
	end;
	l__UI__39.heartbeat.Transparency = 1 - v671 / 50;
	if l__vars__38.isInteract.Value == false and l__vars__38.isCutscene.Value == false then
		l__CurrentCamera__5.CFrame = l__CurrentCamera__5.CFrame * (CFrame.Angles(0, 0, math.rad(u128)) * CFrame.new(u129, 0, 0) * CFrame.new(0, 0, 0, unpack(u141)));
	end;
	l__UserInputService__9.MouseDeltaSensitivity = l__CurrentCamera__5.FieldOfView / 70;
	u153 = lerp(u153, u150, u98.speedLerp * p58);
	if u79 then
		if u95 then
			u154 = lerp(u154, 70 - u92, u98.fovLerp * p58);
		end;
	else
		u154 = 70;
	end;
	u126 = lerp(u126, l__CurrentCamera__5.CFrame.LookVector, 0.4 * p58);
	u155 = l__Humanoid__36.RootPart and Vector3.new(l__Humanoid__36.RootPart.Position.x, 0, l__Humanoid__36.RootPart.Position.z) or Vector3.new();
end);
for v673, v674 in pairs(workspace.Ignored.Lightings:GetChildren()) do
	if v674:IsA("BasePart") then
		local u156 = nil;
		u156 = v674.Touched:Connect(function(p59)
			if p59:IsDescendantOf(l__Character__35) then
				u156:Disconnect();
				l__Lighting__12:ClearAllChildren();
				for v675, v676 in pairs(v674.Settings:GetChildren()) do
					l__Lighting__12[v676.Name] = v676.Value;
				end;
				for v677, v678 in pairs(v674.Instances:GetChildren()) do
					local v679 = v678:Clone();
					v679.Parent = l__Lighting__12;
					_G.lightings[#_G.lightings + 1] = v679;
				end;
			end;
		end);
	end;
end;
if l__TouchEnabled__4 then
	task.spawn(function()
		while l__vars__38.isCutscene.Value == true do
			task.wait(0.03333333333333333);		
		end;
		task.wait(0.5);
		l__TweenService__13:Create(l__UI__39.crosshair, TweenInfo.new(0.25, Enum.EasingStyle.Quint), {
			Transparency = 0.5
		}):Play();
		l__TweenService__13:Create(l__UI__39.crosshair.UIScale, TweenInfo.new(1, Enum.EasingStyle.Quint), {
			Scale = 2
		}):Play();
		local u157 = {};
		local u158 = {};
		local function v680(p60, p61)
			if not u157[p60] then
				u157[p60] = false;
			end;
			if not u158[p60] then
				u158[p60] = false;
			end;
			u158[p60] = p61 == Enum.UserInputState.Begin;
			if (not (not v525[p60]) or p60 == "zoomin" or p60 == "zoomout") and p61 == Enum.UserInputState.Begin then
				u157[p60] = not u157[p60];
				if p60 == "zoomin" then
					while u158[p60] do
						u94 = tick();
						task.spawn(function()
							v525.cameraZoom(1);
						end);
						task.wait(0.06666666666666667);					
					end;
				elseif p60 == "zoomout" then
					while u158[p60] do
						u94 = tick();
						task.spawn(function()
							v525.cameraZoom(-1);
						end);
						task.wait(0.06666666666666667);					
					end;
				else
					v525[p60](u157[p60]);
				end;
			end;
		end;
		v32:BindAction("crouch", v680, true);
		v32:SetImage("crouch", "rbxassetid://9464620863");
		v32:SetPressedColor("crouch", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("crouch", Color3.fromRGB(0, 0, 0));
		v32:BindAction("sprint", v680, true);
		v32:SetImage("sprint", "rbxassetid://9464587641");
		v32:SetPressedColor("sprint", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("sprint", Color3.fromRGB(0, 0, 0));
		v32:BindAction("flashlight", v680, true);
		v32:SetImage("flashlight", "rbxassetid://9464628204");
		v32:SetPressedColor("flashlight", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("flashlight", Color3.fromRGB(0, 0, 0));
		v32:BindAction("peekR", v680, true);
		v32:SetImage("peekR", "rbxassetid://9464695301");
		v32:SetPressedColor("peekR", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("peekR", Color3.fromRGB(0, 0, 0));
		v32:BindAction("peekL", v680, true);
		v32:SetImage("peekL", "rbxassetid://9464693933");
		v32:SetPressedColor("peekL", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("peekL", Color3.fromRGB(0, 0, 0));
		v32:BindAction("camera", v680, true);
		v32:SetImage("camera", "rbxassetid://9464647020");
		v32:SetPressedColor("camera", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("camera", Color3.fromRGB(0, 0, 0));
		v32:BindAction("whistle", v680, true);
		v32:SetImage("whistle", "rbxassetid://9464670440");
		v32:SetPressedColor("whistle", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("whistle", Color3.fromRGB(0, 0, 0));
		v32:BindAction("zoomin", v680, true);
		v32:SetImage("zoomin", "rbxassetid://9464720734");
		v32:SetPressedColor("zoomin", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("zoomin", Color3.fromRGB(0, 0, 0));
		v32:GetButton("zoomin").Visible = false;
		v32:BindAction("zoomout", v680, true);
		v32:SetImage("zoomout", "rbxassetid://9464721509");
		v32:SetPressedColor("zoomout", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("zoomout", Color3.fromRGB(0, 0, 0));
		v32:GetButton("zoomout").Visible = false;
		v32:BindAction("interact", v680, true);
		v32:SetImage("interact", "rbxassetid://9513803883");
		v32:SetPressedColor("interact", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("interact", Color3.fromRGB(0, 0, 0));
		v32:BindAction("zoom", v680, true);
		v32:SetImage("zoom", "rbxassetid://9513904302");
		v32:SetPressedColor("zoom", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("zoom", Color3.fromRGB(0, 0, 0));
		v32:GetButton("zoom").Visible = false;
		v32:BindAction("nv", v680, true);
		v32:SetImage("nv", "rbxassetid://9523617502");
		v32:SetPressedColor("nv", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("nv", Color3.fromRGB(0, 0, 0));
		v32:GetButton("nv").Visible = false;
		v32:BindAction("sense", v680, true);
		v32:SetImage("sense", "rbxassetid://9524011785");
		v32:SetPressedColor("sense", Color3.fromRGB(74, 74, 74));
		v32:SetReleasedColor("sense", Color3.fromRGB(0, 0, 0));
		v32:GetButton("sense").Visible = false;
	end);
end;
l__Assets__26.Events.Text.OnClientEvent:Connect(function(p62, p63)
	if p63 then
		playsound(p63, l__Character__35.Head);
	end;
	l__BaseUI__40.output.Visible = true;
	l__BaseUI__40.output.Text = p62;
	task.spawn(closeSub);
end);
local v681 = require(l__LocalPlayer__5.PlayerScripts.PlayerModule.ControlModule);
local v682 = v27.new(Vector3.new());
v682.Speed = 25;
local u159 = Vector3.new(0, 0, 1);
local u160 = Vector3.new(1, 0, 0);
local u161 = 0;
l__UserInputService__9.InputBegan:Connect(function(p64, p65)
	if not p65 and ((p64.UserInputType == Enum.UserInputType.Keyboard or l__GamepadEnabled__42) and l__vars__38.isCutscene.Value == false and l__vars__38.isInteract.Value == false) then
		if p64.KeyCode == Enum.KeyCode.W then
			v682.Target = v682.Target - u159;
			while l__UserInputService__9:IsKeyDown(Enum.KeyCode.W) do
				task.wait();			
			end;
			v682.Target = v682.Target + u159;
			return;
		end;
		if p64.KeyCode == Enum.KeyCode.S then
			v682.Target = v682.Target + u159;
			while l__UserInputService__9:IsKeyDown(Enum.KeyCode.S) do
				task.wait();			
			end;
			v682.Target = v682.Target - u159;
			return;
		end;
		if p64.KeyCode == Enum.KeyCode.A then
			v682.Target = v682.Target - u160;
			while l__UserInputService__9:IsKeyDown(Enum.KeyCode.A) do
				task.wait();			
			end;
			v682.Target = v682.Target + u160;
			return;
		end;
		if p64.KeyCode == Enum.KeyCode.D then
			v682.Target = v682.Target + u160;
			while l__UserInputService__9:IsKeyDown(Enum.KeyCode.D) do
				task.wait();			
			end;
			v682.Target = v682.Target - u160;
			return;
		end;
		if (p64.KeyCode == Enum.KeyCode.Space or p64.KeyCode == Enum.KeyCode.ButtonB) and l__Humanoid__36:GetState() ~= Enum.HumanoidStateType.Swimming and tick() - u161 >= 0.75 then
			l__Humanoid__36.Jump = true;
			u161 = tick();
		end;
	end;
end);
l__UserInputService__9.InputChanged:Connect(function(p66, p67)
	if not p67 and p66.KeyCode == Enum.KeyCode.Thumbstick1 then
		v682.Target = Vector3.new(p66.Position.x, 0, -p66.Position.y);
	end;
end);
l__UserInputService__9.InputEnded:Connect(function(p68)
	if p68.KeyCode == Enum.KeyCode.Thumbstick1 then
		v682.Target = Vector3.new();
	end;
end);
function clampMagnitude(p69, p70)
	return p69.Unit * math.min(p69.Magnitude, p70);
end;
local u162 = Instance.new("BodyForce");
l__RunService__8:BindToRenderStep("Walking", 100, function()
	if l__vars__38.isInteract.Value == true or l__vars__38.isCutscene.Value == true then
		return;
	end;
	if l__Humanoid__36:GetState() == Enum.HumanoidStateType.Swimming then
		local v683 = l__CurrentCamera__5.CFrame.Position + l__CurrentCamera__5.CFrame.LookVector * 10000;
		l__Humanoid__36.RootPart.CFrame = CFrame.new(l__Humanoid__36.RootPart.Position, Vector3.new(v683.x, l__Humanoid__36.RootPart.Position.y, v683.z));
		l__LocalPlayer__5:Move(v682.Target, true);
		local v684 = Vector3.new();
		if l__UserInputService__9:IsKeyDown(Enum.KeyCode.Space) then
			if Vector3.new(l__Humanoid__36.RootPart.Velocity.x, 0, l__Humanoid__36.RootPart.Velocity.z).magnitude > 1 then
				local v685 = 1800;
			else
				v685 = 1000;
			end;
			u162.Force = Vector3.new(0, v685, 0);
			u162.Parent = l__Humanoid__36.RootPart;
		else
			u162.Parent = nil;
		end;
		if l__Humanoid__36.RootPart.Velocity.y < -2 then
			local v686 = 15;
		else
			v686 = 8;
		end;
		l__Humanoid__36.RootPart.Velocity = clampMagnitude(l__Humanoid__36.RootPart.Velocity, v686);
	else
		l__LocalPlayer__5:Move(v682.Position, true);
		u162.Parent = nil;
	end;
	local v687 = v681:GetMoveVector();
	if l__TouchEnabled__4 then
		v682.Target = v687;
	end;
end);
