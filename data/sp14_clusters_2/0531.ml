
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
        ((log ((eval (a, x, y)) *. 100)) ** (sin ((eval (b, x, y)) *. 100)))
          -. 1.0
      else
        (-1.0) *.
          (((log ((eval (b, x, y)) *. 100)) **
              (sin ((eval (a, x, y)) *. 100)))
             -. 1.0);;


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
(35,35)-(35,38)
100.0
LitG

(35,70)-(35,73)
100.0
LitG

(39,38)-(39,41)
100.0
LitG

(40,40)-(40,43)
100.0
LitG

*)
