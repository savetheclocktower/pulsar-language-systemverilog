; empty

(package_declaration "package" @indent)
(assignment_pattern "'{" @indent)


(assignment_pattern "}" @dedent (#set! capture.final))

"{" @indent
"}" @dedent

[
  "class"
  "begin"
  "covergroup"
  "for"
  "interface"
  "sequence"
] @indent

(function_declaration
  "function" @indent
  (function_body_declaration
    "endfunction" @dedent
  )
)

(
  (module_ansi_header _ @indent)
  (#is? test.last)
)

(module_ansi_header
  name: (_) @indent
  (#is? test.lastTextOnRow))

("(" @indent
  (#is? test.lastTextOnRow))

(")" @dedent
  (#is? test.firstTextOnRow))

("endmodule" @match
  (#set! indent.matchIndentOf parent.firstNamedChild.startPosition))

[
  "end"
  "endclass"
  "endgroup"
  "endinterface"
  "endpackage"
  "endsequence"
] @dedent

([
  "initial"
  "forever"
  "fork"
] @indent
  (#is? test.lastTextOnRow))
