
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Abs of expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Abs v ->
      if (eval (v, x, y)) < 0.0
      then (eval (v, x, y)) *. (-1.0)
      else eval (v, x, y)
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then eval ((c *. (-1)), x, y)
      else eval (c, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Mid of expr* expr
  | Flip of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine q -> sin (pi *. (eval (q, x, y)))
  | Cosine q -> cos (pi *. (eval (q, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Mid (p,q) ->
      let diff =
        if ((eval (p, x, y)) -. (eval (q, x, y))) < 0.0
        then (eval (p, x, y)) -. ((eval (q, x, y)) *. (-1.0))
        else (eval (p, x, y)) -. (eval (q, x, y)) in
      diff /. 2.0
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then (eval (c, x, y)) *. (-1.0)
      else eval (c, x, y);;

*)

(* changed spans
(16,2)-(34,25)
(28,6)-(30,25)
(28,9)-(28,25)
(28,16)-(28,17)
(28,28)-(28,31)
(29,11)-(29,37)
(29,18)-(29,19)
(29,31)-(29,37)
(29,33)-(29,36)
(30,11)-(30,25)
(30,17)-(30,18)
(32,6)-(34,25)
(32,9)-(32,44)
(32,16)-(32,17)
(32,28)-(32,44)
(32,35)-(32,36)
(33,17)-(33,28)
(33,18)-(33,19)
(33,23)-(33,27)
(34,11)-(34,25)
(34,17)-(34,18)
(34,20)-(34,21)
(34,23)-(34,24)
*)

(* type error slice
(16,2)-(34,25)
(16,2)-(34,25)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(19,32)-(19,33)
(29,11)-(29,37)
(29,31)-(29,37)
(29,31)-(29,37)
(29,33)-(29,36)
(33,11)-(33,15)
(33,11)-(33,35)
(33,16)-(33,35)
(33,17)-(33,28)
(33,17)-(33,28)
(33,17)-(33,28)
(33,18)-(33,19)
(33,23)-(33,27)
*)
