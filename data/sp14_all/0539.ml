
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
      max' -
        (1.0
           (min 1.0
              ((2.71 **
                  (((sin (pi *. (eval (a, x, y)))) +.
                      (cos (pi *. (eval (b, x, y)))))
                     -. 1.0))
                 -. 1.0)))
  | SinLog (a',b',c) -> 1.0;;


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
  | SinLog (a',b',c) -> 1.0;;

*)

(* changed spans
(29,6)-(36,26)
max' (0.0 -. 1.0) (min 1.0
                       ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(30,8)-(36,26)
0.0 -. 1.0
BopG LitG LitG

(30,9)-(30,12)
0.0
LitG

*)
