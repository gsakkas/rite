
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
exprToString y
AppG (fromList [VarG])

(35,36)-(35,41)
z
VarG

(36,25)-(36,41)
")/("
LitG

(37,28)-(37,31)
exprToString x
AppG (fromList [VarG])

(38,31)-(38,47)
"+"
LitG

(38,51)-(38,69)
exprToString y
AppG (fromList [VarG])

(38,72)-(38,75)
"+" ^ (exprToString z ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(14,3)-(38,84)
(17,28)-(17,44)
(17,29)-(17,41)
(17,42)-(17,43)
(33,15)-(38,82)
(33,16)-(33,28)
(33,29)-(33,30)
(35,22)-(35,42)
(35,23)-(35,35)
(35,36)-(35,41)
(38,51)-(38,69)
(38,52)-(38,55)
*)
