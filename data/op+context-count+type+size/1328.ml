
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let rec exprToString ex =
  match ex with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | MyExpr1 (e1,e2,e3) ->
      "(sqrt(" ^
        ((exprToString e1) ^
           (")*sqrt(" ^
              ((exprToString e2) ^ (")*" ^ ((exprToString e3) ^ ")")))))
  | MyExpr2 e -> "halve(" ^ (exprToString ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | MyExpr1 of expr* expr* expr
  | MyExpr2 of expr;;

let rec exprToString ex =
  match ex with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | MyExpr1 (e1,e2,e3) ->
      "(sqrt(" ^
        ((exprToString e1) ^
           (")*sqrt(" ^
              ((exprToString e2) ^ (")*" ^ ((exprToString e3) ^ ")")))))
  | MyExpr2 e -> "halve(" ^ ((exprToString e) ^ ")");;

*)

(* changed spans
(34,30)-(34,42)
(34,45)-(34,48)
*)

(* type error slice
(14,3)-(34,48)
(17,29)-(17,41)
(17,29)-(17,43)
(17,42)-(17,43)
(34,30)-(34,42)
(34,30)-(34,48)
(34,43)-(34,44)
(34,45)-(34,48)
*)
