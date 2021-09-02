local function setup(args)
  local xplr = xplr

  args = args or {}
  args.mode = args.mode or "default"
  args.key = args.key or "e"

  xplr.config.modes.builtin[args.mode].key_bindings.on_key[args.key] = {
    help = "edit in nvim",
    messages = {
      "PopMode",
      {
        BashExecSilently = [===[
          nvim-ctrl "tabedit ${XPLR_FOCUS_PATH:?}"
        ]===],
      },
    },
  }
end

return { setup = setup }
