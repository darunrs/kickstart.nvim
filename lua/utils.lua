local UTILS = {}

function UTILS.local_map(buffer)
  return function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { buffer = buffer, desc = desc })
  end
end

return UTILS
