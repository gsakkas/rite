
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
(29,10)-(29,12)
(29,16)-(29,18)
(42,17)-(42,26)
(42,17)-(42,40)
(42,17)-(42,55)
(42,17)-(42,76)
(42,61)-(42,62)
(43,16)-(43,20)
(43,16)-(43,36)
*)

(* type error slice
(16,3)-(43,36)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(31,7)-(43,36)
(31,18)-(31,22)
(31,18)-(31,32)
(31,24)-(31,26)
(31,24)-(31,32)
(31,28)-(31,29)
(31,31)-(31,32)
(32,7)-(43,36)
(32,18)-(32,22)
(32,18)-(32,32)
(32,24)-(32,26)
(32,24)-(32,32)
(32,28)-(32,29)
(32,31)-(32,32)
(33,7)-(43,36)
(33,18)-(33,22)
(33,18)-(33,32)
(33,24)-(33,26)
(33,24)-(33,32)
(33,28)-(33,29)
(33,31)-(33,32)
(37,9)-(43,36)
(38,16)-(38,45)
(40,11)-(43,36)
(42,17)-(42,21)
(42,17)-(42,26)
(42,17)-(42,40)
(42,17)-(42,55)
(42,17)-(42,62)
(42,17)-(42,76)
(42,22)-(42,26)
(42,31)-(42,35)
(42,31)-(42,40)
(42,36)-(42,40)
(42,46)-(42,50)
(42,46)-(42,55)
(42,51)-(42,55)
(42,61)-(42,62)
(42,67)-(42,76)
(43,16)-(43,20)
(43,16)-(43,36)
(43,23)-(43,27)
(43,23)-(43,36)
(43,24)-(43,27)
*)
