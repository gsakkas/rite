
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> evalhelper Sine p1 x y
    | Cosine p1 -> evalhelper buildCosine p1 x y in
  evalhelper e x y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> sin (pi *. (evalhelper p1 x y))
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y)) in
  evalhelper e x y;;

*)

(* changed spans
(11,27)-(11,28)
4.0 *. atan 1.0
BopG LitG (AppG [EmptyG])

(13,14)-(20,18)
atan
VarG

(13,14)-(20,18)
atan 1.0
AppG [LitG]

(13,14)-(20,18)
4.0
LitG

(13,14)-(20,18)
1.0
LitG

(18,17)-(18,27)
sin
VarG

(18,17)-(18,27)
pi
VarG

(18,17)-(18,27)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

(18,17)-(18,27)
pi *. evalhelper p1 x y
BopG VarG (AppG [EmptyG,EmptyG,EmptyG])

(18,17)-(18,39)
sin (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

(19,19)-(19,29)
cos
VarG

(19,19)-(19,29)
pi
VarG

(19,19)-(19,29)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

(19,19)-(19,29)
pi *. evalhelper p1 x y
BopG VarG (AppG [EmptyG,EmptyG,EmptyG])

(19,19)-(19,48)
cos (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

*)
