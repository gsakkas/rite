
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      let max' a b = if a < b then b else a in
      max' (0.0 -. 1.0)
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let max' a b = if a < b then b else a in
      let b = abs_float (eval (b', x, y)) in
      let my_log l' = let l = max' 0.1 l' in (log l) / (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | ECosSin of expr* expr
  | SinLog of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine i -> sin (pi *. (eval (i, x, y)))
  | Cosine i -> cos (pi *. (eval (i, x, y)))
  | Average (i1,i2) -> ((eval (i1, x, y)) +. (eval (i2, x, y))) /. 2.0
  | Times (i1,i2) -> (eval (i1, x, y)) *. (eval (i2, x, y))
  | Thresh (i1,i2,i3,i4) ->
      if (eval (i1, x, y)) < (eval (i2, x, y))
      then eval (i3, x, y)
      else eval (i4, x, y)
  | ECosSin (a,b) ->
      let max' a b = if a < b then b else a in
      max' (0.0 -. 1.0)
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let max' a b = if a < b then b else a in
      let b = abs_float (eval (b', x, y)) in
      let my_log l' = let l = max' 0.1 l' in (log l) /. (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;

*)

(* changed spans
(40,47)-(40,65)
*)

(* type error slice
(38,7)-(45,72)
(38,16)-(38,44)
(38,18)-(38,44)
(38,22)-(38,44)
(38,25)-(38,26)
(38,25)-(38,30)
(38,29)-(38,30)
(38,36)-(38,37)
(40,7)-(45,72)
(40,18)-(40,65)
(40,23)-(40,65)
(40,31)-(40,35)
(40,31)-(40,42)
(40,36)-(40,39)
(40,40)-(40,42)
(40,47)-(40,50)
(40,47)-(40,52)
(40,47)-(40,65)
(40,51)-(40,52)
(40,57)-(40,60)
(40,57)-(40,65)
(40,61)-(40,65)
(42,14)-(42,20)
(42,14)-(42,32)
(42,14)-(42,62)
(42,22)-(42,32)
(42,35)-(42,37)
(42,39)-(42,42)
(42,39)-(42,62)
(42,45)-(42,62)
(44,10)-(44,14)
(44,10)-(45,72)
(44,11)-(44,14)
(45,14)-(45,20)
(45,14)-(45,32)
(45,14)-(45,61)
(45,22)-(45,32)
(45,35)-(45,37)
(45,39)-(45,61)
*)
