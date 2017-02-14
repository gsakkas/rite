
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
(33,16)-(33,28)
(34,19)-(38,75)
(35,36)-(35,41)
(38,52)-(38,68)
(38,56)-(38,68)
(38,72)-(38,75)
*)

(* type error slice
(14,3)-(38,75)
(17,29)-(17,41)
(17,29)-(17,43)
(17,42)-(17,43)
(33,16)-(33,28)
(33,16)-(38,75)
(33,29)-(33,30)
(35,23)-(35,35)
(35,23)-(35,41)
(35,36)-(35,41)
(38,52)-(38,55)
(38,52)-(38,68)
*)
