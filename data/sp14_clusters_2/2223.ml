
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr
  | ArcSin of expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) +. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)))
  | ArcSin (x1,x2) -> (asin ((eval (x1, x, y)) ** 2)) /. 1.6;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | CosE of expr* expr* expr
  | ArcSin of expr* expr;;

let e_num = 2.718281828;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine x1 -> sin (pi *. (eval (x1, x, y)))
  | Cosine x1 -> cos (pi *. (eval (x1, x, y)))
  | Average (x1,x2) -> ((eval (x1, x, y)) +. (eval (x2, x, y))) /. 2.
  | Times (x1,x2) -> (eval (x1, x, y)) *. (eval (x2, x, y))
  | Thresh (x1,x2,x3,x4) ->
      if (eval (x1, x, y)) < (eval (x2, x, y))
      then eval (x3, x, y)
      else eval (x4, x, y)
  | CosE (x1,x2,x3) ->
      (cos ((pi *. (eval (x1, x, y))) +. (eval (x2, x, y)))) *.
        (e_num ** ((-. pi) *. ((eval (x3, x, y)) ** 2.)))
  | ArcSin (x1,x2) -> (asin ((eval (x1, x, y)) ** 2.)) /. 1.6;;

*)

(* changed spans
(32,50)-(32,51)
2.0
LitG

*)
