#lang brag
b-program   : [b-line] (NEWLINE [b-line])*
b-line      : b-line-num [b-statement] (":" [b-statement])*
b-line-num  : INTEGER
b-statement : 
