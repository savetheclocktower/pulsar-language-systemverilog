; MISC
; ====

;package
(package_import_item
  (simple_identifier) @support.namespace.systemverilog)
(package_import_item "*" @keyword.operator.import.wildcard.systemverilog
  (#set! capture.final))

(library_declaration
  (simple_identifier) @variable.other.library.systemverilog
  (#is? test.firstOfType)
)


; label
c_name: (c_identifier) @variable.other.assignment.systemverilog

(dpi_import_export
  name: (simple_identifier) @function)

(default_nettype_compiler_directive
  (default_nettype_value) @support.storage.type.builtin.systemverilog)

(text_macro_definition
  (text_macro_name
    (simple_identifier) @constant.directive.systemverilog))

(text_macro_usage
  "`" @keyword.operator.macro.systemverilog
  (simple_identifier) @support.other.macro.systemverilog @constant.directive.systemverilog
)

(ifdef_condition
  (simple_identifier) @constant.directive.ifdef.systemverilog)

(undefine_compiler_directive
  (simple_identifier) @keyword.directive)


; TYPES
; =====

; type def
(class_type
  (simple_identifier) @support.other.storage.type
  (#is? test.firstOfType)
  (#is? test.lastOfType))

(class_type
  (simple_identifier)
  "::"
  (simple_identifier) @support.other.storage.type)

(data_type
  (class_scope
    (class_type
      (simple_identifier) @support.other.class.instance.systemverilog)))

(task_prototype
  name: (simple_identifier) @entity.name.function.systemverilog)

(function_prototype
  name: (simple_identifier) @entity.name.function.systemverilog)

(type_assignment
  name: (simple_identifier) @variable.other.type.definition.systemverilog)

(interface_class_type
  (simple_identifier) @entity.other.inherited-class.systemverilog)

(package_scope
  _ @variable.other.package-scope.systemverilog
  (#match? @variable.other.package-scope.systemverilog "^\\$"))

(data_declaration
  (type_declaration
    type_name: (simple_identifier) @variable.other.declaration.type.systemverilog))

(constraint_declaration
  (simple_identifier) @entity.name.constraint.systemverilog)

(method_call
  (primary
    (hierarchical_identifier
      (simple_identifier) @constructor)))

(string_literal
  (quoted_string) @string)


; COMMENTS
; ========

; Line comments. `//`
((comment) @comment.line.double-slash.systemverilog
  (#match? @comment.line.double-slash.systemverilog "^\/\/"))

((comment) @punctuation.definition.comment.systemverilog
  (#match? @punctuation.definition.comment.systemverilog "^\/\/")
  (#set! adjust.startAndEndAroundFirstMatchOf "^\/\/"))

((comment) @comment.block.documentation.systemverilog
  (#match? @comment.block.documentation.systemverilog "^/\\*\\*")
  (#set! capture.final true)
  (#set! highlight.invalidateOnChange true))


; Block comments. `/* */`
((comment) @comment.block.systemverilog
  (#match? @comment.block.systemverilog "^/\\*")
  (#match? @comment.block.systemverilog "\\*/$")
  (#set! highlight.invalidateOnChange true))

((comment) @punctuation.definition.comment.begin.systemverilog
  (#match? @punctuation.definition.comment.begin.systemverilog "^/\\*")
  (#set! adjust.startAndEndAroundFirstMatchOf "^/\\*"))

((comment) @punctuation.definition.comment.end.systemverilog
  (#match? @punctuation.definition.comment.end.systemverilog "\\*/$")
  (#set! adjust.startAndEndAroundFirstMatchOf "\\*/$"))


; IDENTIFIERS
; ===========

((simple_identifier) @constant.other.systemverilog
  (#match? @constant.other.systemverilog "^[A-Z_][A-Z_0-9]*$")
  (#set! capture.shy))


; STRINGS
; =======

(quoted_string "\"") @string.quoted.double.systemverilog

((quoted_string "\"" @punctuation.definition.string.begin.systemverilog)
  (#is? test.firstOfType)
)

((quoted_string "\"" @punctuation.definition.string.end.systemverilog)
  (#is? test.lastOfType)
)

; include
(file_path_spec) @string.unquoted.file-path


; dpi
(
  (dpi_spec_string) @string.quoted.double.systemverilog
  (#match? @string.quoted.double.systemverilog "^\"")
)

(
  (dpi_spec_string) @punctuation.definition.string.begin.systemverilog
  (#match? @punctuation.definition.string.begin.systemverilog "^\"")
  (#set! adjust.startAndEndAroundFirstMatchOf "^\"")
)

(
  (dpi_spec_string) @punctuation.definition.string.end.systemverilog
  (#match? @punctuation.definition.string.end.systemverilog "^\"")
  (#set! adjust.startAndEndAroundFirstMatchOf "\"$")
)


(include_compiler_directive
  (system_lib_string) @string.quoted.other.lt-gt.systemverilog)

((include_compiler_directive
  (system_lib_string) @punctuation.definition.string.begin.systemverilog
  (#set! adjust.startAndEndAroundFirstMatchOf "^<")))

((include_compiler_directive
  (system_lib_string) @punctuation.definition.string.begin.systemverilog
  (#set! adjust.startAndEndAroundFirstMatchOf ">$")))



; FUNCTIONS
; =========

(system_tf_call
  (system_tf_identifier) @support.function.builtin.systemverilog
)

(tf_call
  (simple_identifier) @support.function.other.systemverilog
)

(bind_directive
  (bind_target_scope
    (simple_identifier) @support.function.other.constructor.systemverilog))

(bind_target_instance
  (hierarchical_identifier
    (simple_identifier) @support.other.module.systemverilog))


; LABELS
; ======

(seq_block
  (simple_identifier) @entity.other.label.systemverilog)

(statement
  block_name: (simple_identifier) @entity.other.label.systemverilog)

; assertion
(concurrent_assertion_item
  (simple_identifier) @entity.other.label.systemverilog)

; converge
(cover_point
  name: (simple_identifier) @entity.other.label.systemverilog)

(cover_cross
  name: (simple_identifier) @entity.other.label.systemverilog)


; VARIABLES
; =========


(list_of_cross_items
  (simple_identifier) @variable.parameter.systemverilog)


(list_of_variable_decl_assignments
  (variable_decl_assignment
    name: (simple_identifier) @variable.other.declaration.systemverilog))

(tf_port_item
  (simple_identifier) @variable.other.systemverilog)

port_name: (simple_identifier) @variable.other.systemverilog

(assignment_pattern
  (simple_identifier) @variable.other.assignment.systemverilog
)

(port
  (simple_identifier) @variable.other.systemverilog)

(list_of_port_identifiers
  (simple_identifier) @variable.other.systemverilog)

(net_lvalue
  (simple_identifier) @variable.other.systemverilog)

(sequence_port_item
  (simple_identifier) @variable.other.systemverilog)

(property_port_item
  (simple_identifier) @variable.other.systemverilog)

(net_decl_assignment
  (simple_identifier) @variable.other.systemverilog)

(ERROR
  (simple_identifier) @variable.other.systemverilog)

; variable.member
; (hierarchical_identifier
;   (simple_identifier)
;   (simple_identifier) @variable.other.property.systemverilog)

(select
  (simple_identifier) @variable.other.property.systemverilog)

(named_port_connection
  port_name: (simple_identifier) @variable.other.property.systemverilog)


; (type_declaration
;   (simple_identifier) @variable.declaration.type.systemverilog
;   (#is? test.lastOfType)
; )

(net_declaration
  (simple_identifier) @support.storage.type.systemverilog
  (#is? test.firstOfType)
)

(coverage_option
  (simple_identifier) @variable.other.property.systemverilog)

; variable.builtin
(method_call_body
  arguments: (list_of_arguments
    (expression) @variable.language.this.systemverilog
    (#any-of? @variable.language.this.systemverilog "this")))

(implicit_class_handle) @variable.language.systemverilog

; variable.parameter
(named_parameter_assignment
  (simple_identifier) @variable.parameter.systemverilog)

(parameter_declaration
  (list_of_param_assignments
    (param_assignment
      (simple_identifier) @variable.parameter.systemverilog)))

(local_parameter_declaration
  (list_of_param_assignments
    (param_assignment
      (simple_identifier) @variable.parameter.systemverilog)))

(net_decl_assignment
  (simple_identifier) @variable.other.declaration.systemverilog
)

(variable_decl_assignment
  (simple_identifier) @variable.other.declaration.systemverilog
)

(net_assignment
  (net_lvalue
    (_) @variable.other.declaration.systemverilog
  )
)

(operator_assignment
  (variable_lvalue
    (_) @variable.other.declaration.systemverilog
  )
)

(cover_point
  (expression
    (primary
      (_) @variable.other.declaration.systemverilog
    )
  )
)

(for_variable_declaration
  (simple_identifier) @variable.other.assignment.systemverilog
)

(event_expression
  (expression
    (primary
      (_) @variable.other.declaration.systemverilog
    )
  )
)

(nonblocking_assignment
  (variable_lvalue
    (_) @variable.other.assignment.systemverilog
  )
)

; ENTITIES
; ========

(task_body_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.systemverilog
  (simple_identifier)? @label)

(function_body_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.systemverilog
  (simple_identifier)? @label)

(function_body_declaration
  .
  (data_type_or_void)
  name: (simple_identifier) @entity.name.function.definition.systemverilog
  (simple_identifier)? @label)

(clocking_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(sequence_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(property_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(class_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(interface_class_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(covergroup_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(package_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)

(checker_declaration
  .
  name: (simple_identifier) @entity.name.function.definition.constructor.systemverilog
  (simple_identifier)? @label)


  (interface_declaration
    .
    [
      (simple_identifier) @entity.name.function.definition.constructor.systemverilog
      (interface_nonansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
      (interface_ansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
    ]
    (simple_identifier)? @label)

  (module_declaration
    .
    [
      (simple_identifier) @entity.name.function.definition.constructor.systemverilog
      (module_nonansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
      (module_ansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
    ]
    (simple_identifier)? @label)

  (program_declaration
    .
    [
      (simple_identifier) @entity.name.function.definition.constructor.systemverilog
      (program_nonansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
      (program_ansi_header
        (simple_identifier) @entity.name.function.definition.constructor.systemverilog)
    ]
    (simple_identifier)? @label)

; TODO
(generate_block
  name: (simple_identifier) @label)

[
  (cycle_delay_range)
  (delay_control)
  (cycle_delay)
  (attribute_instance)
] @entity.other.attribute-name.systemverilog

(attribute_instance
  (attr_spec
    (simple_identifier) @entity.other.attribute-name.systemverilog))


; FUNCTIONS
; =========

[
  (simulation_control_task)
  (system_tf_identifier)
  (severity_system_task)
  (randomize_call)
  (array_or_queue_method_name)
  "new"
] @support.function.builtin.systemverilog


; function.call
(method_call_body
  name: (simple_identifier) @support.other.function.systemverilog)

(tf_call
  (hierarchical_identifier
    (simple_identifier) @support.other.function.systemverilog))

; instance
(module_instantiation
  instance_type: (simple_identifier) @support.storage.type.other.systemverilog)

(name_of_instance
  instance_name: (simple_identifier) @support.other.class.instance.systemverilog)

(sequence_instance
  (hierarchical_identifier
    (simple_identifier) @support.other.class.instance.systemverilog))

(udp_instantiation
  (simple_identifier) @support.other.class.instance.systemverilog)

(ansi_port_declaration
  (interface_port_header
    interface_name: (simple_identifier) @support.other.object.systemverilog
    modport_name: (simple_identifier) @variable.other.declaration.property.simple_identifier)
  port_name: (simple_identifier) @variable.other.object.property.systemverilog)


; KEYWORDS
; ========

[
  "begin"
  "end"
  "generate"
  "endgenerate"
  (module_keyword)
  "endmodule"
  "program"
  "endprogram"
  "package"
  "endpackage"
  "checker"
  "endchecker"
  "pure"
  "virtual"
  "extends"
  "implements"
  "super"
  (class_item_qualifier)
  "parameter"
  "localparam"
  "defparam"
  "assign"
  "modport"
  "fork"
  "join"
  "join_none"
  "join_any"
  "default"
  "break"
  "tagged"
  "extern"
  "alias"
  "posedge"
  "negedge"
  "bind"
  "expect"
  "type"
  "void"
  "coverpoint"
  "cross"
  "nettype"
  "export"
  "force"
  "release"
  "timeunit"
  "timeprecision"
  "sequence"
  "endsequence"
  "property"
  "endproperty"
  "clocking"
  "endclocking"
  "covergroup"
  "endgroup"
  "specify"
  "endspecify"
  "primitive"
  "endprimitive"
  "wait"
  "wait_order"
  "const"
  "constraint"
  "unique"
  "do"
  "genvar"
  "inside"
  "rand"
  "continue"
  "randc"
  "event"
  "global"
  "ref"
  "initial"
  (unique_priority)
  (bins_keyword)
  (always_keyword)
  "return"
] @keyword.control._TYPE_.systemverilog

[
  "for"
  "foreach"
  "repeat"
  "forever"
  "while"
] @keyword.control.loop._TYPE_.systemverilog

; directive
[
  "directive_define"
  "directive_default_nettype"
  "directive_resetall"
  "directive_timescale"
  "directive_undef"
  "directive_undefineall"
  "directive_ifdef"
  "directive_ifndef"
  "directive_elsif"
  "directive_endif"
  "directive_else"
] @keyword.directive.define


[
  "class"
  "endclass"
  "interface"
  "endinterface"
  "enum"
  "struct"
  "union"
  "function"
  "endfunction"
  "task"
  "endtask"
  "typedef"
] @storage.type._TYPE_.systemverilog

[
  "initial"
  "input"
  "output"
  "unsigned"
  "signed"
  "assert"
  "cover"
  "assume"
  "disable"
  "automatic"
  "static"
] @storage.modifier._TYPE_.systemverilog

[
  (dpi_function_import_property)
  (dpi_task_import_property)
] @storage.modifier.systemverilog

[
  "include"
  "import"
  "directive_include"
  "library"
] @keyword.control.import.systemverilog


; for
(loop_generate_construct
  (generate_block
    [
      "begin"
      "end"
    ] @keyword.control.block._TYPE_.systemverilog))

; foreach
(loop_statement
  (statement
    (statement_item
      (seq_block
        [
          "begin"
          "end"
        ] @keyword.control.block._TYPE_.systemverilog))))

; repeat forever while
(loop_statement
  (statement_or_null
    (statement
      (statement_item
        (seq_block
          [
            "begin"
            "end"
          ] @keyword.control.block._TYPE_.systemverilog)))))

[
  "if"
  "else"
  "iff"
  "endcase"
] @keyword.control.conditional._TYPE_.systemverilog
(case_keyword) @keyword.control.condition.case.systemverilog

[
  "logic"
  "bit"
  "bins"
  "coverpoint"
  "int"
  "shortint"
  "longint"
  "event"
  "posedge"
  "negedge"
  "string"
] @support.storage.type.builtin._TYPE_.systemverilog

[
  (net_type)
  (integer_vector_type)
  (time_unit)
  (integer_atom_type)
  (non_integer_type)
] @support.storage.type.builtin.systemverilog

(data_type
  (simple_identifier) @support.storage.type.builtin.systemverilog)


; NUMBERS
; =======

(decimal_number) @constant.numeric.decimal.systemverilog
(hex_number) @constant.numeric.hexadecimal.systemverilog
(unsigned_number) @constant.numeric.systemverilog
(fixed_point_number) @constant.numeric.decimal.float.systemverilog
(binary_base) @constant.numeric.operator.binary.systemverilog
(binary_value) @constant.numeric.binary.systemverilog


; OPERATORS
; =========

((event_control) @keyword.operator.event.systemverilog
  (#set! capture.final))
(delay_control "#" @keyword.operator.delay.systemverilog)

(conditional_expression
  [
    "?"
    ":"
  ] @keyword.operator.ternary.systemverilog)

[
  "="
] @keyword.operator.assignment.systemverilog

["&&" "||" "!"] @keyword.operator.logical.systemverilog
["and" "or"] @keyword.operator.logical.systemverilog

["&" "|" "<<" ">>" ">>>" "~" "^"] @keyword.operator.bitwise.systemverilog
[ "~" ] @keyword.operator.unary.systemverilog

["==" "===" "!=" "!==" "-:"] @keyword.operator.comparison.systemverilog
[">" "<" ">=" "<="] @keyword.operator.relational.systemverilog
["++" "--"] @keyword.operator.increment.systemverilog
["/" "+" "-" "*" "**" "%"] @keyword.operator.arithmetic.systemverilog

"." @keyword.operator.accessor.systemverilog


; CONSTANTS
; =========

"null" @constant.language.null.systemverilog

; PUNCTUATION
; ===========

";" @punctuation.terminator.statement.systemverilog
"," @punctuation.separator.comma.systemverilog
":" @punctuation.separator.colon.systemverilog
"::" @punctuation.separator.namespace.systemverilog

"{" @punctuation.definition.block.begin.bracket.curly.systemverilog
"}" @punctuation.definition.block.end.bracket.curly.systemverilog
"(" @punctuation.definition.begin.bracket.round.systemverilog
")" @punctuation.definition.end.bracket.round.systemverilog
"[" @punctuation.definition.begin.bracket.square.systemverilog
"]" @punctuation.definition.end.bracket.square.systemverilog
