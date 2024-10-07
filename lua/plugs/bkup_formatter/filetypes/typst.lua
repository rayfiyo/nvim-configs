local M = {}

function M.gofumpt()
	return {
		exe = "typstfmt",
		stdin = true,
	}
end

return M
