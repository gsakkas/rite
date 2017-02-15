
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
  | SinLog (a,b,c) ->
      if c < 0
      then ((log (x *. 100)) ** (sin (x *. 100))) -. 1.0
      else (-1.0) *. (((log (x *. 100)) ** (sin (x *. 100))) -. 1.0);;


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
  | SinLog (a,b,c) ->
      if (eval (c, x, y)) < 0.0
      then
        ((log ((eval (a, x, y)) *. 100.0)) **
           (sin ((eval (b, x, y)) *. 100.0)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100.0)) **
              (sin ((eval (a, x, y)) *. 100.0)))
             -. 1.0);;

*)

(* changed spans
(33,9)-(33,10)
(33,13)-(33,14)
(34,11)-(34,56)
(34,18)-(34,19)
(34,23)-(34,26)
(34,32)-(34,48)
(34,38)-(34,39)
(34,43)-(34,46)
(34,53)-(34,56)
(35,22)-(35,60)
(35,23)-(35,39)
(35,24)-(35,27)
(35,28)-(35,38)
(35,29)-(35,30)
(35,34)-(35,37)
(35,40)-(35,42)
(35,43)-(35,59)
(35,44)-(35,47)
(35,48)-(35,58)
(35,49)-(35,50)
(35,54)-(35,57)
(35,64)-(35,67)
*)

(* type error slice
(16,2)-(35,68)
(33,9)-(33,10)
(33,9)-(33,14)
(33,9)-(33,14)
(33,13)-(33,14)
(34,17)-(34,27)
(34,23)-(34,26)
(34,37)-(34,47)
(34,43)-(34,46)
(35,11)-(35,17)
(35,11)-(35,17)
(35,11)-(35,68)
(35,13)-(35,16)
(35,28)-(35,38)
(35,34)-(35,37)
(35,48)-(35,58)
(35,54)-(35,57)
*)
