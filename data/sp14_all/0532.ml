
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
      let a = abs (eval (a', x, y)) in
      let b = abs (eval (b', x, y)) in
      if (eval (c, x, y)) < 0.0
      then ((log (a *. 100.0)) ** (sin (b *. 100.0))) -. 1.0
      else (-1.0) *. (((log (b *. 100.0)) ** (sin (a *. 100.0))) -. 1.0);;


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
      if (eval (c, x, y)) < 0.0
      then ((log (a *. 100.0)) ** (sin (b *. 100.0))) -. 1.0
      else (-1.0) *. (((log (b *. 100.0)) ** (sin (a *. 100.0))) -. 1.0);;

*)

(* changed spans
(33,15)-(33,36)
abs_float (eval (a' , x , y))
AppG [AppG [EmptyG]]

(34,15)-(34,36)
abs_float (eval (b' , x , y))
AppG [AppG [EmptyG]]

*)

(* type error slice
(19,19)-(19,43)
(19,26)-(19,42)
(19,27)-(19,31)
(33,15)-(33,18)
(33,15)-(33,36)
(33,19)-(33,36)
(33,20)-(33,24)
(34,15)-(34,18)
(34,15)-(34,36)
(34,19)-(34,36)
(34,20)-(34,24)
*)
