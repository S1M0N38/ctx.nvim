---@diagnostic disable: lowercase-global

local _MODREV, _SPECREV = "scm", "-1"
rockspec_format = "3.0"
version = _MODREV .. _SPECREV

local user = "S1M0N38"
package = "ctx.nvim"

description = {
	summary = "Quickfix list → OpenAI chat completion request (JSON)",
	labels = { "neovim" },
	homepage = "https://github.com/" .. user .. "/" .. package,
	license = "MIT",
}

test_dependencies = {
	"nlua",
}

source = {
	url = "git://github.com/" .. user .. "/" .. package,
}

build = {
	type = "builtin",
}
