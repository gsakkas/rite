
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr1) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr,expr1) -> (exprToString expr) ^ ("*" ^ (exprToString expr1))
  | Nom (expr1,expr2,expr3) ->
      let (res1,res2,res3) =
        ((exprToString expr1), (exprToString expr2), (exprToString expr3)) in
      "(" ^
        (res1 ^
           ("+" ^
              (res2 ^
                 ("+" ^
                    (res3 ^
                       ((")" / "(abs(") ^
                          (res1 ^
                             (")+abs(" ^ (res2 ^ (")+abs(" ^ (res3 ^ "))")))))))))))
  | Squa expr ->
      let res = exprToString expr in
      "abs(" ^ (res ^ (")/(abs" ^ (res ^ ("+" ^ (res ^ "^2)")))))
  | Thresh (expr,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^ ((exprToString expr2) ^ (":" ^ (exprToString expr3)))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Nom of expr* expr* expr
  | Squa of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine expr -> "sin(pi*" ^ ((exprToString expr) ^ ")")
  | Cosine expr -> "cos(pi*" ^ ((exprToString expr) ^ ")")
  | Average (expr,expr1) ->
      "((" ^ ((exprToString expr) ^ ("+" ^ ((exprToString expr1) ^ ")/2)")))
  | Times (expr,expr1) -> (exprToString expr) ^ ("*" ^ (exprToString expr1))
  | Nom (expr1,expr2,expr3) ->
      let (res1,res2,res3) =
        ((exprToString expr1), (exprToString expr2), (exprToString expr3)) in
      "(" ^
        (res1 ^
           ("+" ^
              (res2 ^
                 ("+" ^
                    (res3 ^
                       (")/(abs(" ^
                          (res1 ^
                             (")+abs(" ^ (res2 ^ (")+abs(" ^ (res3 ^ "))")))))))))))
  | Squa expr ->
      let res = exprToString expr in
      "abs(" ^ (res ^ (")/(abs" ^ (res ^ ("+" ^ (res ^ "^2)")))))
  | Thresh (expr,expr1,expr2,expr3) ->
      "(" ^
        ((exprToString expr) ^
           ("<" ^
              ((exprToString expr1) ^
                 ("?" ^ ((exprToString expr2) ^ (":" ^ (exprToString expr3)))))));;

*)

(* changed spans
(31,26)-(31,29)
(31,26)-(31,39)
(31,32)-(31,39)
*)

(* type error slice
(14,3)-(42,75)
(17,32)-(17,44)
(17,32)-(17,49)
(17,45)-(17,49)
(23,7)-(33,74)
(24,11)-(24,23)
(24,11)-(24,29)
(24,11)-(24,73)
(24,24)-(24,29)
(24,33)-(24,45)
(24,33)-(24,51)
(24,46)-(24,51)
(24,55)-(24,67)
(24,55)-(24,73)
(24,68)-(24,73)
(31,26)-(31,29)
(31,26)-(31,39)
(31,26)-(33,74)
(31,32)-(31,39)
(31,41)-(31,42)
(32,28)-(32,32)
(32,28)-(33,74)
(32,33)-(32,34)
(33,31)-(33,39)
(33,31)-(33,74)
(33,40)-(33,41)
(33,43)-(33,47)
(33,43)-(33,74)
(33,48)-(33,49)
(33,51)-(33,59)
(33,51)-(33,74)
(33,60)-(33,61)
(33,63)-(33,67)
(33,63)-(33,74)
(33,68)-(33,69)
(33,70)-(33,74)
*)
