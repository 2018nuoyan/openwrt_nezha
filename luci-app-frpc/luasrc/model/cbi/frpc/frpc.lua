-- /usr/lib/lua/luci/model/cbi/frpc.lua
local fs = require "nixio.fs"
local sys = require "luci.sys"
local uci = require "luci.model.uci".cursor()

local m = Map("frpc", translate("帕斯内网穿透"), translate("诺言网络制作"))

-- 启动开关选项
local s = m:section(TypedSection, "frpc", translate("Settings"))
s.anonymous = true

local enabled = s:option(Flag, "enabled", translate("Enable"))
enabled.rmempty = false

-- 配置文件编辑框
local config = s:option(TextValue, "config", translate("Configuration"))
config.template = "cbi/tvalue"
config.rows = 20
config.wrap = "off"

function config.cfgvalue(self, section)
    return fs.readfile("/etc/config/frpc.toml") or ""
end

function config.write(self, section, value)
    fs.writefile("/etc/config/frpc.toml", value)
end

-- 显示当前版本信息
local version = s:option(DummyValue, "_version", translate("FRPC Version"))
version.rawhtml = true
version.cfgvalue = function()
    local v = sys.exec("/usr/bin/frpc -v 2>/dev/null") or translate("Unknown")
    return "<pre>" .. v .. "</pre>"
end

-- 显示运行状态
local running = s:option(DummyValue, "_status", translate("Running Status"))
running.template = "frpc/status"

return m
