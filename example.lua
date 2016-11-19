os.loadAPI("jua")
os.loadAPI("r")
r.init(jua)

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