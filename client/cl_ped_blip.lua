Citizen.CreateThread(function()
    DecorRegister("Yay", 4)
    PedSuperette = nil
    function LoadModel(model)
		while not HasModelLoaded(model) do
			RequestModel(model)
			Wait(500)
		end
	end
	for k, v in pairs(FoltoneSuperette.Posltd) do
        --ped
        LoadModel("mp_m_shopkeep_01")
        PedSuperette = CreatePed(2, GetHashKey("mp_m_shopkeep_01"), v.x, v.y, v.z, v.h, 0, 0)
        DecorSetInt(PedSuperette, "Yay", 5431)
        FreezeEntityPosition(PedSuperette, 1)
        TaskStartScenarioInPlace(PedSuperette, "WORLD_HUMAN_CLIPBOARD", 0, false)
        SetEntityInvincible(PedSuperette, true)
        SetBlockingOfNonTemporaryEvents(PedSuperette, 1)
	
        --blip
		local BlipSuperette = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(BlipSuperette, 52)
		SetBlipScale (BlipSuperette, 0.8)
		SetBlipColour(BlipSuperette, 2)
		SetBlipAsShortRange(BlipSuperette, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Superette')
		EndTextCommandSetBlipName(BlipSuperette)
	end
    for k, v in pairs(FoltoneSuperette.Pos24) do
        --ped
        LoadModel("mp_m_shopkeep_01")
        PedSuperette = CreatePed(2, GetHashKey("mp_m_shopkeep_01"), v.x, v.y, v.z, v.h, 0, 0)
        DecorSetInt(PedSuperette, "Yay", 5431)
        FreezeEntityPosition(PedSuperette, 1)
        TaskStartScenarioInPlace(PedSuperette, "WORLD_HUMAN_CLIPBOARD", 0, false)
        SetEntityInvincible(PedSuperette, true)
        SetBlockingOfNonTemporaryEvents(PedSuperette, 1)
	
        --blip
		local BlipSuperette = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(BlipSuperette, 52)
		SetBlipScale (BlipSuperette, 0.8)
		SetBlipColour(BlipSuperette, 2)
		SetBlipAsShortRange(BlipSuperette, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Superette')
		EndTextCommandSetBlipName(BlipSuperette)
	end
end)


Citizen.CreateThread(function()
    DecorRegister("Yay", 4)
    PedAmunation = nil
    function LoadModel(model)
		while not HasModelLoaded(model) do
			RequestModel(model)
			Wait(500)
		end
	end
	for k, v in pairs(FoltoneAmunation.Position) do
        --ped
        LoadModel("cs_josef")
        PedAmunation = CreatePed(2, GetHashKey("cs_josef"), v.x, v.y, v.z, v.h, 0, 0)
        DecorSetInt(PedAmunation, "Yay", 5431)
        FreezeEntityPosition(PedAmunation, 1)
        TaskStartScenarioInPlace(PedAmunation, "WORLD_HUMAN_CLIPBOARD", 0, false)
        SetEntityInvincible(PedAmunation, true)
        SetBlockingOfNonTemporaryEvents(PedAmunation, 1)
	
        --blip
		local BlipAmunation = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(BlipAmunation, 110)
		SetBlipScale (BlipAmunation, 0.75)
		SetBlipColour(BlipAmunation, 1)
		SetBlipAsShortRange(BlipAmunation, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Amunation')
		EndTextCommandSetBlipName(BlipAmunation)
	end
end)

Citizen.CreateThread(function()
    DecorRegister("Yay", 4)
    PedPharmacie = nil
    function LoadModel(model)
		while not HasModelLoaded(model) do
			RequestModel(model)
			Wait(500)
		end
	end
	for k, v in pairs(FoltonePharmacie.Position) do
        --ped
        LoadModel("s_m_m_doctor_01")
        PedPharmacie = CreatePed(2, GetHashKey("s_m_m_doctor_01"), v.x, v.y, v.z, v.h, 0, 0)
        DecorSetInt(PedPharmacie, "Yay", 5431)
        FreezeEntityPosition(PedPharmacie, 1)
        TaskStartScenarioInPlace(PedPharmacie, "WORLD_HUMAN_CLIPBOARD", 0, false)
        SetEntityInvincible(PedPharmacie, true)
        SetBlockingOfNonTemporaryEvents(PedPharmacie, 1)
	
        --blip
		local BlipPharmacie = AddBlipForCoord(v.x, v.y, v.z)
		SetBlipSprite(BlipPharmacie, 51)
		SetBlipScale (BlipPharmacie, 0.75)
		SetBlipColour(BlipPharmacie, 3)
		SetBlipAsShortRange(BlipPharmacie, true)
		BeginTextCommandSetBlipName('STRING')
		AddTextComponentSubstringPlayerName('Pharmacie')
		EndTextCommandSetBlipName(BlipPharmacie)
	end
end)