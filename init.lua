local q = xplr.util.shell_quote

local keys = {
  ["ctrl-e"] = "tabedit",
  ["e"] = "e",
}

local function setup(args)
  local xplr = xplr

  args = args or {}
  args.bin = args.bin or "nvim-ctrl"
  args.mode = args.mode or "default"
  args.keys = args.keys or keys

  xplr.fn.custom.nvim_ctrl = {}
  for key, command in pairs(args.keys) do
    xplr.config.modes.builtin[args.mode].key_bindings.on_key[key] = {
      help = "nvim :" .. command,
      messages = {
        "PopMode",
        { CallLuaSilently = "custom.nvim_ctrl." .. command },
      },
    }

    xplr.fn.custom.nvim_ctrl[command] = function(app)
      local n = app.focused_node
      if n == nil then
        return
      end

      local res = xplr.util.shell_execute(
        args.bin,
        { command .. " " .. q(n.absolute_path) }
      )

      if res.returncode == 0 then
        return {
          { LogSuccess = "nvim :" .. command .. " " .. q(n.absolute_path) },
        }
      else
        return {
          { LogError = res.stderr },
        }
      end
    end
  end
end

return { setup = setup, keys = keys }
