
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e = if e = VarX then "x";;


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
(11,25)-(11,45)
(11,28)-(11,36)
(11,32)-(11,36)
*)

(* type error slice
(11,25)-(11,45)
(11,25)-(11,45)
(11,25)-(11,45)
(11,42)-(11,45)
*)

(* all spans
(11,21)-(11,45)
(11,25)-(11,45)
(11,28)-(11,36)
(11,28)-(11,29)
(11,32)-(11,36)
(11,42)-(11,45)
(11,25)-(11,45)
*)
