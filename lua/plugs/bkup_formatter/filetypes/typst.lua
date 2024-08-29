local M = {}

function M.typstfmt()
	return {
		exe = "typstfmt",
		args = { "--verbose" },
	}
end

function M.typstyle()
	return {
		exe = "typstyle",
		stdin = true,
	}
end

return
