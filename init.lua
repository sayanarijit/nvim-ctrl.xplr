local function setup(args)
  local xplr = xplr

  args = args or {}
  args.mode = args.mode or "default"
  args.keys = args.keys or {
    ["ctrl-e"] = "tabedit",
    ["e"] = "e",
  }

  for key, command in pairs(args.keys) do
    xplr.config.modes.builtin[args.mode].key_bindings.on_key[key] = {
      help = "nvim :" .. command,
      messages = {
        "PopMode",
        {
          BashExecSilently = [=[
            nvim-ctrl "]=] .. command .. [=[ ${XPLR_FOCUS_PATH:?}"
          ]=],
        },
      },
    }
  end
end

return { setup = setup }
