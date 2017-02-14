
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Op (x,y,z) ->
      "(" ^
        ((exprToString x) ^
           ("*" ^
              (exprToString ^
                 ("*" ^
                    ((exprToString ")/(") ^
                       ((exprToString x) ^
                          ("+" ^
                             ((exprToString y) ^ (("+" exprToString) ^ ")")))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Power of expr* expr
  | Op of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine n -> "sin(pi*" ^ ((exprToString n) ^ ")")
  | Cosine n -> "cos(pi*" ^ ((exprToString n) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (x,y,z,w) ->
      "(" ^
        ((exprToString x) ^
           ("<" ^
              ((exprToString y) ^
                 ("?" ^ ((exprToString z) ^ (":" ^ ((exprToString w) ^ ")")))))))
  | Power (x,y) -> (exprToString x) ^ ("**" ^ (exprToString y))
  | Op (x,y,z) ->
      "(" ^
        ((exprToString x) ^
           ("*" ^
              ((exprToString y) ^
                 ("*" ^
                    ((exprToString z) ^
                       (")/(" ^
                          ((exprToString x) ^
                             ("+" ^
                                ((exprToString y) ^
                                   ("+" ^ ((exprToString z) ^ ")")))))))))));;

*)

(* changed spans
(33,15)-(33,27)
(34,17)-(38,80)
(35,35)-(35,40)
(38,50)-(38,68)
(38,55)-(38,67)
(38,71)-(38,74)
*)

(* type error slice
(14,2)-(38,83)
(17,27)-(17,43)
(17,28)-(17,40)
(17,41)-(17,42)
(33,14)-(38,81)
(33,15)-(33,27)
(33,28)-(33,29)
(35,21)-(35,41)
(35,22)-(35,34)
(35,35)-(35,40)
(38,50)-(38,68)
(38,51)-(38,54)
*)
