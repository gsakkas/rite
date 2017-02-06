
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
(11,8)-(11,41)
(11,13)-(11,21)
(11,13)-(11,41)
(11,22)-(11,41)
(13,15)-(19,69)
(14,3)-(19,69)
(17,21)-(17,35)
(18,23)-(18,37)
(19,53)-(19,55)
(19,57)-(19,58)
(19,60)-(19,61)
(19,68)-(19,69)
*)

(* type error slice
(11,4)-(11,43)
(11,8)-(11,41)
(11,13)-(11,21)
(11,13)-(11,41)
(13,15)-(19,69)
(14,9)-(14,10)
(15,14)-(15,15)
(16,14)-(16,15)
(17,21)-(17,25)
(17,21)-(17,35)
(19,26)-(19,69)
(19,68)-(19,69)
*)
