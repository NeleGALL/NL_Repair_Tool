----REPAIRCOMP CLASS
local repaircomp = Class(function(self, inst)
	self.inst = inst
	self.repair_value = 1
end)

----REPAIRCOMP REPAIR DO
function repaircomp:DoRepair(target, doer)
	if target.components.nlrepair then
		repaircomp:repairsome(self, target, doer, target.components.nlrepair.resource, target.components.nlrepair.value, target.components.nlrepair.errorstr)
	end
	return true
end

----SOME FUNCTION THAT FIX
function repaircomp:repairsome(self, target, doer, resource, value, errorstr)
	if doer.components.inventory:Has(resource, 1) then
		if target.components.finiteuses then
			local modvariable = target.components.finiteuses:GetPercent() + value
			if modvariable > 1 then
				modvariable = 1
			elseif math.random() < TUNING.NL_IFEELUCK then
				modvariable = 1
				doer.components.talker:Say(STRINGS.NL_REPAIRTOOL.FEELLUCK)
			end
			target.components.finiteuses:SetPercent(modvariable)
		elseif target.components.armor then
			local modvariable = target.components.armor:GetPercent() + value
			if modvariable > 1 then
				modvariable = 1
			elseif math.random() < TUNING.NL_IFEELUCK then
				modvariable = 1
				doer.components.talker:Say(STRINGS.NL_REPAIRTOOL.FEELLUCK)
			end
			target.components.armor:SetPercent(modvariable)
		else
			doer.components.talker:Say("Something went wrong... Tell to creator of this mod!!!")
		end
		if self.onsewn then
			self.onsewn(self.inst, target, doer)
		end
		doer.components.inventory:ConsumeByName(resource, 1)
	else
		doer.components.talker:Say(errorstr)
	end
end

function repaircomp:CollectUseActions(doer, target, actions, right)
	if target.components.nlrepair then
		table.insert(actions, ACTIONS.REPAIRCOMP)
	end
end

return repaircomp