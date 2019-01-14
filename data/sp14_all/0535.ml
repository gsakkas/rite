
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
(37,6)-(42,72)
a
VarG

(37,6)-(42,72)
b
VarG

(37,6)-(42,72)
a
VarG

(37,6)-(42,72)
b
VarG

(37,6)-(42,72)
fun a ->
  fun b ->
    if a > b then a else b
LamG (LamG EmptyG)

(37,6)-(42,72)
fun b ->
  if a > b then a else b
LamG (IteG EmptyG EmptyG EmptyG)

(37,6)-(42,72)
a > b
BopG VarG VarG

(37,6)-(42,72)
let max' =
  fun a ->
    fun b ->
      if a > b then a else b in
let my_log =
  fun l' ->
    (let l = max' 0.1 l' in
     log l /. log 10.0) in
if eval (c , x , y) < 0.0
then (my_log (a *. 100.0) ** sin ((pi *. b) *. 100.0)) -. 1.0
else (- 1.0) *. ((my_log (b *. 100.0) ** (pi *. sin (a *. 100.0))) -. 1.0)
LetG NonRec (fromList [LamG EmptyG]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(37,6)-(42,72)
if a > b then a else b
IteG (BopG EmptyG EmptyG) VarG VarG

(37,30)-(37,33)
max'
VarG

*)
