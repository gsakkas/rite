
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
(13,22)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,3)-(42,75)
(14,9)-(14,10)
(17,18)-(17,27)
(17,18)-(17,56)
(17,28)-(17,29)
(17,32)-(17,44)
(17,32)-(17,49)
(17,32)-(17,49)
(17,32)-(17,56)
(17,32)-(17,56)
(17,45)-(17,49)
(17,51)-(17,52)
(17,53)-(17,56)
(18,20)-(18,29)
(18,20)-(18,58)
(18,30)-(18,31)
(18,34)-(18,46)
(18,34)-(18,51)
(18,34)-(18,58)
(18,47)-(18,51)
(18,53)-(18,54)
(18,55)-(18,58)
(20,7)-(20,11)
(20,7)-(20,74)
(20,12)-(20,13)
(20,16)-(20,28)
(20,16)-(20,33)
(20,16)-(20,74)
(20,29)-(20,33)
(20,35)-(20,36)
(20,38)-(20,41)
(20,38)-(20,74)
(20,42)-(20,43)
(20,46)-(20,58)
(20,46)-(20,64)
(20,46)-(20,74)
(20,59)-(20,64)
(20,66)-(20,67)
(20,68)-(20,74)
(21,28)-(21,40)
(21,28)-(21,45)
(21,28)-(21,75)
(21,41)-(21,45)
(21,47)-(21,48)
(21,50)-(21,53)
(21,50)-(21,75)
(21,54)-(21,55)
(21,57)-(21,69)
(21,57)-(21,75)
(21,70)-(21,75)
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
(25,7)-(25,10)
(25,11)-(25,12)
(26,10)-(26,14)
(26,15)-(26,16)
(27,13)-(27,16)
(27,17)-(27,18)
(28,16)-(28,20)
(28,21)-(28,22)
(29,19)-(29,22)
(29,23)-(29,24)
(30,22)-(30,26)
(30,27)-(30,28)
(31,26)-(31,29)
(31,26)-(31,39)
(31,26)-(31,39)
(31,26)-(31,39)
(31,26)-(33,74)
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
