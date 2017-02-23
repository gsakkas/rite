
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sin_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sin_Avg (a,b,c) ->
      eval
        ((eval (a, (sin (pi * x)), (sin (pi * y)))),
          (eval (b, (sin (pi * x)), (sin (pi * y)))),
          (eval (c, (sin (pi * x)), (sin (pi * y)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Tan of expr
  | Sine_Avg of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine a -> eval (a, (sin (pi *. x)), (sin (pi *. y)))
  | Cosine a -> eval (a, (cos (pi *. x)), (cos (pi *. y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Tan a -> eval (a, (tan (pi *. x)), (tan (pi *. y)))
  | Sine_Avg (a,b,c) ->
      (((eval (a, (sin (pi *. x)), (sin (pi *. y)))) +.
          (eval (b, (sin (pi *. x)), (sin (pi *. y)))))
         +. (eval (c, (sin (pi *. x)), (sin (pi *. y)))))
        /. 3.0;;

*)

(* changed spans
(16,2)-(32,53)
(29,6)-(29,10)
(29,6)-(32,53)
(30,8)-(32,53)
(30,9)-(30,51)
(30,24)-(30,32)
(30,40)-(30,48)
(31,25)-(31,33)
(31,41)-(31,49)
(32,25)-(32,33)
(32,41)-(32,49)
*)

(* type error slice
(13,3)-(13,28)
(13,9)-(13,26)
(16,2)-(32,53)
(19,14)-(19,18)
(19,14)-(19,56)
(19,19)-(19,56)
(19,20)-(19,21)
(19,28)-(19,37)
(19,35)-(19,36)
(19,45)-(19,54)
(19,52)-(19,53)
(21,21)-(21,59)
(21,22)-(21,38)
(21,23)-(21,27)
(29,6)-(29,10)
(29,6)-(32,53)
(30,8)-(32,53)
(30,9)-(30,51)
(30,10)-(30,14)
(30,19)-(30,33)
(30,20)-(30,23)
(30,24)-(30,32)
(30,24)-(30,32)
(30,24)-(30,32)
(30,25)-(30,27)
(30,30)-(30,31)
(30,35)-(30,49)
(30,36)-(30,39)
(30,40)-(30,48)
(30,40)-(30,48)
(30,40)-(30,48)
(30,41)-(30,43)
(30,46)-(30,47)
(31,20)-(31,34)
(31,21)-(31,24)
(31,25)-(31,33)
(31,25)-(31,33)
(31,25)-(31,33)
(31,26)-(31,28)
(31,31)-(31,32)
(31,36)-(31,50)
(31,37)-(31,40)
(31,41)-(31,49)
(31,41)-(31,49)
(31,41)-(31,49)
(31,42)-(31,44)
(31,47)-(31,48)
(32,20)-(32,34)
(32,21)-(32,24)
(32,25)-(32,33)
(32,25)-(32,33)
(32,25)-(32,33)
(32,26)-(32,28)
(32,31)-(32,32)
(32,36)-(32,50)
(32,37)-(32,40)
(32,41)-(32,49)
(32,41)-(32,49)
(32,41)-(32,49)
(32,42)-(32,44)
(32,47)-(32,48)
*)

(* all spans
(13,9)-(13,26)
(13,9)-(13,12)
(13,16)-(13,26)
(13,17)-(13,21)
(13,22)-(13,25)
(15,14)-(32,53)
(16,2)-(32,53)
(16,8)-(16,9)
(17,13)-(17,14)
(18,13)-(18,14)
(19,14)-(19,56)
(19,14)-(19,18)
(19,19)-(19,56)
(19,20)-(19,21)
(19,23)-(19,38)
(19,24)-(19,27)
(19,28)-(19,37)
(19,29)-(19,31)
(19,35)-(19,36)
(19,40)-(19,55)
(19,41)-(19,44)
(19,45)-(19,54)
(19,46)-(19,48)
(19,52)-(19,53)
(20,16)-(20,58)
(20,16)-(20,20)
(20,21)-(20,58)
(20,22)-(20,23)
(20,25)-(20,40)
(20,26)-(20,29)
(20,30)-(20,39)
(20,31)-(20,33)
(20,37)-(20,38)
(20,42)-(20,57)
(20,43)-(20,46)
(20,47)-(20,56)
(20,48)-(20,50)
(20,54)-(20,55)
(21,21)-(21,66)
(21,21)-(21,59)
(21,22)-(21,38)
(21,23)-(21,27)
(21,28)-(21,37)
(21,29)-(21,30)
(21,32)-(21,33)
(21,35)-(21,36)
(21,42)-(21,58)
(21,43)-(21,47)
(21,48)-(21,57)
(21,49)-(21,50)
(21,52)-(21,53)
(21,55)-(21,56)
(21,63)-(21,66)
(22,19)-(22,55)
(22,19)-(22,35)
(22,20)-(22,24)
(22,25)-(22,34)
(22,26)-(22,27)
(22,29)-(22,30)
(22,32)-(22,33)
(22,39)-(22,55)
(22,40)-(22,44)
(22,45)-(22,54)
(22,46)-(22,47)
(22,49)-(22,50)
(22,52)-(22,53)
(24,6)-(26,25)
(24,9)-(24,44)
(24,9)-(24,25)
(24,10)-(24,14)
(24,15)-(24,24)
(24,16)-(24,17)
(24,19)-(24,20)
(24,22)-(24,23)
(24,28)-(24,44)
(24,29)-(24,33)
(24,34)-(24,43)
(24,35)-(24,36)
(24,38)-(24,39)
(24,41)-(24,42)
(25,11)-(25,25)
(25,11)-(25,15)
(25,16)-(25,25)
(25,17)-(25,18)
(25,20)-(25,21)
(25,23)-(25,24)
(26,11)-(26,25)
(26,11)-(26,15)
(26,16)-(26,25)
(26,17)-(26,18)
(26,20)-(26,21)
(26,23)-(26,24)
(27,13)-(27,55)
(27,13)-(27,17)
(27,18)-(27,55)
(27,19)-(27,20)
(27,22)-(27,37)
(27,23)-(27,26)
(27,27)-(27,36)
(27,28)-(27,30)
(27,34)-(27,35)
(27,39)-(27,54)
(27,40)-(27,43)
(27,44)-(27,53)
(27,45)-(27,47)
(27,51)-(27,52)
(29,6)-(32,53)
(29,6)-(29,10)
(30,8)-(32,53)
(30,9)-(30,51)
(30,10)-(30,14)
(30,15)-(30,50)
(30,16)-(30,17)
(30,19)-(30,33)
(30,20)-(30,23)
(30,24)-(30,32)
(30,25)-(30,27)
(30,30)-(30,31)
(30,35)-(30,49)
(30,36)-(30,39)
(30,40)-(30,48)
(30,41)-(30,43)
(30,46)-(30,47)
(31,10)-(31,52)
(31,11)-(31,15)
(31,16)-(31,51)
(31,17)-(31,18)
(31,20)-(31,34)
(31,21)-(31,24)
(31,25)-(31,33)
(31,26)-(31,28)
(31,31)-(31,32)
(31,36)-(31,50)
(31,37)-(31,40)
(31,41)-(31,49)
(31,42)-(31,44)
(31,47)-(31,48)
(32,10)-(32,52)
(32,11)-(32,15)
(32,16)-(32,51)
(32,17)-(32,18)
(32,20)-(32,34)
(32,21)-(32,24)
(32,25)-(32,33)
(32,26)-(32,28)
(32,31)-(32,32)
(32,36)-(32,50)
(32,37)-(32,40)
(32,41)-(32,49)
(32,42)-(32,44)
(32,47)-(32,48)
*)
