ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(500)
	end
end)

local MenuAmunation = RageUI.CreateMenu("", 'Amunation', nil, nil, "foltone", "amu");
local item = RageUI.CreateSubMenu(MenuAmunation, "Item", "Item")
local armeblanche = RageUI.CreateSubMenu(MenuAmunation, "Armes blanches", "Armes blanches")
local arme = RageUI.CreateSubMenu(MenuAmunation, "Armes", "Armes")


local MenuLtd = RageUI.CreateMenu("", 'LTD', nil, nil, "foltone", "ltd");
local Menu24 = RageUI.CreateMenu("", '24/7', nil, nil, "foltone", "24-7");

local MenuPharmacie = RageUI.CreateMenu("", 'Pharmacie', nil, nil, "foltone", "pharmacie");

local ListIndex = 1;
local ListPay = {
    "Liquide",
    "Banque",
}

local Trigger = 'foltone:achatliquide'
local Trigger2 = 'foltone:achatliquide2'

function RageUI.PoolMenus:Example()

    ------------ Amunation ------------
	MenuAmunation:IsVisible(function(Items)
        Items:AddList("Mode de paiement", ListPay, ListIndex, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
			if (onListChange) then
				ListIndex = Index;
			end
            if (Index) == 1 then
                Trigger = 'foltone:achatliquide'
                Trigger = 'foltone:achatliquide2'
            end
            if (Index) == 2 then
                Trigger = 'foltone:achatbanque'
                Trigger = 'foltone:achatbanque2'
            end
		end)
        Items:AddButton("Item", nil, { IsDisabled = false }, function(onSelected)
        end, item)
        Items:AddButton("Armes blanches", nil, { IsDisabled = false }, function(onSelected)
        end, armeblanche)
        ESX.TriggerServerCallback('foltone:checkppa', function(cb)            
            if cb then
                ppa = true 
            else 
                ppa = false   
            end
        end)
        if ppa then
            Items:AddButton("Armes", nil, { IsDisabled = false }, function(onSelected)
            end, arme)
        else
            Items:AddButton("Armes", "vous devez posséder un permis", { IsDisabled = true }, function(onSelected)
            end, arme)
        end
	end, function(Panels)
	end)
    item:IsVisible(function(Items)
        for k, v in pairs(FoltoneAmunation.ItemsList) do
            Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                if (onSelected) then
                    TriggerServerEvent(Trigger, v)
                end
            end)
        end
    end, function()
    end)
    armeblanche:IsVisible(function(Items)
        for k, v in pairs(FoltoneAmunation.ArmesBlancheList) do
            Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                if (onSelected) then
                    TriggerServerEvent(Trigger, v)
                end
            end)
        end
    end, function()
    end)
    arme:IsVisible(function(Items)
        for k, v in pairs(FoltoneAmunation.ArmesList) do
            Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                if (onSelected) then
                    TriggerServerEvent(Trigger, v)
                end
            end)
        end
    end, function()
    end)
    
    ------------ Superette ------------
    if ActiveSuperette == true then
        MenuLtd:IsVisible(function(Items)
            Items:AddList("Mode de paiement", ListPay, ListIndex, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
                if (onListChange) then
                    ListIndex = Index;
                end
                if (Index) == 1 then
                    Trigger = 'foltone:achatliquide'
                end
                if (Index) == 2 then
                    Trigger = 'foltone:achatbanque'
                end
            end)
            for k, v in pairs(FoltoneSuperette.ItemsList) do
                Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                    if (onSelected) then
                        TriggerServerEvent(Trigger, v)
                    end
                end)
            end
        end, function(Panels)
        end)
        Menu24:IsVisible(function(Items)
            Items:AddList("Mode de paiement", ListPay, ListIndex, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
                if (onListChange) then
                    ListIndex = Index;
                end
                if (Index) == 1 then
                    Trigger = 'foltone:achatliquide'
                end
                if (Index) == 2 then
                    Trigger = 'foltone:achatbanque'
                end
            end)
            for k, v in pairs(FoltoneSuperette.ItemsList) do
                Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                    if (onSelected) then
                        TriggerServerEvent(Trigger, v)
                    end
                end)
            end
        end, function(Panels)
        end)
    end

    ------------ Pharmacie ------------
    if ActivePharmacie == true then
        MenuPharmacie:IsVisible(function(Items)
            Items:AddList("Mode de paiement", ListPay, ListIndex, nil, { IsDisabled = false }, function(Index, onSelected, onListChange)
                if (onListChange) then
                    ListIndex = Index;
                end
                if (Index) == 1 then
                    Trigger = 'foltone:achatliquide'
                end
                if (Index) == 2 then
                    Trigger = 'foltone:achatbanque'
                end
            end)
            for k, v in pairs(FoltonePharmacie.ItemsList) do
                Items:AddButton(v.Label, nil, {RightLabel = "~g~"..v.Price.."$", IsDisabled = false }, function(onSelected)
                    if (onSelected) then
                        TriggerServerEvent(Trigger, v)
                    end
                end)
            end
        end, function(Panels)
        end)
    end
end

Citizen.CreateThread(function()
	while true do
		local wait = 500
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(FoltoneAmunation.Position) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            if distance <= 2.0 then
				wait = 0
				ESX.ShowHelpNotification("Appuyer sur ~r~[E]~s~ pour parler à ~r~l'armurier", 1) 
                if IsControlJustPressed(1, 51) then
					RageUI.Visible(MenuAmunation, not RageUI.Visible(MenuAmunation))
                end
            elseif distance < 5 then
                RageUI.CloseAll()
            end
        end
        Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = 500
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(FoltoneSuperette.Pos24) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            if distance <= 2.0 then
				wait = 0
				ESX.ShowHelpNotification("Appuyer sur ~b~[E]~s~ pour parler à ~b~l'épicier", 1) 
                if IsControlJustPressed(1, 51) then
					RageUI.Visible(Menu24, not RageUI.Visible(Menu24))
                end
            elseif distance < 5 then
                RageUI.CloseAll()
            end
        end
        Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = 500
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(FoltoneSuperette.Posltd) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            if distance <= 2.0 then
				wait = 0
				ESX.ShowHelpNotification("Appuyer sur ~b~[E]~s~ pour parler à ~b~l'épicier", 1) 
                if IsControlJustPressed(1, 51) then
					RageUI.Visible(MenuLtd, not RageUI.Visible(MenuLtd))
                end
            elseif distance < 5 then
                RageUI.CloseAll()
            end
        end
        Citizen.Wait(wait)
	end
end)

Citizen.CreateThread(function()
	while true do
		local wait = 500
		local playerCoords = GetEntityCoords(PlayerPedId())
		for k, v in pairs(FoltonePharmacie.Position) do
			local distance = GetDistanceBetweenCoords(playerCoords, v.x, v.y, v.z, true)
            if distance <= 2.0 then
				wait = 0
				ESX.ShowHelpNotification("Appuyer sur ~b~[E]~s~ pour parler au ~b~pharmacien", 1) 
                if IsControlJustPressed(1, 51) then
					RageUI.Visible(MenuPharmacie, not RageUI.Visible(MenuPharmacie))
                end
            elseif distance < 5 then
                RageUI.CloseAll()
            end
        end
        Citizen.Wait(wait)
	end
end)