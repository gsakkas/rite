
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let rec factorial x acc =
  if x = 0.0 then acc else factorial (x -. 1.0) (x *. acc);;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y)
  | Factorial e' -> factorial ((eval e'), 1)
  | Sum3 (e1,e2,e3) -> ((eval e1) +. (eval e2)) +. (eval e3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Factorial of expr
  | Sum3 of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (a,b,a_less,b_less) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (a_less, x, y)
      else eval (b_less, x, y);;

*)

(* changed spans
(13,19)-(14,58)
(13,21)-(14,58)
(14,3)-(14,58)
(14,6)-(14,7)
(14,6)-(14,13)
(14,10)-(14,13)
(14,19)-(14,22)
(14,28)-(14,37)
(14,28)-(14,58)
(14,39)-(14,40)
(14,39)-(14,47)
(14,44)-(14,47)
(14,50)-(14,51)
(14,55)-(14,58)
(16,10)-(16,26)
(19,3)-(31,60)
(29,12)-(29,30)
(30,21)-(30,44)
(31,26)-(31,60)
*)

(* type error slice
(14,28)-(14,37)
(14,28)-(14,58)
(14,39)-(14,47)
(14,50)-(14,58)
(19,3)-(31,60)
(22,28)-(22,32)
(22,28)-(22,42)
(22,34)-(22,36)
(22,34)-(22,42)
(22,38)-(22,39)
(22,41)-(22,42)
(30,21)-(30,30)
(30,21)-(30,44)
(30,33)-(30,37)
(30,33)-(30,40)
(30,33)-(30,44)
(30,38)-(30,40)
(30,43)-(30,44)
(31,26)-(31,30)
(31,26)-(31,33)
(31,31)-(31,33)
(31,39)-(31,43)
(31,39)-(31,46)
(31,44)-(31,46)
(31,53)-(31,57)
(31,53)-(31,60)
(31,58)-(31,60)
*)
