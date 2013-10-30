slot.set_layout("custom")
ui.container{ attr = { class = "row-fluid" }, content = function()
  ui.container{ attr = { class = "span12 well text-center" }, content = function()

  execute.view{ module = "index", view = "_lang_chooser" }
  
  local step = param.get("step", atom.integer)
  local code = param.get("code")
  local notify_email = param.get("notify_email")
  local login = param.get("login")
  
  ui.form{
    attr = { class = "vertical" },
    module = 'index',
    action = 'register',
    params = {
      code = code,
      notify_email = notify_email,
      login = login
    },
    content = function()
  
      if not code then
        ui.title(_"Registration (step 1 of 3: Invite code)")
        ui.actions(function()
          ui.link{
            content = function()
                slot.put(_"Cancel registration")
            end,
            module = "index",
            view = "index"
          }
        end)
        ui.field.hidden{ name = "step", value = 1 }
        ui.heading{ level=2, attr={class="uppercase"}, content = _"Please enter the invite code you've received." }
        ui.field.text{
          label_attr={class="inline-block spaceline2"},
          label = _'Invite code',
          name  = 'code',
          value = param.get("invite")
        }
        ui.tag{
          tag="button",
          attr = { type="submit", class="btn btn-primary btn-large fixclick spaceline2" },
          content= function()
            ui.heading{ level=4, attr = { class="inline-block"}, content= _"Proceed with registration" }
          end
        }
  
      else
        local member = Member:new_selector()
          :add_where{ "invite_code = ?", code }
          :add_where{ "activated ISNULL" }
          :optional_object_mode()
          :exec()
  
        if not member.notify_email and not notify_email or not member.login and not login or step == 1 then
          ui.title(_"Registration (step 2 of 3: Personal information)")
          ui.field.hidden{ name = "step", value = 2 }
          ui.actions(function()
            ui.link{
              content = function()
                  slot.put(_"One step back")
              end,
              module = "index",
              view = "register",
              params = {
                invite = code
              }
            }
            slot.put(" &middot; ")
            ui.link{
              content = function()
                  slot.put(_"Cancel registration")
              end,
              module = "index",
              view = "index"
            }
          end)
  
          if not config.locked_profile_fields.notify_email then
            ui.container{ attr = { class = "row-fluid" }, content = function()
              ui.container{ attr = { class = "span8 offset2 text-center" }, content = function()
                ui.heading{level=2, content=_'Benvenuto '..member.realname  }
                ui.tag{tag="small", content="Conferma i tuoi dati per effettuare la registrazione" }
              end }
            end }
            ui.container{ attr = { class = "row-fluid spaceline" }, content = function()
              ui.container{ attr = { class = "span8 offset2 text-center" }, content = function()
                ui.heading{level=2, content=_'Email address' }
                ui.tag{
                  tag = "small",
                  content = _"Please enter your email address. This address will be used for automatic notifications (if you request them) and in case you've lost your password. This address will not be published. After registration you will receive an email with a confirmation link."
                }
                ui.field.text{
                  label_attr={class="inline-block spaceline2"},
                  attr={class="auditor_input",placeholder=_"Email address"},
                  label     = _'Email address',
                  name      = 'notify_email',
                  value     = param.get("notify_email") or member.notify_email
                }
              end }
            end }
          end
         
          if not config.locked_profile_fields.login then
            ui.container{ attr = { class = "row-fluid spaceline2" }, content = function()
              ui.container{ attr = { class = "span8 offset2 text-center" }, content = function()
                ui.heading{level=2, content=_'Login name' }
                ui.tag{
                  tag = "small",
                  content =  _"Please choose a login name. This name will not be shown to others and is used only by you to login into the system. The login name is case sensitive."
                }
                ui.field.text{
                  label_attr={class="inline-block spaceline2"},
                  attr={class="auditor_input",placeholder=_"Login name"},
                  label     = _'Login name',
                  name      = 'login',
                  value     = param.get("login") or member.login
                }
              end }
            end }
          end
          ui.tag{
            tag="button",
            attr = { type="submit", class="btn btn-primary btn-large fixclick spaceline2" },
            content= function()
              ui.heading{ level=4, attr = { class="inline-block"}, content= _"Proceed with registration" }
            end
          }
        else
  
          ui.field.hidden{ name = "step", value = "3" }
          ui.title(_"Registration (step 3 of 3: Terms of use and password)")
          ui.actions(function()
            ui.link{
              content = function()
                  slot.put(_"One step back")
              end,
              module = "index",
              view = "register",
              params = {
                code = code,
                notify_email = notify_email,
                name = name,
                login = login, 
                step = 1
              }
            }
            slot.put(" &middot; ")
            ui.link{
              content = function()
                  slot.put(_"Cancel registration")
              end,
              module = "index",
              view = "index"
            }
          end)
          
          for i, checkbox in ipairs(config.use_terms_checkboxes) do
            slot.put("<br />")
            ui.tag{
              tag = "div",
              content = function()
                ui.tag{
                  tag = "label",
                  attr = { ['for'] = "use_terms_checkbox_" .. checkbox.name, class="inline-block" },
                  content = function() slot.put(checkbox.html) end
                }
                slot.put("&nbsp;")
                ui.tag{
                  tag = "input",
                  attr = {
                    type = "checkbox",
                    id = "use_terms_checkbox_" .. checkbox.name,
                    name = "use_terms_checkbox_" .. checkbox.name,
                    value = "1",
                    checked = param.get("use_terms_checkbox_" .. checkbox.name, atom.boolean) and "checked" or nil
                  }
                }
              end
            }
          end
  
          slot.put("<br />")
  
          ui.tag{
            tag = "p",
            content = _"Please choose a password and enter it twice. The password is case sensitive."
          }
          ui.field.password{
            label_attr={class="auditor_input_label spaceline2"},
            attr={class="auditor_input"},
            label     = _'Password',
            name      = 'password1',
          }
          ui.field.password{
            label_attr={class="auditor_input_label spaceline2"},
            attr={class="auditor_input"},
            label     = _'Password (repeat)',
            name      = 'password2',
          }
          ui.tag{
            tag="button",
            attr = { type="submit", class="btn btn-primary btn-large fixclick spaceline2" },
            content= function()
              ui.heading{ level=4, attr = { class="inline-block"}, content= _"Activate account" }
            end
          }
        end
      end
    end
    }


  end }
end }
