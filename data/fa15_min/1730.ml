
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e' -> "sin (pi * " ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos (pi * " ^ ((exprToString e') ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (" + " ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ (" * " ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^ (a ^ ("< " ^ (b ^ (" ? " ^ (c ^ (" : " ^ (d ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e' -> "sin (pi * " ^ ((exprToString e') ^ ")")
  | Cosine e' -> "cos (pi * " ^ ((exprToString e') ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ (" + " ^ ((exprToString b) ^ ")/2)")))
  | Times (a,b) -> (exprToString a) ^ (" * " ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("< " ^
              ((exprToString b) ^
                 (" ? " ^
                    ((exprToString c) ^ (" : " ^ ((exprToString d) ^ ")")))))));;

*)

(* changed spans
(21,14)-(21,15)
exprToString a
AppG [VarG]

(21,27)-(21,28)
exprToString b
AppG [VarG]

(21,41)-(21,42)
exprToString c
AppG [VarG]

(21,55)-(21,56)
exprToString d
AppG [VarG]

*)

(* type error slice
(12,3)-(21,69)
(21,13)-(21,69)
(21,14)-(21,15)
(21,16)-(21,17)
(21,26)-(21,67)
(21,27)-(21,28)
(21,29)-(21,30)
(21,40)-(21,65)
(21,41)-(21,42)
(21,43)-(21,44)
(21,54)-(21,63)
(21,55)-(21,56)
(21,57)-(21,58)
*)
