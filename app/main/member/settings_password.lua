slot.set_layout("custom")
ui.container{ attr = { class = "row-fluid" }, content = function()
  ui.container{ attr = { class = "span12 well" }, content = function()
    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span12 text-center" }, content = function()
        ui.heading{ level = 1, attr = { class = "uppercase"  }, content = _"Auditor Panel".." ID:"..app.session.member_id }
        ui.heading{ level = 3, attr = { class = ""  }, content = _"Change password" }
        ui.tag{ tag = "small", content = _"(Password must be at least 32 characters long)" }
      end }
    end }
    ui.container{ attr = { class = "row-fluid text-center spaceline3" }, content = function()
      ui.form{
        attr = {},
        module = "member",
        action = "update_password",
        routing = {
          ok = {
            mode = "redirect",
            module = "index",
            view = "index"
          }
        },
        content = function()
          ui.field.password{ label = _"Old password", name = "old_password" }
          ui.field.password{ label = _"New password", name = "new_password1" }
          ui.field.password{ label = _"Repeat new password", name = "new_password2" }
            ui.tag{
              tag="button",
              attr = { type="submit", class="btn btn-primary btn-large spaceline2" },
              content= function()
                ui.heading{ level=4, attr = { class="inline-block"}, content= _"Change password"}
              end
            }
        end
      }
    end }
  end }
end }
