
module("luci.controller.unblockmusic", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/unblockmusic") then
		return
	end

	entry({"admin", "services", "unblockmusic"},firstchild(), _("解锁网易云灰色歌曲"), 50).dependent = false
	
	entry({"admin", "services", "unblockmusic", "general"},cbi("unblockmusic"), _("Base Setting"), 1)
	entry({"admin", "services", "unblockmusic", "log"},form("unblockmusiclog"), _("Log"), 2)
  
	entry({"admin", "services", "unblockmusic", "status"},call("act_status")).leaf=true
end

function act_status()
  local e={}
<<<<<<< HEAD:package/lean/luci-app-unblockmusic/app/luasrc/controller/unblockmusic.lua
  e.running=luci.sys.call("ps | grep UnblockNeteaseMusic/app.js | grep -v grep >/dev/null")==0
=======
  e.running=luci.sys.call("busybox ps -w | grep app.js | grep -v grep >/dev/null")==0
>>>>>>> 6d7336e59eef1b1f1732324050566635c1bf8895:package/lean/luci-app-unblockmusic/luasrc/controller/unblockmusic.lua
  luci.http.prepare_content("application/json")
  luci.http.write_json(e)
end
