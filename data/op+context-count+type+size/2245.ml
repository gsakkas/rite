
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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> ((exprToString x) + "*") ^ (exprToString y)
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 (("?" exprToString c) ^ (":" ^ (exprToString d))))));;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(19,22)-(19,43)
(19,40)-(19,43)
(25,20)-(25,38)
(25,24)-(25,36)
(25,50)-(25,62)
(25,63)-(25,64)
*)

(* type error slice
(12,3)-(25,64)
(15,29)-(15,41)
(15,29)-(15,43)
(15,42)-(15,43)
(19,22)-(19,34)
(19,22)-(19,36)
(19,22)-(19,43)
(19,22)-(19,62)
(19,35)-(19,36)
(19,40)-(19,43)
(19,45)-(19,46)
(19,48)-(19,60)
(19,48)-(19,62)
(19,61)-(19,62)
(25,20)-(25,23)
(25,20)-(25,38)
(25,24)-(25,36)
(25,37)-(25,38)
*)
