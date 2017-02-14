
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
      then eval ((c *. (-1.0)), x, y)
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
(16,3)-(34,25)
(28,7)-(30,25)
(28,11)-(28,24)
(28,17)-(28,18)
(28,29)-(28,32)
(29,13)-(29,37)
(29,19)-(29,20)
(29,33)-(29,37)
(29,34)-(29,37)
(30,12)-(30,25)
(30,18)-(30,19)
(32,7)-(34,25)
(32,11)-(32,43)
(32,17)-(32,18)
(32,30)-(32,43)
(32,36)-(32,37)
(33,19)-(33,20)
(33,19)-(33,29)
(33,25)-(33,29)
(33,26)-(33,29)
(34,12)-(34,25)
(34,18)-(34,19)
(34,21)-(34,22)
(34,24)-(34,25)
*)

(* type error slice
(16,3)-(34,25)
(16,3)-(34,25)
(19,27)-(19,31)
(19,27)-(19,40)
(19,33)-(19,34)
(19,33)-(19,40)
(29,13)-(29,37)
(29,33)-(29,37)
(29,33)-(29,37)
(29,34)-(29,37)
(33,12)-(33,16)
(33,12)-(33,37)
(33,19)-(33,20)
(33,19)-(33,29)
(33,19)-(33,29)
(33,19)-(33,29)
(33,19)-(33,37)
(33,25)-(33,29)
(33,25)-(33,29)
(33,26)-(33,29)
*)
