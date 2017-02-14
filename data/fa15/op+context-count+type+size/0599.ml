
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Harmonic of expr* expr
  | Log of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Harmonic (e1,e2) ->
      "((" ^
        ((exprToString e1) ^
           ("*" ^
              ((exprToString e2) ^
                 (")/(" ^
                    ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")")))))))
  | Log (e1,e2,e3) ->
      "(log(" ^
        ((exprToString e1) ^
           ("/" ^
              ((exprToString e2 ")/") ^ ("log(" ^ ((exprToString e3) ^ "))")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Harmonic of expr* expr
  | Log of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Harmonic (e1,e2) ->
      "((" ^
        ((exprToString e1) ^
           ("*" ^
              ((exprToString e2) ^
                 (")/(" ^
                    ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")")))))))
  | Log (e1,e2,e3) ->
      "(log(" ^
        ((exprToString e1) ^
           ("/" ^
              ((exprToString e2) ^
                 (")/" ^ ("log(" ^ ((exprToString e3) ^ "))"))))));;

*)

(* changed spans
(40,17)-(40,37)
(40,33)-(40,37)
*)

(* type error slice
(17,30)-(17,42)
(17,30)-(17,45)
(17,30)-(17,52)
(17,47)-(17,48)
(40,17)-(40,29)
(40,17)-(40,37)
*)
