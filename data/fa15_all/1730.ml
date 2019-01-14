
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
exprToString
VarG

(21,13)-(21,14)
exprToString a
AppG (fromList [VarG])

(21,26)-(21,27)
exprToString
VarG

(21,26)-(21,27)
exprToString b
AppG (fromList [VarG])

(21,40)-(21,41)
exprToString
VarG

(21,40)-(21,41)
exprToString c
AppG (fromList [VarG])

(21,54)-(21,55)
exprToString
VarG

(21,54)-(21,55)
exprToString d
AppG (fromList [VarG])

*)
