
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
  | Abs v -> abs (eval (v, x, y))
  | Flip (a,b,c) ->
      if (eval (a, x, y)) > (eval (b, x, y))
      then eval ((c * (-1)), x, y)
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
(16,3)-(31,25)
(27,14)-(27,17)
(27,14)-(27,32)
(27,19)-(27,32)
(27,25)-(27,26)
(29,7)-(31,25)
(29,11)-(29,43)
(29,17)-(29,18)
(29,30)-(29,43)
(29,36)-(29,37)
(30,12)-(30,34)
(30,19)-(30,20)
(30,19)-(30,26)
(30,24)-(30,26)
(31,12)-(31,25)
(31,18)-(31,19)
(31,21)-(31,22)
(31,24)-(31,25)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(27,14)-(27,17)
(27,14)-(27,32)
(27,19)-(27,23)
(27,19)-(27,32)
*)
