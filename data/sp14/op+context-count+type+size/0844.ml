
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
  | Factorial e' -> factorial (eval e')
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
(13,18)-(14,58)
(13,20)-(14,58)
(14,2)-(14,58)
(14,5)-(14,6)
(14,5)-(14,12)
(14,9)-(14,12)
(14,18)-(14,21)
(14,27)-(14,36)
(14,27)-(14,58)
(14,37)-(14,47)
(14,38)-(14,39)
(14,43)-(14,46)
(14,49)-(14,50)
(14,54)-(14,57)
(16,9)-(16,26)
(19,2)-(31,60)
(29,11)-(29,30)
(30,20)-(30,39)
(31,23)-(31,60)
*)

(* type error slice
(14,27)-(14,36)
(14,27)-(14,58)
(19,2)-(31,60)
(19,2)-(31,60)
(19,2)-(31,60)
(19,2)-(31,60)
(19,2)-(31,60)
(19,2)-(31,60)
(22,15)-(22,18)
(22,15)-(22,44)
(22,26)-(22,43)
(22,27)-(22,31)
(22,32)-(22,42)
(30,20)-(30,29)
(30,20)-(30,39)
(30,30)-(30,39)
(30,31)-(30,35)
(30,36)-(30,38)
(31,24)-(31,33)
(31,25)-(31,29)
(31,30)-(31,32)
(31,37)-(31,46)
(31,38)-(31,42)
(31,43)-(31,45)
(31,51)-(31,60)
(31,52)-(31,56)
(31,57)-(31,59)
*)
