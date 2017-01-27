
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
  | Thresh (a,b,c,d) -> exprToString buildThresh (a, b, c, d)
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
(21,12)-(21,21)
(21,17)-(21,21)
(23,12)-(23,21)
(23,17)-(23,21)
(27,25)-(27,37)
(27,25)-(27,61)
(27,38)-(27,49)
(28,20)-(28,49)
(28,33)-(28,43)
(29,22)-(29,53)
(29,35)-(29,47)
(30,17)-(30,43)
(30,30)-(30,41)
(31,15)-(31,39)
(31,28)-(31,37)
(32,14)-(32,26)
(32,27)-(32,33)
(33,14)-(33,26)
(33,27)-(33,33)
*)

(* type error slice
(11,4)-(11,46)
(11,19)-(11,43)
(11,28)-(11,43)
(11,37)-(11,39)
(11,41)-(11,43)
(13,4)-(13,31)
(13,17)-(13,29)
(13,21)-(13,29)
(13,28)-(13,29)
(15,4)-(15,27)
(15,15)-(15,25)
(15,19)-(15,25)
(15,24)-(15,25)
(17,4)-(17,70)
(17,18)-(17,67)
(17,39)-(17,67)
(17,47)-(17,48)
(17,50)-(17,51)
(17,53)-(17,59)
(17,61)-(17,67)
(19,4)-(19,42)
(19,17)-(19,39)
(19,26)-(19,39)
(19,33)-(19,35)
(19,37)-(19,39)
(21,4)-(21,23)
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(33,35)
(25,22)-(33,33)
(26,3)-(33,33)
(26,9)-(26,10)
(27,25)-(27,37)
(27,25)-(27,61)
(27,38)-(27,49)
(27,51)-(27,52)
(27,51)-(27,61)
(27,54)-(27,55)
(27,57)-(27,58)
(27,60)-(27,61)
(28,20)-(28,32)
(28,20)-(28,49)
(28,33)-(28,43)
(28,45)-(28,46)
(28,45)-(28,49)
(28,48)-(28,49)
(29,22)-(29,34)
(29,22)-(29,53)
(29,35)-(29,47)
(29,49)-(29,50)
(29,49)-(29,53)
(29,52)-(29,53)
(30,17)-(30,29)
(30,17)-(30,43)
(30,30)-(30,41)
(30,42)-(30,43)
(31,15)-(31,27)
(31,15)-(31,39)
(31,28)-(31,37)
(31,38)-(31,39)
(32,14)-(32,26)
(32,14)-(32,33)
(32,27)-(32,33)
(33,14)-(33,26)
(33,14)-(33,33)
(33,27)-(33,33)
*)
