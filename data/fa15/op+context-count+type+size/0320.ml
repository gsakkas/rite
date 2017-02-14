
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

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
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1 "*") ^
           ((exprToString e2 "*") ^ ((exprToString e3) ^ ")")))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Volume of expr* expr* expr
  | Tan of expr;;

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
  | Volume (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("*" ^ ((exprToString e2) ^ ("*" ^ ((exprToString e3) ^ ")")))))
  | Tan e1 -> "tan(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,9)-(31,30)
(31,26)-(31,29)
(32,12)-(32,33)
(32,13)-(32,25)
(32,29)-(32,32)
(33,28)-(33,40)
(33,41)-(33,43)
*)

(* type error slice
(17,27)-(17,52)
(17,28)-(17,45)
(17,29)-(17,41)
(17,46)-(17,47)
(31,9)-(31,30)
(31,10)-(31,22)
(32,12)-(32,33)
(32,13)-(32,25)
*)
