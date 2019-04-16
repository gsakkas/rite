
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

let rec exprToString e =
  match e with
  | Thresh (a,b,c,d) -> exprToString Thresh (((a * b) * c) * d)
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
(25,25)-(25,64)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(26,20)-(26,50)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(27,22)-(27,54)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(28,17)-(28,43)
let e' = buildCosine a in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(29,15)-(29,39)
let e' = buildSine a in
exprToString e'
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (AppG (fromList [EmptyG]))

(30,27)-(30,33)
VarX
ConAppG Nothing

(31,27)-(31,33)
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
(17,4)-(17,42)
(17,17)-(17,40)
(19,4)-(19,23)
(19,12)-(19,21)
(21,4)-(21,23)
(21,12)-(21,21)
(24,3)-(31,33)
(25,25)-(25,37)
(25,25)-(25,64)
(25,38)-(25,44)
(25,45)-(25,64)
(25,46)-(25,59)
(25,47)-(25,54)
(25,48)-(25,49)
(25,52)-(25,53)
(25,57)-(25,58)
(25,62)-(25,63)
(26,20)-(26,32)
(26,20)-(26,50)
(26,33)-(26,43)
(27,22)-(27,34)
(27,22)-(27,54)
(27,35)-(27,47)
(28,17)-(28,29)
(28,17)-(28,43)
(28,30)-(28,41)
(29,15)-(29,27)
(29,15)-(29,39)
(29,28)-(29,37)
(30,14)-(30,26)
(30,14)-(30,33)
(30,27)-(30,33)
(31,14)-(31,26)
(31,14)-(31,33)
(31,27)-(31,33)
*)
