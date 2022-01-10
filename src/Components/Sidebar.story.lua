local Roact = require(script.Parent.Parent.Packages.Roact)
local RoactHooks = require(script.Parent.Parent.Packages.RoactHooks)
local styles = require(script.Parent.Parent.styles)

local Sidebar = require(script.Parent.Sidebar)

local function Story(_props, hooks)
	local isExpanded, set = hooks.useState(true)

	local toggle = hooks.useCallback(function()
		set(function(prev)
			return not prev
		end)
	end, {})

	return Roact.createFragment({
		Padding = Roact.createElement("UIPadding", {
			PaddingTop = styles.LARGE_PADDING,
			PaddingRight = styles.LARGE_PADDING,
			PaddingBottom = styles.LARGE_PADDING,
			PaddingLeft = styles.LARGE_PADDING,
		}),

		Sidebar = Roact.createElement(Sidebar, {
			storybooks = {
				require(script.Parent.Parent["init.storybook"]),
			},
			width = NumberRange.new(24, 250),
			selectStory = print,
			isExpanded = isExpanded,
			onToggleActivated = toggle,
		}),
	})
end

Story = RoactHooks.new(Roact)(Story)

return {
	summary = "The sidebar that displays all the available stories for the current Storybook",
	roact = Roact,
	story = Roact.createElement(Story),
}
