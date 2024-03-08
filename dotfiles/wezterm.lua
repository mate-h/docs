local wezterm = require 'wezterm'
local act = wezterm.action

local scheme = wezterm.get_builtin_color_schemes()['OneDark (base16)']

local function cell_width_adjustment()
    local target_triple = wezterm.target_triple
    if target_triple:find("darwin") then
        return 0.9
    else
        return 0.8
    end
end


local fonts = {
    wezterm.font("SF Mono", { weight = "Light", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "Light", stretch = "Normal", style = "Italic" }),
    wezterm.font("SF Mono", { weight = "Regular", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "Regular", stretch = "Normal", style = "Italic" }),
    wezterm.font("SF Mono", { weight = "Medium", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "Medium", stretch = "Normal", style = "Italic" }),
    wezterm.font("SF Mono", { weight = "DemiBold", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "DemiBold", stretch = "Normal", style = "Italic" }),
    wezterm.font("SF Mono", { weight = "Bold", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "Bold", stretch = "Normal", style = "Italic" }),
    wezterm.font("SF Mono", { weight = "Black", stretch = "Normal", style = "Normal" }),
    wezterm.font("SF Mono", { weight = "Black", stretch = "Normal", style = "Italic" })
}

local selected_font = fonts[5]

return {
    color_schemes = {
        ['OneDark Custom'] = scheme
    },
    color_scheme = "OneDark Custom",
    window_padding = {
        left = 16,
        right = 16,
        top = 16,
        bottom = 0
    },
    window_frame = {
        font = selected_font,
        active_titlebar_bg = '#1f2227',
        inactive_titlebar_bg = '#1f2227'
    },
    colors = {
        background = '#24272d',
        tab_bar = {
            background = '#1f2227',
            active_tab = {
                bg_color = '#24272d',
                fg_color = 'white'
            },
            inactive_tab = {
                bg_color = '#1f2227',
                fg_color = '#7D7f81'
            },
            inactive_tab_hover = {
                bg_color = '#323842',
                fg_color = '#7D7f81'
            },
            new_tab = {
                bg_color = '#1f2227',
                fg_color = '#7D7f81'
            },
            new_tab_hover = {
                bg_color = '#323842',
                fg_color = '#7D7f81'
            }
        }
    },
    hide_tab_bar_if_only_one_tab = true,
    window_close_confirmation = "NeverPrompt",
    font_size = 13,
    underline_position = -2,
    cell_width = cell_width_adjustment(),
    font = selected_font,
    keys = { {
        key = 'K',
        mods = 'CMD',
        action = act.ClearScrollback 'ScrollbackAndViewport'
    }, {
        key = "d",
        mods = "CMD",
        action = wezterm.action {
            SplitHorizontal = {
                domain = "CurrentPaneDomain"
            }
        }
    }, {
        key = "d",
        mods = "CMD|SHIFT",
        action = wezterm.action {
            SplitVertical = {
                domain = "CurrentPaneDomain"
            }
        }
    }, {
        key = "w",
        mods = "CMD",
        action = wezterm.action {
            CloseCurrentPane = {
                confirm = false
            }
        }
    }, {
        key = "h",
        mods = "CMD",
        action = wezterm.action {
            ActivatePaneDirection = "Left"
        }
    }, {
        key = "l",
        mods = "CMD",
        action = wezterm.action {
            ActivatePaneDirection = "Right"
        }
    }, {
        key = "j",
        mods = "CMD",
        action = wezterm.action {
            ActivatePaneDirection = "Up"
        }
    }, {
        key = "k",
        mods = "CMD",
        action = wezterm.action {
            ActivatePaneDirection = "Down"
        }
    } }
}
