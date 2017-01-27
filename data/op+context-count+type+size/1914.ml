
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
(29,20)-(29,22)
(29,33)-(29,35)
(29,39)-(29,63)
(29,53)-(29,55)
(29,56)-(29,57)
(29,58)-(29,63)
*)

(* type error slice
(13,3)-(29,63)
(29,20)-(29,22)
(29,20)-(29,63)
(29,23)-(29,24)
(29,26)-(29,29)
(29,26)-(29,63)
(29,30)-(29,31)
(29,33)-(29,35)
(29,33)-(29,63)
(29,36)-(29,37)
(29,39)-(29,49)
(29,39)-(29,63)
(29,50)-(29,51)
(29,53)-(29,55)
(29,53)-(29,63)
(29,56)-(29,57)
(29,58)-(29,63)
*)
