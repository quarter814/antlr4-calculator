grammar Calc;

prog
    : stat+
    ;

stat
    : expr                       # printExpr
    | ID '=' expr                # assign
    | ID '(' parm=(ID|INT) ')' '=' expr # func
    ;

expr
    : expr op=(MOD|MUL|DIV) expr # ModMulDiv
    | expr op=(ADD|SUB) expr     # AddSub
    | ID '(' expr ')'            # call
    | INT                        # int
    | ID                         # id
    | '(' expr ')'               # parens
    ;

MOD : '%' ;

MUL : '*' ;

DIV : '/' ;

ADD : '+' ;

SUB : '-' ;

ID  : [a-zA-Z]+ ;

INT : [0-9]+ ;

WS  : [ \t\r\n]+ -> skip ;    // toss out whitespace
