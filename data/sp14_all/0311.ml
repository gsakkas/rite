
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
(25,14)-(25,15)
1
LitG

(27,11)-(27,19)
rand (0 , 4)
AppG [TupleG [EmptyG,EmptyG]]

(32,12)-(32,35)
buildThresh (e , e , e , e)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(33,15)-(33,23)
rand (0 , 1)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(17,4)-(17,42)
(17,17)-(17,40)
(32,12)-(32,22)
(32,12)-(32,35)
(32,23)-(32,35)
*)
