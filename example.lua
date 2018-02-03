local jua
local r

if require then
  jua = require("jua")
  r = require("r")
else
  os.loadAPI("jua")
  jua = _G.jua
  os.loadAPI("r")
  r = _G.r
end

r.init(jua)

jua.on("terminate", function()
  print("Terminated")
  jua.stop()
end)

jua.on("mouse_click", function(event, button, x, y)
  print("Mouse Click at X: "..x.." Y: "..y)
end)

jua.setInterval(function()
  r.request(function(success, url, handle)
    print("Request Completed: "..tostring(success).." "..url)
    if success then
      print(handle.readAll())
      handle.close()
    end
  end, "http://time.lemmmy.pw/")
end, 1)

jua.run()
