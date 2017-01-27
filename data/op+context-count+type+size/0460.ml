
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
      let my_log l' = let l = max 0.1 l' in (log l) / (log 10.0) in
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
      let my_log l' = let l = min 0.1 l' in (log l) /. (log 10.0) in
      if (eval (c, x, y)) < 0.0
      then ((my_log (a *. 100.0)) ** (sin ((pi *. b) *. 100.0))) -. 1.0
      else
        (-1.0) *.
          (((my_log (b *. 100.0)) ** (pi *. (sin (a *. 100.0)))) -. 1.0);;

*)

(* changed spans
(13,11)-(13,14)
(13,11)-(13,16)
(13,15)-(13,16)
(37,31)-(37,34)
(37,46)-(37,64)
*)

(* type error slice
(13,4)-(13,18)
(13,11)-(13,14)
(13,11)-(13,16)
(13,15)-(13,16)
(37,7)-(42,72)
(37,18)-(37,64)
(37,23)-(37,64)
(37,31)-(37,34)
(37,31)-(37,41)
(37,35)-(37,38)
(37,39)-(37,41)
(37,46)-(37,49)
(37,46)-(37,51)
(37,46)-(37,64)
(37,50)-(37,51)
(37,56)-(37,59)
(37,56)-(37,64)
(37,60)-(37,64)
(39,14)-(39,20)
(39,14)-(39,32)
(39,14)-(39,62)
(39,22)-(39,32)
(39,35)-(39,37)
(39,39)-(39,42)
(39,39)-(39,62)
(39,45)-(39,62)
(41,10)-(41,14)
(41,10)-(42,72)
(41,11)-(41,14)
(42,14)-(42,20)
(42,14)-(42,32)
(42,14)-(42,61)
(42,22)-(42,32)
(42,35)-(42,37)
(42,39)-(42,61)
*)
