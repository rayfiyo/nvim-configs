local M = {}

function M.typstfmt()
	return {
		exe = "typstfmt",
		args = { "--verbose" },
		stdin = true,
	}
end

function M.typstyle()
	return {
		exe = "typstyle",
		stdin = true,
	}
end

return M
