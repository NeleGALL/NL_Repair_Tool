 local assets=
{
	Asset("ANIM", "anim/repairtool.zip"),
	Asset("ATLAS", "images/inventoryimages/repairtool.xml"),
}

local function onfinished(inst)
	inst:Remove()
end

local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
    
    MakeInventoryPhysics(inst)

    anim:SetBank("lighter")
    anim:SetBuild("repairtool")
    anim:PlayAnimation("idle")
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/repairtool.xml"

    return inst
end

return Prefab( "common/inventory/repairtool", fn, assets) 