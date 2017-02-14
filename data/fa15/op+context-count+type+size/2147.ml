
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cotangent e -> 1.0 /. (tan (eval (e, x, y)))
  | Volume (l,w,h) ->
      ((eval (l, x, y)) * (eval (w, x, y))) * (eval (h, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Cotangent of expr
  | Volume of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e -> sin (pi *. (eval (e, x, y)))
  | Cosine e -> cos (pi *. (eval (e, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Cotangent e -> 1.0 /. (tan (eval (e, x, y)))
  | Volume (l,w,h) ->
      ((eval (l, x, y)) *. (eval (w, x, y))) *. (eval (h, x, y));;

*)

(* changed spans
(29,9)-(29,22)
(29,9)-(29,41)
(29,9)-(29,61)
*)

(* type error slice
(19,20)-(19,40)
(19,27)-(19,31)
(19,27)-(19,40)
(29,9)-(29,13)
(29,9)-(29,22)
(29,9)-(29,41)
(29,9)-(29,41)
(29,9)-(29,61)
(29,28)-(29,32)
(29,28)-(29,41)
(29,48)-(29,52)
(29,48)-(29,61)
*)
