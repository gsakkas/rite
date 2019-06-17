
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
(35,32)-(35,38)
buildX ()
AppG [ConAppG Nothing]

(35,44)-(35,50)
buildY ()
AppG [ConAppG Nothing]

(38,12)-(38,60)
buildSine (build (rand , depth - 1))
AppG [AppG [EmptyG]]

*)

(* type error slice
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(20,3)-(30,26)
(22,14)-(22,15)
(23,15)-(23,18)
(23,15)-(23,43)
(23,26)-(23,42)
(23,27)-(23,31)
(23,32)-(23,41)
(23,39)-(23,40)
(32,4)-(39,35)
(32,16)-(39,33)
(38,12)-(38,16)
(38,12)-(38,60)
(38,17)-(38,60)
(38,18)-(38,53)
(38,19)-(38,30)
(38,31)-(38,36)
(38,58)-(38,59)
(39,12)-(39,17)
(39,12)-(39,33)
*)
