-- Decompiled with the Synapse X Luau decompiler.

local l__Parent__1 = script.Parent;
local l__UserInputService__2 = game:GetService("UserInputService");
local l__ReplicatedStorage__3 = game:GetService("ReplicatedStorage");
local l__LocalPlayer__4 = game.Players.LocalPlayer;
local l__Humanoid__1 = l__Parent__1:WaitForChild("Humanoid");
local l__CurrentCamera__2 = workspace.CurrentCamera;
local function u3(p1, p2)
	for v5, v6 in pairs(p1:GetChildren()) do
		if v6:IsA("Decal") then
			if p2 then
				local v7 = 0;
			else
				v7 = 1;
			end;
			v6.Transparency = v7;
		elseif v6:IsA("SurfaceGui") then
			v6.Enabled = p2;
		end;
	end;
end;
local function v8(p3)
	if p3 == nil or p3 == false then
		l__Humanoid__1.CameraOffset = Vector3.new();
		l__LocalPlayer__4.CameraMaxZoomDistance = 0.5;
		l__LocalPlayer__4.CameraMinZoomDistance = 0.5;
		l__LocalPlayer__4.CameraMode = Enum.CameraMode.LockFirstPerson;
	end;
	for v9, v10 in pairs(l__CurrentCamera__2:GetChildren()) do
		if v10:IsA("BasePart") and v10.Name ~= "Particle" then
			if v10:FindFirstChild("SurfaceGui") then
				v10.Transparency = 1;
			else
				v10.Transparency = 0;
			end;
			u3(v10, true);
		end;
	end;
end;
local u4 = false;
if l__Parent__1 and l__Humanoid__1 then
	l__Humanoid__1.Died:Connect(function()
		v8(false);
		u4 = false;
	end);
	local function u5()
		if u4 then
			l__Humanoid__1.CameraOffset = Vector3.new();
			l__LocalPlayer__4.CameraMaxZoomDistance = 0.5;
			l__LocalPlayer__4.CameraMinZoomDistance = 0.5;
			l__LocalPlayer__4.CameraMode = Enum.CameraMode.LockFirstPerson;
			u4 = false;
			return;
		end;
		l__Humanoid__1.CameraOffset = Vector3.new(0, 0.5, 0);
		l__LocalPlayer__4.CameraMaxZoomDistance = 5;
		l__LocalPlayer__4.CameraMinZoomDistance = 5;
		l__LocalPlayer__4.CameraMode = Enum.CameraMode.Classic;
		u4 = true;
	end;
	l__UserInputService__2.InputBegan:Connect(function(p4, p5)
		if p4.KeyCode == Enum.KeyCode.F5 and l__Humanoid__1.Health ~= 0 and not p5 then
			u5();
		end;
	end);
	l__ReplicatedStorage__3.GameRemotes.F5.OnInvoke = function()
		if l__Parent__1 and l__Humanoid__1 and l__Humanoid__1.Health ~= 0 then
			u5();
		end;
	end;
end;
local l__HumanoidRootPart__6 = l__Parent__1:WaitForChild("HumanoidRootPart");
local l__mouse__7 = l__LocalPlayer__4:GetMouse();
game:GetService("RunService").RenderStepped:Connect(function()
	if u4 and l__Humanoid__1.Health ~= 0 and l__HumanoidRootPart__6 then
		l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCenter;
		for v11, v12 in pairs(l__CurrentCamera__2:GetDescendants()) do
			if v12:IsA("BasePart") and v12.Name ~= "Particle" then
				v12.Transparency = 1;
				u3(v12, false);
			end;
		end;
		if l__UserInputService__2.TouchEnabled == true then
			return;
		end;
		local l__lookVector__13 = l__mouse__7.Hit.lookVector;
		if l__lookVector__13.y <= -1 then
			return;
		end;
		if l__lookVector__13.y >= 1 then
			return;
		end;
		if l__lookVector__13 then
			l__HumanoidRootPart__6.CFrame = CFrame.new(l__HumanoidRootPart__6.CFrame.p, l__HumanoidRootPart__6.CFrame.p + Vector3.new(l__lookVector__13.x, 5E-05, l__lookVector__13.z));
			return;
		end;
	else
		l__UserInputService__2.MouseBehavior = Enum.MouseBehavior.LockCenter;
		v8(true);
	end;
end);
