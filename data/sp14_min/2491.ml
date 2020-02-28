
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
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> p1 *. p2
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y in
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
    | Cosine p1 -> cos (pi *. (evalhelper p1 x y))
    | Average (p1,p2) -> ((evalhelper p1 x y) +. (evalhelper p2 x y)) /. 2.0
    | Times (p1,p2) -> (evalhelper p1 x y) *. (evalhelper p2 x y)
    | Thresh (p1,p2,p3,p4) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y)
        then evalhelper p3 x y
        else evalhelper p4 x y in
  evalhelper e x y;;

*)

(* changed spans
(21,24)-(21,26)
evalhelper p1 x y
AppG [VarG,VarG,VarG]

(21,30)-(21,32)
evalhelper p2 x y
AppG [VarG,VarG,VarG]

*)

(* type error slice
(15,5)-(25,31)
(21,24)-(21,26)
(21,24)-(21,32)
(21,30)-(21,32)
*)
