#lang brag
b-program   : [b-line] (NEWLINE [b-line])*
b-line      : b-line-num [b-statement] (":" [b-statement])*
b-line-num  : INTEGER
b-statement : b-end | b-print | b-goto
b-rem       : REM
b-end       : "end"
b-print     :
b-goto      :