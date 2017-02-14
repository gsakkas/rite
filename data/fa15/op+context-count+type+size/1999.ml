
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Logx of expr
  | TripMult of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | Logx a -> log (eval a)
  | TripMult (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | _ -> 0.0;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TripMult of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine b -> sin (pi *. (eval (b, x, y)))
  | Cosine b -> cos (pi *. (eval (b, x, y)))
  | Average (a,b) -> ((eval (a, x, y)) +. (eval (b, x, y))) /. 2.0
  | Times (a,b) -> (eval (a, x, y)) *. (eval (b, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y)
  | TripMult (a,b,c) ->
      ((eval (a, x, y)) *. (eval (b, x, y))) *. (eval (c, x, y))
  | _ -> 0.0;;

*)

(* changed spans
(16,2)-(30,12)
(27,14)-(27,17)
(27,14)-(27,26)
(27,18)-(27,26)
(27,19)-(27,23)
(27,24)-(27,25)
(30,9)-(30,12)
*)

(* type error slice
(16,2)-(30,12)
(19,25)-(19,41)
(19,26)-(19,30)
(19,31)-(19,40)
(27,18)-(27,26)
(27,19)-(27,23)
(27,24)-(27,25)
*)
