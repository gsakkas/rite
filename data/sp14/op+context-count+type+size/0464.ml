
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

let max = ref 0;;

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
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let b = abs_float (eval (b', x, y)) in
      let my_log l' = let l = max 0.1 l' in (log l) /. (log 10.0) in
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
      (2.71 **
         (((sin (pi *. (eval (a, x, y)))) +. (cos (pi *. (eval (b, x, y)))))
            -. 1.0))
        -. 1.0
  | SinLog (a',b',c) ->
      let a = abs_float (eval (a', x, y)) in
      let b = abs_float (eval (b', x, y)) in
      let max' a b = if a > b then a else b in
      let my_log l' = let l = max' 0.1 l' in (log l) /. (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;

*)

(* changed spans
(13,10)-(13,13)
(13,10)-(13,15)
(13,14)-(13,15)
(35,6)-(42,72)
(36,6)-(42,72)
(37,6)-(42,72)
(37,17)-(37,65)
(37,22)-(37,65)
(37,30)-(37,33)
(42,45)-(42,48)
(42,49)-(42,61)
(42,50)-(42,51)
(42,55)-(42,60)
*)

(* type error slice
(13,3)-(13,17)
(13,10)-(13,13)
(13,10)-(13,15)
(37,30)-(37,33)
(37,30)-(37,40)
(41,8)-(41,14)
(41,8)-(41,14)
(41,8)-(42,72)
(41,10)-(41,13)
*)
