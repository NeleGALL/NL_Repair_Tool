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
	inst.entity:AddAnimState()
    
    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("nightmaresword")
    --inst.AnimState:SetBuild("magnifyin")
    inst.AnimState:PlayAnimation("idle")
    inst:AddComponent("inspectable")
    
    inst:AddComponent("inventoryitem")
    inst.components.inventoryitem.atlasname = "images/inventoryimages/repairtool.xml"

    return inst
end

return Prefab( "common/inventory/repairtool", fn, assets) 