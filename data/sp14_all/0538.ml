
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
      max 1.0
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
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
      max' 1.0
        (min 1.0
           ((2.71 **
               (((sin (pi *. (eval (a, x, y)))) +.
                   (cos (pi *. (eval (b, x, y)))))
                  -. 1.0))
              -. 1.0))
  | SinLog (a',b',c) -> 1.0;;

*)

(* changed spans
(30,6)-(30,9)
max'
VarG

(30,6)-(36,22)
a
VarG

(30,6)-(36,22)
b
VarG

(30,6)-(36,22)
b
VarG

(30,6)-(36,22)
a
VarG

(30,6)-(36,22)
fun a ->
  fun b ->
    if a < b then b else a
LamG (LamG EmptyG)

(30,6)-(36,22)
fun b ->
  if a < b then b else a
LamG (IteG EmptyG EmptyG EmptyG)

(30,6)-(36,22)
a < b
BopG VarG VarG

(30,6)-(36,22)
let max' =
  fun a ->
    fun b ->
      if a < b then b else a in
max' 1.0 (min 1.0
              ((2.71 ** ((sin (pi *. eval (a , x , y)) +. cos (pi *. eval (b , x , y))) -. 1.0)) -. 1.0))
LetG NonRec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))

(30,6)-(36,22)
if a < b then b else a
IteG (BopG EmptyG EmptyG) VarG VarG

*)