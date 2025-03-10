
return {
    'nanozuki/tabby.nvim',
    event = 'VimEnter', -- if you want lazy load, see below
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()

        local theme = {
            fill = { fg = "#abb2bf", bg = "#151515" },  -- Fondo de la barra de pestañas
            head = { fg = "#61afef", bg = "#1b1b1b" },  -- Encabezado (izquierda)
            current_tab = { fg = "#61afef", bg = "#1b1b1b" },  -- Pestaña actual
            tab = { fg = "#5c6370", bg = "#1b1b1b" },  -- Pestañas no seleccionadas
            win = { fg = "#abb2bf", bg = "#1b1b1b" },  -- Ventanas en la pestaña actual
            tail = { fg = "#61afef", bg = "#1b1b1b" },  -- Cola (derecha)
        }
        require('tabby').setup({
          line = function(line)
            return {
              {
                { '    ', hl = theme.head },
                line.sep('', theme.head, theme.fill),
              },
              line.tabs().foreach(function(tab)
                local hl = tab.is_current() and theme.current_tab or theme.tab
                return {
                  line.sep('', hl, theme.fill),
                  tab.is_current() and '' or '󰆣',
                  tab.number(),
                  tab.name(),
                  tab.close_btn(''),
                  line.sep('', hl, theme.fill),
                  hl = hl,
                  margin = ' ',
                }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep('', theme.win, theme.fill),
              win.is_current() and '' or '',
              win.buf_name(),
              line.sep('', theme.win, theme.fill),
              hl = theme.win,
              margin = ' ',
            }
          end),
          {
            line.sep('', theme.tail, theme.fill),
            { '  ', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end,
      -- option = {}, -- setup modules' option,
    })
    end,
}
