---------------------------------------------------
------------------REPAIR TOOLS---------------------
------------------BY  NeleGALL---------------------
---------------------------------------------------
------------------MODIFICATION---------------------
--------------------09.11.13-----------------------
---------------------------------------------------
---------------------VERSION-----------------------
-----------------------0.3-------------------------
---------------------------------------------------

----GLOBALS AND MAIN INIT
ACTIONS = GLOBAL.ACTIONS
STRINGS = GLOBAL.STRINGS
PrefabFiles = { "repairtool", }
local temprecipe0 = GLOBAL.Recipe( "repairtool", { GLOBAL.Ingredient("goldnugget", 2), GLOBAL.Ingredient("twigs", 2), GLOBAL.Ingredient("rope", 1) }, GLOBAL.RECIPETABS.TOOLS, {})
temprecipe0.atlas = "images/inventoryimages/repairtool.xml"

----TUNING
TUNING.NL_REPAIR_VALUE = 1 --repair modificator
TUNING.NL_IFEELUCK = 0.02 --feel luck value

----STRINGS
STRINGS.NL_REPAIRTOOL = {}
STRINGS.NL_REPAIRTOOL.NEEDGOLD = "I have no gold to fix it"
STRINGS.NL_REPAIRTOOL.NEEDFLINT = "I need a flint to fix it"
STRINGS.NL_REPAIRTOOL.NEEDREDGEM = "Red gem missing"
STRINGS.NL_REPAIRTOOL.NEEDBLUEGEM = "I need a blue gem"
STRINGS.NL_REPAIRTOOL.NEEDPURPLEGEM = "I need some special purple gem"
STRINGS.NL_REPAIRTOOL.NEEDYELLOWGEM = "Yellow gem is missing"
STRINGS.NL_REPAIRTOOL.NEEDGREENGEM = "Where is my green precious?"
STRINGS.NL_REPAIRTOOL.NEEDNIGHTMAREFUEL = "Am I mad? I need nightmare fuel!"
STRINGS.NL_REPAIRTOOL.NEEDMANRABBITFUR = "Bunnyman... I need your fur!"
STRINGS.NL_REPAIRTOOL.NEEDSILK = "I need silk thread to fix it"
STRINGS.NL_REPAIRTOOL.NEEDWOOD = "Wooden log needed"
STRINGS.NL_REPAIRTOOL.NEEDMARBLE = "I NEED MARBLE!"
STRINGS.NL_REPAIRTOOL.NEEDPIGSKIN = "Pig... I need your skin!"
STRINGS.NL_REPAIRTOOL.NEEDBEEFALOWOOL = "Shave some beefalo"
STRINGS.NL_REPAIRTOOL.NEEDBEEFALOHORN = "Kill some beefalo for their horn"
STRINGS.NL_REPAIRTOOL.NEEDTRUNK = "Koalefant must be killed"
STRINGS.NL_REPAIRTOOL.NEEDWINTERTRUNK = "Koalefant. Winter version. I need trunk."
STRINGS.NL_REPAIRTOOL.NEEDHOUNDS = "Hound's teeth needed"
STRINGS.NL_REPAIRTOOL.NEEDSLURPER = "I must kill some slurpers"
STRINGS.NL_REPAIRTOOL.NEEDTHULECITE = "I need... eh... Some thulecite"
STRINGS.NL_REPAIRTOOL.FEELLUCK = "Good work!"

STRINGS.NAMES.REPAIRTOOL = "Repair tool"
STRINGS.RECIPE_DESC.REPAIRTOOL = "Some stuff to fix other stuff."
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REPAIRTOOL = {}
STRINGS.CHARACTERS.GENERIC.DESCRIBE.REPAIRTOOL.GENERIC = "I can fix some things."
STRINGS.CHARACTERS.WX78.DESCRIBE.REPAIRTOOL = "REPAIR TOOL"
STRINGS.CHARACTERS.WILLOW.DESCRIBE.REPAIRTOOL = "Some stuff"
STRINGS.CHARACTERS.WICKERBOTTOM.DESCRIBE.REPAIRTOOL = "I can fix anything!!!"
STRINGS.CHARACTERS.WOLFGANG.DESCRIBE.REPAIRTOOL = "Something missing"
STRINGS.CHARACTERS.WENDY.DESCRIBE.REPAIRTOOL = "With this I am the one who survive."

----REPAIR ACTION
local REPAIRCOMP = GLOBAL.Action()
REPAIRCOMP.str = "Repair"
REPAIRCOMP.id = "REPAIRCOMP"
REPAIRCOMP.fn = function(act)
	if act.target.components.nlrepair then
		return act.invobject.components.repaircomp:DoRepair(act.target, act.doer)
	end
end
AddAction(REPAIRCOMP)
AddStategraphActionHandler("wilson", GLOBAL.ActionHandler(REPAIRCOMP, "dolongaction"))

----POSTINIT
local function nl_repairtool(inst)
    inst:AddComponent("repaircomp")
	inst.components.repaircomp.repair_value = TUNING.NL_REPAIR_VALUE
end
AddPrefabPostInit("repairtool", nl_repairtool)

local function nl_repairvalue(inst, value, resource, errorstr)
	inst:AddComponent("nlrepair")
	inst.components.nlrepair.value = value * TUNING.NL_REPAIR_VALUE
	inst.components.nlrepair.resource = resource
	inst.components.nlrepair.errorstr = errorstr
end

local function nl_prefabload(name, value, resource, errorstr)
	AddPrefabPostInit(name, function(inst)
		inst:AddComponent("nlrepair")
		inst.components.nlrepair.value = value * TUNING.NL_REPAIR_VALUE
		inst.components.nlrepair.resource = resource
		inst.components.nlrepair.errorstr = errorstr
	end)
