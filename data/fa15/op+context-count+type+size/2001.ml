
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Arctan e1 -> atan eval (e1, x, y)
  | Strange (e1,e2,e3) ->
      ((((eval (e1, x, y)) *. (eval (e1, x, y))) +.
          ((eval (e2, x, y)) *. (eval (e2, x, y))))
         +. ((eval (e3, x, y)) *. (eval (e3, x, y))))
        /. 3.;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Arctan e1 -> atan (eval (e1, x, y))
  | Strange (e1,e2,e3) ->
      ((((eval (e1, x, y)) *. (eval (e1, x, y))) +.
          ((eval (e2, x, y)) *. (eval (e2, x, y))))
         +. ((eval (e3, x, y)) *. (eval (e3, x, y))))
        /. 3.;;

*)

(* changed spans
(27,17)-(27,37)
(27,22)-(27,26)
*)

(* type error slice
(27,17)-(27,21)
(27,17)-(27,37)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(32,13)
(16,2)-(32,13)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,15)-(19,44)
(19,15)-(19,18)
(19,19)-(19,44)
(19,20)-(19,22)
(19,26)-(19,43)
(19,27)-(19,31)
(19,32)-(19,42)
(19,33)-(19,35)
(19,37)-(19,38)
(19,40)-(19,41)
(20,17)-(20,46)
(20,17)-(20,20)
(20,21)-(20,46)
(20,22)-(20,24)
(20,28)-(20,45)
(20,29)-(20,33)
(20,34)-(20,44)
(20,35)-(20,37)
(20,39)-(20,40)
(20,42)-(20,43)
(21,23)-(21,69)
(21,23)-(21,63)
(21,24)-(21,41)
(21,25)-(21,29)
(21,30)-(21,40)
(21,31)-(21,33)
(21,35)-(21,36)
(21,38)-(21,39)
(21,45)-(21,62)
(21,46)-(21,50)
(21,51)-(21,61)
(21,52)-(21,54)
(21,56)-(21,57)
(21,59)-(21,60)
(21,67)-(21,69)
(22,21)-(22,59)
(22,21)-(22,38)
(22,22)-(22,26)
(22,27)-(22,37)
(22,28)-(22,30)
(22,32)-(22,33)
(22,35)-(22,36)
(22,42)-(22,59)
(22,43)-(22,47)
(22,48)-(22,58)
(22,49)-(22,51)
(22,53)-(22,54)
(22,56)-(22,57)
(24,6)-(26,26)
(24,9)-(24,46)
(24,9)-(24,26)
(24,10)-(24,14)
(24,15)-(24,25)
(24,16)-(24,18)
(24,20)-(24,21)
(24,23)-(24,24)
(24,29)-(24,46)
(24,30)-(24,34)
(24,35)-(24,45)
(24,36)-(24,38)
(24,40)-(24,41)
(24,43)-(24,44)
(25,11)-(25,26)
(25,11)-(25,15)
(25,16)-(25,26)
(25,17)-(25,19)
(25,21)-(25,22)
(25,24)-(25,25)
(26,11)-(26,26)
(26,11)-(26,15)
(26,16)-(26,26)
(26,17)-(26,19)
(26,21)-(26,22)
(26,24)-(26,25)
(27,17)-(27,37)
(27,17)-(27,21)
(27,22)-(27,26)
(27,27)-(27,37)
(27,28)-(27,30)
(27,32)-(27,33)
(27,35)-(27,36)
(29,6)-(32,13)
(29,6)-(31,53)
(29,7)-(30,51)
(29,8)-(29,48)
(29,9)-(29,26)
(29,10)-(29,14)
(29,15)-(29,25)
(29,16)-(29,18)
(29,20)-(29,21)
(29,23)-(29,24)
(29,30)-(29,47)
(29,31)-(29,35)
(29,36)-(29,46)
(29,37)-(29,39)
(29,41)-(29,42)
(29,44)-(29,45)
(30,10)-(30,50)
(30,11)-(30,28)
(30,12)-(30,16)
(30,17)-(30,27)
(30,18)-(30,20)
(30,22)-(30,23)
(30,25)-(30,26)
(30,32)-(30,49)
(30,33)-(30,37)
(30,38)-(30,48)
(30,39)-(30,41)
(30,43)-(30,44)
(30,46)-(30,47)
(31,12)-(31,52)
(31,13)-(31,30)
(31,14)-(31,18)
(31,19)-(31,29)
(31,20)-(31,22)
(31,24)-(31,25)
(31,27)-(31,28)
(31,34)-(31,51)
(31,35)-(31,39)
(31,40)-(31,50)
(31,41)-(31,43)
(31,45)-(31,46)
(31,48)-(31,49)
(32,11)-(32,13)
*)
