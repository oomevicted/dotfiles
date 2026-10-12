vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.mouse = "a"

vim.opt.termguicolors = true

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"

vim.cmd.colorscheme("default")

local highlights = {
    Normal       = { bg = "NONE", fg = "#cccccc" },
    NormalNC     = { bg = "NONE", fg = "#cccccc" },
    NonText      = { bg = "NONE", fg = "#222222" },
    EndOfBuffer  = { bg = "NONE", fg = "#222222" },
    SignColumn   = { bg = "NONE" },

    LineNr       = { fg = "#555555" },
    CursorLineNr = { fg = "#aaaaaa", bold = true },

    Comment      = { fg = "#7799aa", italic = true },
    Todo         = { fg = "#ffffff", bg = "#333333", bold = true },

    String       = { fg = "#558855" },
    SpecialChar  = { fg = "#aaaa55", bold = true },
    Number       = { fg = "#55aaaa" },
    Boolean      = { fg = "#55aaaa", bold = true },

    Identifier   = { fg = "#cccccc" },
    Function     = { fg = "#5555aa", bold = true },
    Statement    = { fg = "#aa55aa", bold = true },
    Keyword      = { fg = "#aa55aa", bold = true },
    Conditional  = { fg = "#aa55aa", bold = true },
    Repeat       = { fg = "#aa55aa", bold = true },
    Exception    = { fg = "#aa55aa", bold = true },
    Include      = { fg = "#aa55aa", bold = true },
    
    Type         = { fg = "#55aaaa" },
    Constant     = { fg = "#55aaaa" },
    Special      = { fg = "#55aaaa", italic = true },
    Operator     = { fg = "#cccccc" },
    PreProc      = { fg = "#5555aa" },

    Search       = { bg = "#333333", fg = "#cccccc" },
    IncSearch    = { bg = "#555555", fg = "#ffffff", bold = true },
    Visual       = { bg = "#222222" },
    Cursor       = { bg = "#cccccc", fg = "#000000" },
    MatchParen   = { fg = "#ffffff", bg = "#5555aa", bold = true },

    Error        = { bg = "NONE", fg = "#8b0000", bold = true },
    ErrorMsg     = { fg = "#8b0000", bold = true },
    WarningMsg   = { fg = "#aaaa55" },
}

for group, opts in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, opts)
end
