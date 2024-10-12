
return {
	'echasnovski/mini.nvim',
	version = false,
	config = function()

		local hipatterns = require('mini.hipatterns')
		-- Nice todo comments
		require('mini.hipatterns').setup({
			highlighters = {
				fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
				hack  = { pattern = 'HACK',  group = 'MiniHipatternsHack'  },
				todo  = { pattern = 'TODO',  group = 'MiniHipatternsTodo'  },
				note  = { pattern = 'NOTE',  group = 'MiniHipatternsNote'  },
				hex_color = hipatterns.gen_highlighter.hex_color(),
			}
		})


		-- gc is default, gcc for line
		local comments = require('mini.comment')
		comments.setup()

		require('mini.trailspace').setup()

	end
}
