
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Arctan e1 -> (2 *. (atan eval (e1, x, y))) / pi
  | Strange (e1,e2,e3) ->
      ((((eval (e1, x, y)) *. (eval (e1, x, y))) +.
          ((eval (e2, x, y)) *. (eval (e2, x, y))))
         +. ((eval (e3, x, y)) *. (eval (e3, x, y))))
        /. 3.;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Arctan of expr
  | Strange of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e1 -> sin (pi *. (eval (e1, x, y)))
  | Cosine e1 -> cos (pi *. (eval (e1, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Arctan e1 -> atan (eval (e1, x, y))
  | Strange (e1,e2,e3) ->
      ((((eval (e1, x, y)) *. (eval (e1, x, y))) +.
          ((eval (e2, x, y)) *. (eval (e2, x, y))))
         +. ((eval (e3, x, y)) *. (eval (e3, x, y))))
        /. 3.;;

*)

(* changed spans
(27,23)-(27,45)
atan (eval (e1 , x , y))
AppG (fromList [AppG (fromList [EmptyG])])

(27,29)-(27,33)
eval (e1 , x , y)
AppG (fromList [TupleG (fromList [EmptyG])])

*)
