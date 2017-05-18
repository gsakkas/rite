
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
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(32,26)-(32,32)
(33,26)-(33,32)
*)

(* type error slice
(17,3)-(17,69)
(17,17)-(17,67)
(17,38)-(17,67)
(21,3)-(21,22)
(21,11)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(27,24)-(27,76)
(27,33)-(27,44)
(27,33)-(27,57)
(27,61)-(27,73)
(27,61)-(27,76)
(27,74)-(27,76)
(32,13)-(32,25)
(32,13)-(32,32)
(32,26)-(32,32)
(33,13)-(33,25)
(33,13)-(33,32)
(33,26)-(33,32)
*)

(* all spans
(11,18)-(11,43)
(11,27)-(11,43)
(11,36)-(11,38)
(11,40)-(11,42)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,17)-(17,67)
(17,38)-(17,67)
(17,46)-(17,47)
(17,49)-(17,50)
(17,52)-(17,58)
(17,60)-(17,66)
(19,16)-(19,39)
(19,25)-(19,39)
(19,32)-(19,34)
(19,36)-(19,38)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,21)-(33,32)
(26,2)-(33,32)
(26,8)-(26,9)
(27,24)-(27,76)
(27,33)-(27,57)
(27,33)-(27,44)
(27,45)-(27,57)
(27,46)-(27,47)
(27,49)-(27,50)
(27,52)-(27,53)
(27,55)-(27,56)
(27,61)-(27,76)
(27,61)-(27,73)
(27,74)-(27,76)
(28,19)-(28,64)
(28,28)-(28,45)
(28,28)-(28,38)
(28,39)-(28,45)
(28,40)-(28,41)
(28,43)-(28,44)
(28,49)-(28,64)
(28,49)-(28,61)
(28,62)-(28,64)
(29,21)-(29,68)
(29,30)-(29,49)
(29,30)-(29,42)
(29,43)-(29,49)
(29,44)-(29,45)
(29,47)-(29,48)
(29,53)-(29,68)
(29,53)-(29,65)
(29,66)-(29,68)
(30,16)-(30,57)
(30,25)-(30,38)
(30,25)-(30,36)
(30,37)-(30,38)
(30,42)-(30,57)
(30,42)-(30,54)
(30,55)-(30,57)
(31,14)-(31,53)
(31,23)-(31,34)
(31,23)-(31,32)
(31,33)-(31,34)
(31,38)-(31,53)
(31,38)-(31,50)
(31,51)-(31,53)
(32,13)-(32,32)
(32,13)-(32,25)
(32,26)-(32,32)
(33,13)-(33,32)
(33,13)-(33,25)
(33,26)-(33,32)
*)
