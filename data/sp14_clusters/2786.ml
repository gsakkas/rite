
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | POS of expr* expr* expr* expr
  | SOP of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (pi *. (eval (e0, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e2,e3) -> ((eval (e2, x, y)) +. (eval (e3, x, y))) /. 2.0
  | Times (e4,e5) -> (eval (e4, x, y)) *. (eval (e5, x, y))
  | Thresh (e6,e7,e8,e9) ->
      if (eval (e6, x, y)) < (eval (e7, x, y))
      then eval (e8, x, y)
      else eval (e9, x, y)
  | POS (a,b,c,d) ->
      ((eval (a, x, y)) +. (eval (b, x, y))) *.
        ((eval (c, x, y)) +. (eval (d, x, y)))
  | SOP (f,g,h) -> (eval (f, x, y)) + ((eval (g, x, y)) *. (eval (h, x, y)));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | POS of expr* expr* expr* expr
  | SOP of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e0 -> sin (pi *. (eval (e0, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e2,e3) -> ((eval (e2, x, y)) +. (eval (e3, x, y))) /. 2.0
  | Times (e4,e5) -> (eval (e4, x, y)) *. (eval (e5, x, y))
  | Thresh (e6,e7,e8,e9) ->
      if (eval (e6, x, y)) < (eval (e7, x, y))
      then eval (e8, x, y)
      else eval (e9, x, y)
  | POS (a,b,c,d) ->
      ((eval (a, x, y)) +. (eval (b, x, y))) *.
        ((eval (c, x, y)) +. (eval (d, x, y)))
  | SOP (f,g,h) -> (eval (f, x, y)) +. ((eval (g, x, y)) *. (eval (h, x, y)));;

*)

(* changed spans
(30,19)-(30,76)
eval (f , x , y) +. (eval (g , x , y) *. eval (h , x , y))
BopG (AppG [EmptyG]) (BopG EmptyG EmptyG)

*)
