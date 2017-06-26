
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
(29,58)-(29,59)
(29,65)-(29,66)
(31,8)-(31,69)
(31,58)-(31,59)
(31,65)-(31,69)
(32,2)-(32,18)
*)

(* type error slice
(17,4)-(31,69)
(20,17)-(20,20)
(20,17)-(20,48)
(29,8)-(29,66)
(29,65)-(29,66)
(31,8)-(31,69)
(31,65)-(31,69)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(32,18)
(16,2)-(32,18)
(16,21)-(31,69)
(16,23)-(31,69)
(16,25)-(31,69)
(17,4)-(31,69)
(17,10)-(17,11)
(18,15)-(18,16)
(19,15)-(19,16)
(20,17)-(20,48)
(20,17)-(20,20)
(20,21)-(20,48)
(20,22)-(20,24)
(20,28)-(20,47)
(20,29)-(20,39)
(20,40)-(20,42)
(20,43)-(20,44)
(20,45)-(20,46)
(21,19)-(21,50)
(21,19)-(21,22)
(21,23)-(21,50)
(21,24)-(21,26)
(21,30)-(21,49)
(21,31)-(21,41)
(21,42)-(21,44)
(21,45)-(21,46)
(21,47)-(21,48)
(22,25)-(22,76)
(22,25)-(22,69)
(22,26)-(22,45)
(22,27)-(22,37)
(22,38)-(22,40)
(22,41)-(22,42)
(22,43)-(22,44)
(22,49)-(22,68)
(22,50)-(22,60)
(22,61)-(22,63)
(22,64)-(22,65)
(22,66)-(22,67)
(22,73)-(22,76)
(23,23)-(23,65)
(23,23)-(23,42)
(23,24)-(23,34)
(23,35)-(23,37)
(23,38)-(23,39)
(23,40)-(23,41)
(23,46)-(23,65)
(23,47)-(23,57)
(23,58)-(23,60)
(23,61)-(23,62)
(23,63)-(23,64)
(25,8)-(27,30)
(25,11)-(25,52)
(25,11)-(25,30)
(25,12)-(25,22)
(25,23)-(25,25)
(25,26)-(25,27)
(25,28)-(25,29)
(25,33)-(25,52)
(25,34)-(25,44)
(25,45)-(25,47)
(25,48)-(25,49)
(25,50)-(25,51)
(26,13)-(26,30)
(26,13)-(26,23)
(26,24)-(26,26)
(26,27)-(26,28)
(26,29)-(26,30)
(27,13)-(27,30)
(27,13)-(27,23)
(27,24)-(27,26)
(27,27)-(27,28)
(27,29)-(27,30)
(29,8)-(29,66)
(29,11)-(29,52)
(29,11)-(29,30)
(29,12)-(29,22)
(29,23)-(29,25)
(29,26)-(29,27)
(29,28)-(29,29)
(29,33)-(29,52)
(29,34)-(29,44)
(29,45)-(29,47)
(29,48)-(29,49)
(29,50)-(29,51)
(29,58)-(29,59)
(29,65)-(29,66)
(31,8)-(31,69)
(31,11)-(31,52)
(31,11)-(31,30)
(31,12)-(31,22)
(31,23)-(31,25)
(31,26)-(31,27)
(31,28)-(31,29)
(31,33)-(31,52)
(31,34)-(31,44)
(31,45)-(31,47)
(31,48)-(31,49)
(31,50)-(31,51)
(31,58)-(31,59)
(31,65)-(31,69)
(32,2)-(32,18)
(32,2)-(32,12)
(32,13)-(32,14)
(32,15)-(32,16)
(32,17)-(32,18)
*)
