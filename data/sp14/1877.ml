
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) + (atan res2)) - (atan res3)) *. 2) / (3.0 *. pi)
          else eval ((-1.0) *. res3);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Acossin of expr* expr
  | Crazy of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Acossin (e1,e2) ->
      (((acos (eval (e1, x, y))) *. (asin (eval (e2, x, y)))) *. 2.0) /.
        (pi *. pi)
  | Crazy (e1,e2,e3) ->
      let res1 = eval (e1, x, y) in
      let res2 = eval (e2, x, y) in
      let res3 = eval (e3, x, y) in
      if res1 > res2
      then ((res1 +. res2) +. res3) /. 3.0
      else
        if res2 > res3
        then ((res1 *. res2) +. res3) /. 2.0
        else
          if res1 > res3
          then
            ((((atan res1) +. (atan res2)) -. (atan res3)) *. 2.0) /.
              (3.0 *. pi)
          else (-1.0) *. res3;;

*)

(* changed spans
(42,13)-(42,77)
(((atan res1 +. atan res2) -. atan res3) *. 2.0) /. (3.0 *. pi)
BopG (BopG EmptyG EmptyG) (BopG EmptyG EmptyG)

(43,16)-(43,37)
(- 1.0) *. res3
BopG (UopG EmptyG) VarG

*)

(* type error slice
(19,27)-(19,44)
(19,28)-(19,32)
(19,33)-(19,43)
(37,9)-(43,37)
(38,14)-(38,45)
(40,11)-(43,37)
(42,13)-(42,63)
(42,13)-(42,77)
(42,14)-(42,57)
(42,15)-(42,42)
(42,16)-(42,27)
(42,17)-(42,21)
(42,30)-(42,41)
(42,31)-(42,35)
(42,45)-(42,56)
(42,46)-(42,50)
(42,61)-(42,62)
(42,66)-(42,77)
(43,16)-(43,20)
(43,16)-(43,37)
(43,21)-(43,37)
*)
