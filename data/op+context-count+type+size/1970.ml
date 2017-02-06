
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
  | Thresh (a,b,c,d) -> let e' = buildThresh (a, b, c, d) in exprToString e'
  | Times (a,b) -> let e' = buildTimes (a, b) in exprToString e'
  | Average (a,b) -> let e' = buildAverage (a, b) in exprToString e'
  | Cosine a -> let e' = buildCosine a in exprToString e'
  | Sine a -> let e' = buildSine a in exprToString e'
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
(32,27)-(32,33)
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
(21,12)-(21,21)
(21,17)-(21,21)
(23,4)-(23,23)
(23,12)-(23,21)
(23,12)-(23,21)
(23,17)-(23,21)
(25,4)-(33,35)
(25,22)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,3)-(33,33)
(26,9)-(26,10)
(27,25)-(27,77)
(27,25)-(27,77)
(27,34)-(27,45)
(27,34)-(27,57)
(27,47)-(27,48)
(27,47)-(27,57)
(27,50)-(27,51)
(27,53)-(27,54)
(27,56)-(27,57)
(27,62)-(27,74)
(27,62)-(27,77)
(27,62)-(27,77)
(27,75)-(27,77)
(28,20)-(28,65)
(28,20)-(28,65)
(28,29)-(28,39)
(28,29)-(28,45)
(28,41)-(28,42)
(28,41)-(28,45)
(28,44)-(28,45)
(28,50)-(28,62)
(28,50)-(28,65)
(28,50)-(28,65)
(28,63)-(28,65)
(29,22)-(29,69)
(29,22)-(29,69)
(29,31)-(29,43)
(29,31)-(29,49)
(29,45)-(29,46)
(29,45)-(29,49)
(29,48)-(29,49)
(29,54)-(29,66)
(29,54)-(29,69)
(29,54)-(29,69)
(29,67)-(29,69)
(30,17)-(30,58)
(30,17)-(30,58)
(30,26)-(30,37)
(30,26)-(30,39)
(30,38)-(30,39)
(30,43)-(30,55)
(30,43)-(30,58)
(30,43)-(30,58)
(30,56)-(30,58)
(31,15)-(31,54)
(31,15)-(31,54)
(31,24)-(31,33)
(31,24)-(31,35)
(31,34)-(31,35)
(31,39)-(31,51)
(31,39)-(31,54)
(31,39)-(31,54)
(31,52)-(31,54)
(32,14)-(32,26)
(32,14)-(32,33)
(32,14)-(32,33)
(32,27)-(32,33)
(33,14)-(33,26)
(33,14)-(33,33)
(33,14)-(33,33)
(33,27)-(33,33)
*)
