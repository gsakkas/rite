
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x1,x2) ->
      "((" ^ ((exprToString x1) ^ ("+" ^ ((exprToString x2) ^ ")/2)")))
  | Times (x1,x2) -> (exprToString x1) ^ ("*" ^ (exprToString x2))
  | Thresh (x1,x2,x3,x4) ->
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))))
  | CosE (x1,x2,x3) ->
      "cos(pi*" ^ (x1 ^ ("*" ^ (x2 ^ (")e^(-pi*" ^ (x3 ^ "^2)")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x1,x2) ->
      "((" ^ ((exprToString x1) ^ ("+" ^ ((exprToString x2) ^ ")/2)")))
  | Times (x1,x2) -> (exprToString x1) ^ ("*" ^ (exprToString x2))
  | Thresh (x1,x2,x3,x4) ->
      "(" ^
        ((exprToString x1) ^
           ("<" ^
              ((exprToString x2) ^
                 ("?" ^
                    ((exprToString x3) ^ (":" ^ ((exprToString x4) ^ ")")))))))
  | CosE (x1,x2,x3) ->
      "cos(pi*" ^
        ((exprToString x1) ^
           ("*" ^
              ((exprToString x1) ^ (")e^(-pi*" ^ ((exprToString x1) ^ "^2)")))));;

*)

(* changed spans
(29,19)-(29,21)
(29,32)-(29,34)
(29,37)-(29,64)
(29,52)-(29,54)
(29,55)-(29,56)
(29,57)-(29,62)
*)

(* type error slice
(13,2)-(29,67)
(13,2)-(29,67)
(13,2)-(29,67)
(29,18)-(29,67)
(29,19)-(29,21)
(29,22)-(29,23)
(29,31)-(29,65)
(29,32)-(29,34)
(29,35)-(29,36)
(29,51)-(29,63)
(29,52)-(29,54)
(29,55)-(29,56)
*)
