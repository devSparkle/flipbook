local React = require("@pkg/React")
local Sprite = require("@root/Common/Sprite")
local assets = require("@root/assets")
local useTheme = require("@root/Common/useTheme")

local e = React.createElement

local function NoStorySelected(_props)
	local theme = useTheme()

	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
	}, {
		UIListLayout = e("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = theme.padding,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center,
		}),

		Icon = e(Sprite, {
			image = assets.Storybook,
			layoutOrder = 1,
			color = theme.text,
			size = UDim2.fromOffset(32, 32),
		}),

		Message = e("TextLabel", {
			AutomaticSize = Enum.AutomaticSize.XY,
			BackgroundTransparency = 1,
			Font = theme.font,
			LayoutOrder = 2,
			Size = UDim2.fromScale(0, 0),
			Text = "Select a story to preview it",
			TextColor3 = theme.text,
			TextSize = theme.headerTextSize,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Top,
		}),
	})
end

return NoStorySelected
