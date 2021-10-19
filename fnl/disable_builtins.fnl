( local disabled_built_ins [
  "netrw" "netrwPlugin" "netrwSettings" "netrwFileHandlers"
  "gzip" "zip" "zipPlugin" "tar" "tarPlugin"
  "getscript" "getscriptPlugin"
  "vimball" "vimballPlugin"
  "2html_plugin"
  "logipat"
  "rrhelper"
  "spellfile_plugin"
  "matchit" ] )
( each [ _ plugin ( ipairs disabled_built_ins ) ]
  ( tset vim.g ( .. "loaded_" plugin ) 1 ))
