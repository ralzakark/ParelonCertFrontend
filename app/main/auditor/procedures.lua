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
      ui.container{ attr = { class = "span6 text-center" }, content = function()
        ui.heading{ level = 1, attr = { class = "uppercase"  }, content = _"You selected the following user:" }
      end }
    end }
    ui.container{ attr = { class = "row-fluid text-center spaceline3" }, content = function()
      ui.container{ attr = { class = "span12" }, content = function()
        
        ui.container{ attr = { class = "inline-block text-center"}, content = function()


        local active
        if not member.activated then
          active=_"Not activated"
        elseif not member.active then
          active= _"INACTIVE"
        else
          active= _"ACTIVE" 
        end



        local location={}

        if member_data and member_data.location then
          for v in  string.gmatch(member_data.location, "[^%s]+") do
            location[#location+1] = v
          end
          region=db:query("SELECT nome_regione FROM istat_regioni WHERE codice_regione = '"..location[1].."';")
          province=db:query("SELECT nome_provincia FROM istat_province WHERE codice_provincia = '"..location[2].."';")
          city=db:query("SELECT nome_comune FROM istat_comuni WHERE codice_comune = '"..location[3].."';")
        end
        local residence_unit = region[1][1]..", "..province[1][1]..", "..city[1][1]
        
        
        slot.put("<table>",
        "<tr>",
          "<th style='vertical-align:bottom;'>".._"Id".."</th>",
          "<th style='vertical-align:bottom;'>".._"Name".."</th>",
          "<th style='vertical-align:bottom;'>".._"Surname".."</th>",
          "<th style='vertical-align:bottom;'>".._"NIN".."</th>",
          "<th style='vertical-align:bottom;'>".._"State".."</th>",
          "<th style='vertical-align:bottom;'>".._"Registration date".."</th>",
          "<th style='vertical-align:bottom;'>".._"Unit of residence".."</th>",
          "<th style='vertical-align:bottom;width: 120px;'>".._"Idcard scan".."</th>",
          "<th style='vertical-align:bottom;width: 120px;'>".._"Insurance card scan".."</th>",
          "<th style='vertical-align:bottom;width: 120px;'>".._"User pic scan".."</th>",
        "</tr>",
        "<tr>",
          "<td style='border: 2px solid black; background: #feffe9; padding: 5px;'>"..member_data.id.."</td>",
          "<td style='border: 2px solid black; background: #f2ebb7; padding: 5px'>"..member_data.firstname.."</td>",
          "<td style='border: 2px solid black; background: #feffe9; padding: 5px'>"..member_data.lastname.."</td>",
          "<td style='border: 2px solid black; background: #f2ebb7; padding: 5px'>"..member_data.nin.."</td>",
          "<td style='border: 2px solid black; background: #feffe9; padding: 5px'>"..active.."</td>",
          "<td style='border: 2px solid black; background: #f2ebb7; padding: 5px'>"..format.date(member.activated, { nil_as = "N/A" } ).."</td>",
          "<td style='border: 2px solid black; background: #feffe9; padding: 5px'>"..residence_unit.."</td>",
          "<td style='border: 2px solid black; background: #f2ebb7; padding: 5px'>".."NO".."</td>",
          "<td style='border: 2px solid black; background: #feffe9; padding: 5px'>".."NO".."</td>",
          "<td style='border: 2px solid black; background: #f2ebb7; padding: 5px'>".."NO".."</td>",
        "</tr>",
         

        "</table>")
        end }
      
      end }
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
