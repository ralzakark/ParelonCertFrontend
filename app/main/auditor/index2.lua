slot.set_layout("custom")
local member_data = MemberData:by_id(app.session.member_id)
ui.container{ attr = { class = "row-fluid" }, content = function()
  ui.container{ attr = { class = "span12 well" }, content = function()
    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span3 text-right" }, content = function()
        execute.view{
          module = "member_image",
          view = "_show",
          params = {
            member = app.session.member,
            image_type = "avatar",
            show_dummy = true,
            class = "avatar",
          }
        }
      end }
      ui.container{ attr = { class = "span6 text-center" }, content = function()
        ui.heading{ level = 1, attr = { class = "uppercase"  }, content = _"Auditor Panel" }
        ui.heading{ level = 3, attr = { class = "spaceline2"  }, content =function()
          slot.put(_("Welcome <strong>#{firstname} #{lastname}</strong>, your ID is <strong>C#{id}</strong>",{firstname=member_data.firstname, lastname=member_data.lastname, id=app.session.member_id}))
        end } 
      end }
    end }

    --[
    ui.container{ attr = { class = "row-fluid text-center spaceline3" }, content = function()

      ui.container{ attr = { class  = "inline-block", style = "margin: 5px;" }, content = function()
        ui.link{
          attr = { class="btn btn-primary btn-large table-cell"  },
          module = "auditor",
          view = "download",
          content = function()
            ui.heading{level=5,attr={class=""},content=_"Download Data"}
          end
        }
      end }
      ui.container{ attr = { class  = "inline-block" , style = "margin: 5px;" }, content = function()
        ui.link{
          attr = { class="btn btn-primary btn-large table-cell fixclick"  },
          module = "auditor",
          view = "member_edit",
          content = function()
            ui.heading{level=5,attr={class=""},content=_"Nuovo utente"}
          end
        }
      end }
      ui.container{ attr = { class  = "inline-block" , style = "margin: 5px;" }, content = function()
        ui.link{
          attr = { class="btn btn-primary btn-large table-cell fixclick"  },
          module = "member",
          view = "settings_password",
          content = function()
            ui.heading{level=5,attr={class=""},content=_"Change password"}
          end
        }
      end }
      ui.container{ attr = { class  = "inline-block" , style = "margin: 5px;" }, content = function()
        ui.link{
          attr = { class="btn btn-primary btn-large table-cell fixclick"  },
          module = "index",
          action = "logout",
          content = function()
            ui.heading{level=5,attr={class=""},content=_"Logout"}
          end
        }
      end }

    end }

    --]]

  end }
end }

ui.container{ attr = { class = "row-fluid spaceline2" }, content = function()
  ui.container{ attr = { class = "span12 well text-center"}, content = function()

    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span6 offset3"}, content = function()
        ui.heading{ level = 2, attr = { class = "uppercase"  }, content = _"Please choose one of the following:" }
      end }
    end }

    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span12"}, content = function()
        ui.container{ attr = { class  = "inline-block" , style = "margin: 5px;" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick"  },
            module = "auditor",
            view = "member_edit",
            content = function()
              ui.image{static = "svg/print_new_user_modules_icon.svg"}
              ui.heading{level=5,attr={class=""},content=_"Nuovo utente"}
            end
          }
        end }
      end }
    end }

    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span6 offset3"}, content = function()
        ui.heading{ level = 2, attr = { class = "uppercase"  }, content = _"Service functions:" }
      end }
    end }


  end }
end }

