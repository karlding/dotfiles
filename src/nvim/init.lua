require "user.options"
-- Ensure that this happens before any plugins are registered in orer
-- to remap <Leader>
require "user.keymaps"

require "user.plugins"

require "user.lsp"

-- Plugin specific configuration
require "user.gitsigns"
require "user.telescope"
