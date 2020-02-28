
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Thresh2 of expr* expr
  | Thresh3 of expr* expr;;

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
        else evalhelper p4 x y
    | Thresh2 (p1,p2) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y) then 1 else 0
    | Thresh3 (p1,p2) ->
        if (evalhelper p1 x y) > (evalhelper p2 x y) then 0 else (-1) in
  evalhelper e x y;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Thresh2 of expr* expr
  | Thresh3 of expr* expr;;

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
        else evalhelper p4 x y
    | Thresh2 (p1,p2) ->
        if (evalhelper p1 x y) < (evalhelper p2 x y) then 1.0 else 0.0
    | Thresh3 (p1,p2) ->
        if (evalhelper p1 x y) > (evalhelper p2 x y) then 0.0 else (-1.0) in
  evalhelper e x y;;

*)

(* changed spans
(29,59)-(29,60)
1.0
LitG

(29,66)-(29,67)
0.0
LitG

(31,59)-(31,60)
0.0
LitG

(31,66)-(31,70)
(- 1.0)
UopG LitG

*)

(* type error slice
(17,5)-(31,70)
(20,18)-(20,21)
(20,18)-(20,49)
(29,9)-(29,67)
(29,66)-(29,67)
(31,9)-(31,70)
(31,66)-(31,70)
*)
