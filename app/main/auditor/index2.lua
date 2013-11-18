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

  end }
end }

ui.container{ attr = { class = "row-fluid spaceline2" }, content = function()
  ui.container{ attr = { class = "span12 well text-center"}, content = function()

    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span6 offset3"}, content = function()
        ui.heading{ level = 2, attr = { class = "uppercase"  }, content = _"Please choose one of the following:" }
      end }
    end }

    ui.container{ attr = { class = "row-fluid spaceline3" }, content = function()
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "auditor",
            view = "member_edit",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span4"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/print_new_user_modules_icon.svg"}
                end }
                ui.container{ attr = { class = "span7 offset1 table-cell"}, content = function()
                  ui.heading{level=4,attr={class="offset1 uppercase"},content=_"Certifica nuovo utente"}
                end }
              end }
            end
          }
        end }

      end }
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "auditor",
            view = "member_edit",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span7"}, content = function()
                  ui.heading{level=4,attr={class="uppercase"},content=_"Gestisci la lista dei tuoi utenti"}
                end }
                ui.container{ attr = { class = "span4 offset1"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/deactivate_account_icon.svg"}
                end }
              end }
            end
          }
        end }

      end }
    end }

    ui.container{ attr = { class = "row-fluid spaceline3" }, content = function()
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "member",
            view = "settings_password",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span4"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/password_icon.svg"}
                end }
                ui.container{ attr = { class = "span7 offset1"}, content = function()
                  ui.heading{level=4,attr={class="uppercase"},content=_"Cambia la password di certificatore"}
                end }
              end }
            end
          }
        end }

      end }
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "index",
            view = "logout",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span7"}, content = function()
                  ui.heading{level=4,attr={class="uppercase"},content=_"Esci dal pannello certificatore"}
                end }
                ui.container{ attr = { class = "span4 offset1"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/deactivate_account_icon.svg"}
                end }
              end }
            end
          }
        end }

      end }
    end }

    ui.container{ attr = { class = "row-fluid spaceline3" }, content = function()
      ui.container{ attr = { class = "span6 offset3"}, content = function()
        ui.heading{ level = 2, attr = { class = "uppercase"  }, content = _"Service functions:" }
      end }
    end }

    ui.container{ attr = { class = "row-fluid spaceline3" }, content = function()
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "member",
            view = "settings_password",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span4"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/print_new_user_modules_icon.svg"}
                end }
                ui.container{ attr = { class = "span7 offset1"}, content = function()
                  ui.heading{level=6,attr={class="uppercase"},content=_"Stampa moduli registrazione nuovo utente"}
                end }
              end }
            end
          }
        end }

      end }
      ui.container{ attr = { class = "span6 text-center"}, content = function()

        ui.container{ attr = { class  = "inline-block" , style = "" }, content = function()
          ui.link{
            attr = { class="btn btn-primary btn-large table-cell fixclick menu_btn"  },
            module = "index",
            view = "logout",
            content = function()
              ui.container{ attr = { class = "row-fluid" }, content = function()
                ui.container{ attr = { class = "span7"}, content = function()
                  ui.heading{level=6,attr={class="uppercase"},content=_"Stampa moduli registrazione nuovo certificatore"}
                end }
                ui.container{ attr = { class = "span4 offset1"}, content = function()
                  ui.image{attr={class="svg_icon"}, static = "svg/print_new_certificator_modules_icon.svg"}
                end }
              end }
            end
          }
        end }

      end }
    end }


  end }
end }

