--      ██████╗  █████╗ ████████╗████████╗███████╗██████╗ ██╗   ██╗
--      ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗╚██╗ ██╔╝
--      ██████╔╝███████║   ██║      ██║   █████╗  ██████╔╝ ╚████╔╝
--      ██╔══██╗██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗  ╚██╔╝
--      ██████╔╝██║  ██║   ██║      ██║   ███████╗██║  ██║   ██║
--      ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝

-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------


-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local clickable_container = require("widgets.clickable-container")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi

local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/icons/battery/"


-- ===================================================================
-- Widget Creation
-- ===================================================================


local widget = wibox.widget {
   {
      id = "icon",
      image = PATH_TO_ICONS .. "battery.svg",
      widget = wibox.widget.imagebox,
      resize = true
   },
   layout = wibox.layout.fixed.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(7), dpi(7), dpi(7), dpi(7)))
widget_button:buttons(
   gears.table.join(
      awful.button({}, 1, nil,
         function()
            awful.spawn(apps.power_manager)
         end
      )
   )
)
-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
local battery_popup = awful.tooltip({
   objects = {widget_button},
   mode = "outside",
   align = "left",
   referred_positions = {"right", "left", "top", "bottom"}
})

local function show_battery_warning()
   naughty.notify {
      icon = PATH_TO_ICONS .. "battery-alert.svg",
      icon_size = dpi(48),
      text = "Huston, we have a problem",
      title = "Battery is dying",
      timeout = 5,
      hover_timeout = 0.5,
      position = "top_right",
      bg = "#d32f2f",
      fg = "#EEE9EF",
      width = 248
   }
end

local last_battery_check = os.time()

watch('bash -c \'acpi -i | grep -E "^Battery 0: ([^%]+%.+)$|(.+remaining)$|(.+charged)$" --color=never\'', 4,
    function(widget, stdout)
        local status, charge_str = string.match(stdout, "%a+ %d: (%a+), (%d+)%%,.+")

        if status == "Charging" or status == "Full" then
            battery_icon_name = "battery-charging-100.svg"
        else
            battery_icon_name = "battery-50.svg"
        end

        -- widget:set_text(rounded_charge)
        -- widget.icon:set_image(PATH_TO_ICONS .. battery_icon_name .. ".svg")
        widget.image = gears.surface.load_uncached(PATH_TO_ICONS .. battery_icon_name)
        -- widget:redraw_needed()
        -- Update popup text
        battery_popup.text = status .. ", " .. charge_str .. "%"
        --collectgarbage("collect")
    end,
   widget
)

return widget_button
