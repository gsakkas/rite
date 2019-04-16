
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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> let a = buildThresh (a, b, c, d) in exprToString a
  | Times (a,b) -> exprToString buildTimes (a, b)
  | Average (a,b) -> exprToString buildAverage (a, b)
  | Cosine a -> exprToString buildCosine a
  | Sine a -> exprToString buildSine a
  | VarY  -> exprToString buildY
  | VarX  -> exprToString buildX;;


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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> let e' = buildThresh (a, b, c, d) in exprToString e'
  | Times (a,b) -> let e' = buildTimes (a, b) in exprToString e'
  | Average (a,b) -> let e' = buildAverage (a, b) in exprToString e'
  | Cosine a -> let e' = buildCosine a in exprToString e'
  | Sine a -> let e' = buildSine a in exprToString e'
  | VarY  -> exprToString VarX
  | VarX  -> exprToString VarY;;

*)

(* changed spans
(27,25)-(27,75)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(28,20)-(28,50)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(29,22)-(29,54)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(30,17)-(30,43)
let e' = buildCosine a in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(31,15)-(31,39)
let e' = buildSine a in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(32,27)-(32,33)
VarX
ConAppG Nothing

(33,27)-(33,33)
VarY
ConAppG Nothing

*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,44)
(13,4)-(13,31)
(13,17)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(17,4)-(17,70)
(17,18)-(17,68)
(17,39)-(17,68)
(19,4)-(19,42)
(19,17)-(19,40)
(21,4)-(21,23)
(21,12)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(27,25)-(27,75)
(27,33)-(27,44)
(27,33)-(27,57)
(27,61)-(27,73)
(27,61)-(27,75)
(27,74)-(27,75)
(28,20)-(28,32)
(28,20)-(28,50)
(28,33)-(28,43)
(29,22)-(29,34)
(29,22)-(29,54)
(29,35)-(29,47)
(30,17)-(30,29)
(30,17)-(30,43)
(30,30)-(30,41)
(31,15)-(31,27)
(31,15)-(31,39)
(31,28)-(31,37)
(32,14)-(32,26)
(32,14)-(32,33)
(32,27)-(32,33)
(33,14)-(33,26)
(33,14)-(33,33)
(33,27)-(33,33)
*)
