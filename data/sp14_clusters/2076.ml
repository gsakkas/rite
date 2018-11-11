
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
LamG (ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing)

(17,16)-(17,39)
Thresh (a , b , a_less , b_less)
ConAppG (Just (TupleG [VarG,VarG,VarG,VarG])) Nothing

(25,46)-(25,53)
let e' =
  buildThresh (a , b , c , d) in
exprToString e'
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(25,47)-(25,48)
buildThresh
VarG

(25,47)-(25,48)
buildThresh (a , b , c , d)
AppG [TupleG [EmptyG,EmptyG,EmptyG,EmptyG]]

(25,47)-(25,48)
(a , b , c , d)
TupleG [VarG,VarG,VarG,VarG]

(26,19)-(26,49)
exprToString e'
AppG [VarG]

(26,32)-(26,42)
e'
VarG

(26,32)-(26,42)
buildTimes (a , b)
AppG [TupleG [EmptyG,EmptyG]]

(26,32)-(26,42)
let e' = buildTimes (a , b) in
exprToString e'
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(27,21)-(27,53)
exprToString e'
AppG [VarG]

(27,34)-(27,46)
e'
VarG

(27,34)-(27,46)
buildAverage (a , b)
AppG [TupleG [EmptyG,EmptyG]]

(27,34)-(27,46)
let e' =
  buildAverage (a , b) in
exprToString e'
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(28,16)-(28,42)
exprToString e'
AppG [VarG]

(28,29)-(28,40)
e'
VarG

(28,29)-(28,40)
buildCosine a
AppG [VarG]

(28,29)-(28,40)
let e' = buildCosine a in
exprToString e'
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(29,14)-(29,38)
exprToString e'
AppG [VarG]

(29,27)-(29,36)
e'
VarG

(29,27)-(29,36)
buildSine a
AppG [VarG]

(29,27)-(29,36)
let e' = buildSine a in
exprToString e'
LetG NonRec [AppG [EmptyG]] (AppG [EmptyG])

(30,26)-(30,32)
e'
VarG

(31,26)-(31,32)
VarX
ConAppG Nothing Nothing

*)
