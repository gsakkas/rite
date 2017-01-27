
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) + (eval (w, x, y))) / 2.0
  | Times (v,w) -> (eval (v, x, y)) * (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | Sine v -> sin (eval (v, x, y))
  | Cosine v -> cos (eval (v, x, y))
  | Average (v,w) -> ((eval (v, x, y)) +. (eval (w, x, y))) /. 2.0
  | Times (v,w) -> (eval (v, x, y)) *. (eval (v, x, y))
  | Thresh (a,b,c,d) ->
      if (eval (a, x, y)) < (eval (b, x, y))
      then eval (c, x, y)
      else eval (d, x, y);;

*)

(* changed spans
(15,24)-(15,37)
(15,24)-(15,56)
(15,24)-(15,65)
(16,21)-(16,53)
*)

(* type error slice
(12,3)-(20,25)
(13,15)-(13,18)
(13,15)-(13,33)
(13,20)-(13,24)
(13,20)-(13,33)
(13,26)-(13,27)
(13,26)-(13,33)
(13,29)-(13,30)
(13,32)-(13,33)
(15,24)-(15,28)
(15,24)-(15,37)
(15,24)-(15,56)
(15,24)-(15,65)
(15,30)-(15,31)
(15,30)-(15,37)
(15,33)-(15,34)
(15,36)-(15,37)
(15,43)-(15,47)
(15,43)-(15,56)
(15,49)-(15,50)
(15,49)-(15,56)
(15,52)-(15,53)
(15,55)-(15,56)
(15,62)-(15,65)
(16,21)-(16,25)
(16,21)-(16,34)
(16,21)-(16,53)
(16,27)-(16,28)
(16,27)-(16,34)
(16,30)-(16,31)
(16,33)-(16,34)
(16,40)-(16,44)
(16,40)-(16,53)
(16,46)-(16,47)
(16,46)-(16,53)
(16,49)-(16,50)
(16,52)-(16,53)
*)
