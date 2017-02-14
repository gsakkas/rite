
let pi = 4.0 *. (atan 1.0);;

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildCosine e = Cosine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine t -> sin (pi *. (eval (t, x, y)))
  | Cosine t -> cos (pi *. (eval (t, x, y)))
  | Average (t,s) -> ((eval (t, x, y)) +. (eval (s, x, y))) /. 2.0
  | Times (t,s) -> (eval (t, x, y)) *. (eval (s, x, y))
  | Thresh (t,r,s,q) ->
      if (eval (t, x, y)) < (eval (r, x, y))
      then eval (s, x, y)
      else eval (q, x, y);;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX else buildY
  | d ->
      if r = 0
      then eval ((buildCosine build (rand, (d - 1))), 1, 2)
      else build (rand, (d - 1));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildSine e = Sine e;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let r = rand (0, depth) in
  match depth with
  | 0 -> if (r mod 2) = 0 then buildX () else buildY ()
  | d ->
      if r = 0
      then buildSine (build (rand, (depth - 1)))
      else build (rand, (d - 1));;

*)

(* changed spans
(2,10)-(2,13)
(2,10)-(2,26)
(2,18)-(2,22)
(2,18)-(2,26)
(2,23)-(2,26)
(13,21)-(13,29)
(19,15)-(30,25)
(20,3)-(30,25)
(20,9)-(20,10)
(21,14)-(21,15)
(22,14)-(22,15)
(23,15)-(23,18)
(23,15)-(23,40)
(23,20)-(23,22)
(23,20)-(23,40)
(23,27)-(23,31)
(23,27)-(23,40)
(23,33)-(23,34)
(23,33)-(23,40)
(23,36)-(23,37)
(23,39)-(23,40)
(24,17)-(24,20)
(24,17)-(24,42)
(24,22)-(24,24)
(24,22)-(24,42)
(24,29)-(24,33)
(24,29)-(24,42)
(24,35)-(24,36)
(24,35)-(24,42)
(24,38)-(24,39)
(24,41)-(24,42)
(25,24)-(25,28)
(25,24)-(25,57)
(25,24)-(25,67)
(25,30)-(25,31)
(25,30)-(25,37)
(25,33)-(25,34)
(25,36)-(25,37)
(25,44)-(25,48)
(25,44)-(25,57)
(25,50)-(25,51)
(25,50)-(25,57)
(25,53)-(25,54)
(25,56)-(25,57)
(25,64)-(25,67)
(26,21)-(26,54)
(28,7)-(30,25)
(32,16)-(39,31)
*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(20,3)-(30,25)
(20,3)-(30,25)
(22,14)-(22,15)
(23,15)-(23,18)
(23,15)-(23,40)
(23,27)-(23,31)
(23,27)-(23,40)
(23,33)-(23,40)
(23,39)-(23,40)
(32,4)-(39,35)
(32,16)-(39,31)
(38,12)-(38,16)
(38,12)-(38,59)
(38,19)-(38,30)
(38,19)-(38,50)
(38,19)-(38,59)
(38,31)-(38,36)
(38,58)-(38,59)
(39,12)-(39,17)
(39,12)-(39,31)
*)
