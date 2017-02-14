
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let c1 () = failwith "to be implemented";;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (eval (s1, x, y))
  | Cosine c1 -> cos (eval (c1, x, y))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x +. 0.0
  | VarY  -> y +. 0.0
  | Sine s1 -> sin (pi *. (eval (s1, x, y)))
  | Cosine c1 -> cos (pi *. (eval (c1, x, y)))
  | Average (a1,a2) -> ((eval (a1, x, y)) +. (eval (a2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (h1,h2,h3,h4) ->
      if (eval (h1, x, y)) < (eval (h2, x, y))
      then eval (h3, x, y)
      else eval (h4, x, y);;

*)

(* changed spans
(11,7)-(11,40)
(11,12)-(11,20)
(11,12)-(11,40)
(11,21)-(11,40)
(13,14)-(19,68)
(14,2)-(19,68)
(17,19)-(17,36)
(18,21)-(18,38)
(19,52)-(19,54)
(19,56)-(19,57)
(19,59)-(19,60)
(19,67)-(19,68)
*)

(* type error slice
(19,23)-(19,68)
(19,67)-(19,68)
*)
