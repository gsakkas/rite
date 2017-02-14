
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
(2,9)-(2,12)
(2,9)-(2,26)
(2,16)-(2,26)
(2,17)-(2,21)
(2,22)-(2,25)
(13,20)-(13,28)
(19,14)-(30,25)
(20,2)-(30,25)
(20,8)-(20,9)
(21,13)-(21,14)
(22,13)-(22,14)
(23,14)-(23,17)
(23,14)-(23,42)
(23,18)-(23,42)
(23,19)-(23,21)
(23,25)-(23,41)
(23,26)-(23,30)
(23,31)-(23,40)
(23,32)-(23,33)
(23,35)-(23,36)
(23,38)-(23,39)
(24,16)-(24,19)
(24,16)-(24,44)
(24,20)-(24,44)
(24,21)-(24,23)
(24,27)-(24,43)
(24,28)-(24,32)
(24,33)-(24,42)
(24,34)-(24,35)
(24,37)-(24,38)
(24,40)-(24,41)
(25,21)-(25,59)
(25,21)-(25,66)
(25,23)-(25,27)
(25,28)-(25,37)
(25,29)-(25,30)
(25,32)-(25,33)
(25,35)-(25,36)
(25,42)-(25,58)
(25,43)-(25,47)
(25,48)-(25,57)
(25,49)-(25,50)
(25,52)-(25,53)
(25,55)-(25,56)
(25,63)-(25,66)
(26,19)-(26,55)
(28,6)-(30,25)
(32,15)-(39,32)
*)

(* type error slice
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(20,2)-(30,25)
(20,2)-(30,25)
(22,13)-(22,14)
(23,14)-(23,17)
(23,14)-(23,42)
(23,25)-(23,41)
(23,26)-(23,30)
(23,31)-(23,40)
(23,38)-(23,39)
(32,3)-(39,34)
(32,15)-(39,32)
(38,11)-(38,15)
(38,11)-(38,59)
(38,16)-(38,59)
(38,17)-(38,52)
(38,18)-(38,29)
(38,30)-(38,35)
(38,57)-(38,58)
(39,11)-(39,16)
(39,11)-(39,32)
*)
