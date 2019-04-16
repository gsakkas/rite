
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Maximum of expr* expr* expr
  | Absolute of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (pi *. (eval (expr0, x, y)))
  | Cosine expr0 -> cos (pi *. (eval (expr0, x, y)))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y))
  | Maximum (expr0,expr1,expr2) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  ->
           (match (eval (expr1, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr1, x, y))
       | false  ->
           (match (eval (expr0, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr0, x, y)))
  | Absolute expr0 ->
      (match (eval (expr0, x, y)) < 0 with
       | true  -> 0.0 -. (eval (expr0, x, y))
       | false  -> eval (expr0, x, y));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Maximum of expr* expr* expr
  | Absolute of expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine expr0 -> sin (pi *. (eval (expr0, x, y)))
  | Cosine expr0 -> cos (pi *. (eval (expr0, x, y)))
  | Average (expr0,expr1) ->
      ((eval (expr0, x, y)) +. (eval (expr1, x, y))) /. 2.
  | Times (expr0,expr1) -> (eval (expr0, x, y)) *. (eval (expr1, x, y))
  | Thresh (expr0,expr1,expr2,expr3) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  -> eval (expr2, x, y)
       | false  -> eval (expr3, x, y))
  | Maximum (expr0,expr1,expr2) ->
      (match (eval (expr0, x, y)) < (eval (expr1, x, y)) with
       | true  ->
           (match (eval (expr1, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr1, x, y))
       | false  ->
           (match (eval (expr0, x, y)) < (eval (expr2, x, y)) with
            | true  -> eval (expr2, x, y)
            | false  -> eval (expr0, x, y)))
  | Absolute expr0 ->
      (match (eval (expr0, x, y)) < 0.0 with
       | true  -> 0.0 -. (eval (expr0, x, y))
       | false  -> eval (expr0, x, y));;

*)

(* changed spans
(39,37)-(39,38)
0.0
LitG

*)

(* type error slice
(19,23)-(19,51)
(19,30)-(19,50)
(19,31)-(19,35)
(39,14)-(39,34)
(39,14)-(39,38)
(39,15)-(39,19)
(39,37)-(39,38)
*)
