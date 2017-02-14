
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
(21,13)-(21,14)
(21,26)-(21,27)
(21,40)-(21,41)
(21,54)-(21,55)
(21,56)-(21,57)
(21,58)-(21,61)
*)

(* type error slice
(12,2)-(21,68)
(12,2)-(21,68)
(12,2)-(21,68)
(12,2)-(21,68)
(21,12)-(21,68)
(21,13)-(21,14)
(21,15)-(21,16)
(21,25)-(21,66)
(21,26)-(21,27)
(21,28)-(21,29)
(21,39)-(21,64)
(21,40)-(21,41)
(21,42)-(21,43)
(21,53)-(21,62)
(21,54)-(21,55)
(21,56)-(21,57)
*)
