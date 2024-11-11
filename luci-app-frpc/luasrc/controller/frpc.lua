-- /usr/lib/lua/luci/controller/frpc.lua
module("luci.controller.frpc", package.seeall)

function index()
    entry({"admin", "services", "frpc"}, cbi("frpc/frpc"), _("帕斯内网穿透"), 20).dependent = true
    entry({"admin", "services", "frpc", "status"}, call("action_status")).leaf = true
end

function action_toggle_enable(enable)
    if enable then
        luci.sys.call("/etc/init.d/frpc start")
    else
        luci.sys.call("/etc/init.d/frpc stop")
    end
end


function action_status()
    -- 使用准确的命令来检测 frpc 的运行状态
    local running = (luci.sys.call("pgrep -f '/usr/bin/frpc' > /dev/null") == 0)
    luci.http.prepare_content("application/json")
    luci.http.write_json({ status = { running = running } })
end

