slot.set_layout("custom")
local id = param.get_id()
local member = Member:by_id(id)
local member_data = MemberData:by_id(id)

if member and member.certifier_id ~= app.session.member_id then
  slot.put_into("error", _"This user was not certified by you!")
  return false
end

ui.container{ attr = { class = "row-fluid" }, content = function()
  ui.container{ attr = { class = "span12 well" }, content = function()
    ui.container{ attr = { class = "row-fluid" }, content = function()
      ui.container{ attr = { class = "span3 text-center" }, content = function()
        ui.link{
          attr = { class="btn btn-primary btn-large fixclick"  },
          module = "auditor",
          view = "index",
          content = function()
            ui.heading{level=5,attr={class=""},content=function()
              ui.image{ attr = { class="arrow_medium"}, static="svg/arrow-left.svg"}
              slot.put(_"Back")
            end }
          end
        }
      end }
      ui.container{ attr = { class = "span9 text-center" }, content = function()
        ui.heading{ level = 1, attr = { class = "uppercase"  }, content = _"You selected the following user:" }
      end }
    end }
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()

    end }
  end }
end }
ui.container{ attr = { class = "row-fluid" }, content = function()
  ui.container{ attr = { class = "span12 well" }, content = function()
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Generate a new password" }
          end }
        end
      }
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Disable account" }
          end }
        end
      }
    end }
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Send email with activation code" }
          end }
        end
      }
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Activate account without email invitation" }
          end }
        end
      }
    end }
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Broken token substitution" }
          end }
        end
      }
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Dead battery token substitution" }
          end }
        end
      }
    end }
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Lost or stolen token substitution" }
          end }
        end
      }
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Token block and account cancellation" }
          end }
        end
      }
    end }
    ui.container{ attr = { class = "row-fluid text-center" }, content = function()
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Print new user registration modules" }
          end }
        end
      }
      ui.link{
        attr = { class="btn btn-primary proc_btn fixclick"  },
        module = "auditor",
        view = "index",
        content = function()
          ui.container{ attr = { class = "proc_btn table-cell" }, content = function()
            ui.heading{level=5,content=_"Print token substiution or cancellation modules" }
          end }
        end
      }
    end }
  end }
end }
