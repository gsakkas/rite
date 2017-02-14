
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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ (exprToString e2 ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ (exprToString e2 ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;


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
  | Sine e1 -> "sin(pi *" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi *" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) ->
      "(" ^ ((exprToString e1) ^ ("*" ^ ((exprToString e2) ^ ")")))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(18,42)-(18,54)
(20,41)-(20,53)
(27,50)-(27,62)
(27,63)-(27,65)
*)

(* type error slice
(15,28)-(15,53)
(15,29)-(15,46)
(15,30)-(15,42)
(15,47)-(15,48)
(18,41)-(18,65)
(18,42)-(18,54)
(20,40)-(20,61)
(20,41)-(20,53)
*)
