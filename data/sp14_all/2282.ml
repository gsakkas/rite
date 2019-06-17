
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e,f) ->
      "((" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")/2)")))
  | Times (e,f) ->
      "(" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")")))
  | Thresh (e,f,g,h) ->
      "(" ^
        ((exprToString e) ^
           ("<" ^
              ((exprToString f) ^
                 ("?" ^ ((exprToString g) ^ (":" ^ ((exprToString h) ^ ")")))))))
  | Timmy1 (e1,e2) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^ (")*" ^ ("cos(pi*" ^ ((exprToString e2) ^ ")"))))
  | Timmy2 (e1,e2,e3) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^
           (")*" ^
              ("(cos^2(pi*" ^
                 ((exprToString e2) ^
                    (")*" ^ (("cos(" exprToString e3) ^ "))"))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Timmy1 of expr* expr
  | Timmy2 of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e,f) ->
      "((" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")/2)")))
  | Times (e,f) ->
      "(" ^ ((exprToString e) ^ ("*" ^ ((exprToString f) ^ ")")))
  | Thresh (e,f,g,h) ->
      "(" ^
        ((exprToString e) ^
           ("<" ^
              ((exprToString f) ^
                 ("?" ^ ((exprToString g) ^ (":" ^ ((exprToString h) ^ ")")))))))
  | Timmy1 (e1,e2) ->
      "sin^2(pi*" ^
        ((exprToString e1) ^ (")*" ^ ("cos(pi*" ^ ((exprToString e2) ^ ")"))))
  | Timmy2 (e1,e2,e3) ->
      "sin^.5(pi*" ^
        ((exprToString e1) ^
           (")*" ^
              ("(cos^2(pi*" ^
                 ((exprToString e2) ^
                    (")*" ^ ("cos(" ^ ((exprToString e3) ^ "))")))))));;

*)

(* changed spans
(33,7)-(33,18)
"sin^.5(pi*"
LitG

(38,30)-(38,54)
"cos("
LitG

(38,57)-(38,61)
exprToString e3 ^ "))"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(38,30)-(38,54)
(38,31)-(38,37)
*)
