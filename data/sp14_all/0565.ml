
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | AddThree of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")))
  | Times (e5,e6) -> (exprToString e5) ^ ("*" ^ (exprToString e6))
  | Thresh (e7,e8,e9,e10) ->
      "(" ^
        ((exprToString e7) ^
           ("<" ^
              ((exprToString e8) ^
                 ("?" ^
                    ((exprToString e9) ^ (":" ^ ((exprToString e10) ^ ")")))))))
  | Power (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("**" ^ ((exprToString e2) ^ ")")))
  | AddThree (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("+" ^ ((exprToString e2) ^ (("+" exprToString e3) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | AddThree of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e2 -> "cos(pi*" ^ ((exprToString e2) ^ ")")
  | Average (e3,e4) ->
      "((" ^ ((exprToString e3) ^ ("+" ^ ((exprToString e4) ^ ")/2)")))
  | Times (e5,e6) -> (exprToString e5) ^ ("*" ^ (exprToString e6))
  | Thresh (e7,e8,e9,e10) ->
      "(" ^
        ((exprToString e7) ^
           ("<" ^
              ((exprToString e8) ^
                 ("?" ^
                    ((exprToString e9) ^ (":" ^ ((exprToString e10) ^ ")")))))))
  | Power (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("**" ^ ((exprToString e2) ^ ")")))
  | AddThree (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("+" ^ ((exprToString e2) ^ ("+" ^ ((exprToString e3) ^ ")")))));;

*)

(* changed spans
(34,41)-(34,62)
"+"
LitG

(34,65)-(34,68)
exprToString e3 ^ ")"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(34,41)-(34,62)
(34,42)-(34,45)
*)
