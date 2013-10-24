slot.put_into("title", _"Admin menu")


ui.tag{ tag = "ul", content = function()
  ui.tag{ tag= "li", content = function()
    ui.link{
      text = _"Members",
      module = "admin",
      view = "member_list",
    }
  end }
end }
