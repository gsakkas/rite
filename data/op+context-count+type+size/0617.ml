
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))))
  | Plus (v,w) -> "(" ^ ((exprToString v) ^ (("+" exprToString w) ^ ")"))
  | Cube (v,w,x) ->
      "(" ^
        ((exprToString v) ^
           ("*" ^ ((exprToString w) ^ ("*" ^ (exprToString x)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Plus of expr* expr
  | Cube of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine v -> "sin(pi*" ^ ((exprToString v) ^ ")")
  | Cosine v -> "cos(pi*" ^ ((exprToString v) ^ ")")
  | Average (v,w) ->
      "((" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")/2)")))
  | Times (v,w) -> (exprToString v) ^ ("*" ^ (exprToString w))
  | Thresh (v,w,x,y) ->
      (exprToString v) ^
        ("<" ^
           ((exprToString w) ^
              ("?" ^ ((exprToString x) ^ (":" ^ ((exprToString y) ^ ")"))))))
  | Plus (v,w) -> "(" ^ ((exprToString v) ^ ("+" ^ ((exprToString w) ^ ")")))
  | Cube (v,w,x) ->
      "(" ^
        ((exprToString v) ^
           ("*" ^ ((exprToString w) ^ ("*" ^ (exprToString x)))));;

*)

(* changed spans
(27,47)-(27,65)
(27,51)-(27,63)
*)

(* type error slice
(14,3)-(31,61)
(17,29)-(17,41)
(17,29)-(17,43)
(17,42)-(17,43)
(27,47)-(27,50)
(27,47)-(27,65)
(27,51)-(27,63)
(27,64)-(27,65)
*)
