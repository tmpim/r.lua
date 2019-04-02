local jua = require("jua")
local r = require("r")

r.init(jua)

jua.on("terminate", function()
  print("Terminated")
  jua.stop()
end)

jua.on("mouse_click", function(event, button, x, y)
  print("Mouse Click at X: "..x.." Y: "..y)
end)

jua.onInterval(1, function()
  r.request(function(success, url, handle)
    print("Request Completed: "..tostring(success).." "..url)
    if success then
      print(handle.readAll())
      handle.close()
    end
  end, "http://time.lemmmy.pw/")
end)

jua.run()