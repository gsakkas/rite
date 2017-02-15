
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString expr =
  match expr with
  | "VarX" -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString expr =
  match expr with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;

*)

(* changed spans
(12,2)-(26,81)
*)

(* type error slice
(11,3)-(26,83)
(11,21)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,2)-(26,81)
(12,8)-(12,12)
(15,28)-(15,45)
(15,29)-(15,41)
(15,42)-(15,44)
*)
