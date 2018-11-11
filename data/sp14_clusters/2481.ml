
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let rec eval (e,x,y) =
  let rec evalhelper e x y =
    match e with
    | VarX  -> x
    | VarY  -> y
    | Sine p1 -> evalhelper (buildSine p1) x y
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
(13,23)-(13,24)
4.0 *. atan 1.0
BopG LitG (AppG [EmptyG])

(15,14)-(22,18)
atan
VarG

(15,14)-(22,18)
atan 1.0
AppG [LitG]

(15,14)-(22,18)
4.0
LitG

(15,14)-(22,18)
1.0
LitG

(20,17)-(20,46)
sin
VarG

(20,17)-(20,46)
pi
VarG

(20,17)-(20,46)
sin (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

(20,17)-(20,46)
pi *. evalhelper p1 x y
BopG VarG (AppG [EmptyG,EmptyG,EmptyG])

(21,19)-(21,29)
cos
VarG

(21,19)-(21,29)
pi
VarG

(21,19)-(21,29)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

(21,19)-(21,29)
pi *. evalhelper p1 x y
BopG VarG (AppG [EmptyG,EmptyG,EmptyG])

(21,19)-(21,48)
cos (pi *. evalhelper p1 x y)
AppG [BopG EmptyG EmptyG]

*)
