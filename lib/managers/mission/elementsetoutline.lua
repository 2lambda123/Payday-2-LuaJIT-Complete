core:import("CoreMissionScriptElement")

ElementSetOutline = ElementSetOutline or class(CoreMissionScriptElement.MissionScriptElement)

function ElementSetOutline:init(...)
	ElementSetOutline.super.init(self, ...)
end

function ElementSetOutline:client_on_executed(...)
end

function ElementSetOutline:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local function f(unit)
		if unit:contour() then
			if self._values.clear_previous then
				unit:contour():remove("highlight", true)
			end

			local c_type = self._values.outline_type or "highlight_character"

			if self._values.set_outline then
				unit:contour():add(c_type, true, nil, nil, true)
			else
				unit:contour():remove(c_type, true, true)
			end
		end
	end

	if self._values.use_instigator then
		f(instigator)
	else
		for _, id in ipairs(self._values.elements) do
			local element = self:get_mission_element(id)

			element:execute_on_all_units(f)
		end
	end

	ElementSetOutline.super.on_executed(self, instigator)
end
