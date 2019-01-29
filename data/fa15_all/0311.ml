
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let e = build (rand, (depth - 1)) in
  if depth > 0
  then
    match rand 0 4 with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildTimes (e, e, e, e)
  else (match rand 0 1 with | 0 -> buildX () | 1 -> buildY ());;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildTimes (e1,e2) = Times (e1, e2);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let e = build (rand, (depth - 1)) in
  if depth > 1
  then
    match rand (0, 4) with
    | 0 -> buildSine e
    | 1 -> buildCosine e
    | 2 -> buildAverage (e, e)
    | 3 -> buildTimes (e, e)
    | 4 -> buildThresh (e, e, e, e)
  else (match rand (0, 1) with | 0 -> buildX () | 1 -> buildY ());;

*)

(* changed spans
(17,16)-(17,39)
a
VarG

(17,16)-(17,39)
b
VarG

(17,16)-(17,39)
a_less
VarG

(17,16)-(17,39)
b_less
VarG

(17,16)-(17,39)
fun (a , b , a_less , b_less) ->
  Thresh (a , b , a_less , b_less)
LamG (ConAppG (Just (TupleG (fromList [VarG]))) Nothing)

(17,16)-(17,39)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG (fromList [VarG]))) Nothing

(25,13)-(25,14)
1
LitG

(27,10)-(27,18)
rand (0 , 4)
AppG (fromList [TupleG (fromList [EmptyG])])

(27,15)-(27,16)
(0 , 4)
TupleG (fromList [LitG])

(32,11)-(32,21)
buildThresh
VarG

(33,14)-(33,22)
rand (0 , 1)
AppG (fromList [TupleG (fromList [EmptyG])])

(33,19)-(33,20)
(0 , 1)
TupleG (fromList [LitG])

*)
