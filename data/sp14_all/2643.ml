
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
  | Factorial e' -> factorial ((eval (e', x, y)), 1)
  | Sum3 (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y));;


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
  | Factorial e' -> factorial (eval (e', x, y)) 1.0
  | Sum3 (e1,e2,e3) ->
      ((eval (e1, x, y)) +. (eval (e2, x, y))) +. (eval (e3, x, y));;

*)

(* changed spans
(30,21)-(30,53)
factorial (eval (e' , x , y))
          1.0
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(14,28)-(14,37)
(14,28)-(14,59)
(14,38)-(14,48)
(30,21)-(30,30)
(30,21)-(30,53)
(30,31)-(30,53)
*)