end
----GOLD REPAIR
nl_prefabload("goldenaxe",		0.5,	"goldnugget",		STRINGS.NL_REPAIRTOOL.NEEDGOLD)
nl_prefabload("goldenpickaxe",	0.5,	"goldnugget",		STRINGS.NL_REPAIRTOOL.NEEDGOLD)
nl_prefabload("goldenshovel",	0.5,	"goldnugget",		STRINGS.NL_REPAIRTOOL.NEEDGOLD)
----FLINT REPAIR
nl_prefabload("axe",			0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
nl_prefabload("pickaxe",		0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
nl_prefabload("shovel",			0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
nl_prefabload("pitchfork",		0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
nl_prefabload("hammer",			0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
nl_prefabload("spear",			0.5,	"flint",			STRINGS.NL_REPAIRTOOL.NEEDFLINT)
----RED GEM
nl_prefabload("amulet",			0.5,	"redgem",			STRINGS.NL_REPAIRTOOL.NEEDREDGEM)
nl_prefabload("firestaff",		0.5,	"redgem",			STRINGS.NL_REPAIRTOOL.NEEDREDGEM)
----BLUE GEM
nl_prefabload("blueamulet",		0.5,	"bluegem",			STRINGS.NL_REPAIRTOOL.NEEDBLUEGEM)
nl_prefabload("icestaff",		0.5,	"bluegem",			STRINGS.NL_REPAIRTOOL.NEEDBLUEGEM)
----PURPLE GEM
nl_prefabload("batbat",			0.5,	"purplegem",		STRINGS.NL_REPAIRTOOL.NEEDPURPLEGEM)
nl_prefabload("telestaff",		0.5,	"purplegem",		STRINGS.NL_REPAIRTOOL.NEEDPURPLEGEM)
nl_prefabload("purpleamulet",	0.5,	"purplegem",		STRINGS.NL_REPAIRTOOL.NEEDPURPLEGEM)
----YELLOW GEM
nl_prefabload("yellowstaff",	0.5,	"yellowgem",		STRINGS.NL_REPAIRTOOL.NEEDYELLOWGEM)
----GREEN GEM
nl_prefabload("greenstaff",		0.5,	"greengem",			STRINGS.NL_REPAIRTOOL.NEEDGREENGEM)
----NIGHTMARE FUEL
nl_prefabload("nightsword",		0.20,	"nightmarefuel",	STRINGS.NL_REPAIRTOOL.NEEDNIGHTMAREFUEL)
nl_prefabload("armor_sanity",	0.2,	"nightmarefuel",	STRINGS.NL_REPAIRTOOL.NEEDNIGHTMAREFUEL)
nl_prefabload("onemanband",		0.25,	"nightmarefuel",	STRINGS.NL_REPAIRTOOL.NEEDNIGHTMAREFUEL)
----FUR
nl_prefabload("bedroll_furry",	0.66,	"manrabbit_tail",	STRINGS.NL_REPAIRTOOL.NEEDMANRABBITFUR)
----SILK
nl_prefabload("bugnet",			0.5,	"silk",				STRINGS.NL_REPAIRTOOL.NEEDSILK)
nl_prefabload("fishingrod",		0.5,	"silk",				STRINGS.NL_REPAIRTOOL.NEEDSILK)
nl_prefabload("tophat",			0.20,	"silk",				STRINGS.NL_REPAIRTOOL.NEEDSILK)
nl_prefabload("beehat",			0.13,	"silk",				STRINGS.NL_REPAIRTOOL.NEEDSILK)
----WOOD
nl_prefabload("armorwood",		0.13,	"log",				STRINGS.NL_REPAIRTOOL.NEEDWOOD)
----MARBLE
nl_prefabload("armormarble",	0.1,	"marble",			STRINGS.NL_REPAIRTOOL.NEEDMARBLE)
----PIG SKIN
nl_prefabload("footballhat",	0.66,	"pigskin",			STRINGS.NL_REPAIRTOOL.NEEDPIGSKIN)
----BEEFALO WOOL
nl_prefabload("winterhat",		0.25,	"beefalowool",		STRINGS.NL_REPAIRTOOL.NEEDBEEFALOWOOL)
----BEEFALO HORN
nl_prefabload("beefalohat",		0.66,	"horn",				STRINGS.NL_REPAIRTOOL.NEEDBEEFALOHORN)
----KOALEFANT TRUNK
nl_prefabload("trunkvest_summer",0.25,	"trunk_summer",		STRINGS.NL_REPAIRTOOL.NEEDTRUNK)
----WINTER KOALEFANT TRUNK
nl_prefabload("trunkvest_winter",0.25,	"trunk_winter",		STRINGS.NL_REPAIRTOOL.NEEDWINTERTRUNK)
----HOUNDS TOOTH
nl_prefabload("sweatervest",	0.13,	"houndstooth",		STRINGS.NL_REPAIRTOOL.NEEDHOUNDS)
----SLURPER PELT
nl_prefabload("armor_slurper",	0.2,	"slurper_pelt",		STRINGS.NL_REPAIRTOOL.NEEDSLURPER)
----THULECITE POSTINIT
nl_prefabload("multitool_axe_pickaxe",0.6,"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("yellowamulet",	0.6,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("greenamulet",	0.6,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("orangeamulet",	0.6,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("ruinshat",		0.2,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("armorruins",		0.2,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)
nl_prefabload("ruins_bat",		0.3,	"thulecite",		STRINGS.NL_REPAIRTOOL.NEEDTHULECITE)