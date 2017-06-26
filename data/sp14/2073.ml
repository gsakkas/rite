
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
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(27,24)-(27,36)
(27,24)-(27,61)
(27,37)-(27,48)
(28,19)-(28,49)
(28,32)-(28,42)
(29,21)-(29,53)
(29,34)-(29,46)
(30,16)-(30,42)
(30,29)-(30,40)
(31,14)-(31,38)
(31,27)-(31,36)
(32,26)-(32,32)
(33,26)-(33,32)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(13,20)-(13,28)
(13,27)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(15,18)-(15,24)
(15,23)-(15,24)
(17,3)-(17,69)
(17,17)-(17,67)
(19,3)-(19,41)
(19,16)-(19,39)
(21,3)-(21,22)
(21,11)-(21,20)
(23,3)-(23,22)
(23,11)-(23,20)
(26,2)-(33,32)
(27,24)-(27,36)
(27,24)-(27,61)
(27,37)-(27,48)
(28,19)-(28,31)
(28,19)-(28,49)
(28,32)-(28,42)
(29,21)-(29,33)
(29,21)-(29,53)
(29,34)-(29,46)
(30,16)-(30,28)
(30,16)-(30,42)
(30,29)-(30,40)
(31,14)-(31,26)
(31,14)-(31,38)
(31,27)-(31,36)
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
(27,24)-(27,61)
(27,24)-(27,36)
(27,37)-(27,48)
(27,49)-(27,61)
(27,50)-(27,51)
(27,53)-(27,54)
(27,56)-(27,57)
(27,59)-(27,60)
(28,19)-(28,49)
(28,19)-(28,31)
(28,32)-(28,42)
(28,43)-(28,49)
(28,44)-(28,45)
(28,47)-(28,48)
(29,21)-(29,53)
(29,21)-(29,33)
(29,34)-(29,46)
(29,47)-(29,53)
(29,48)-(29,49)
(29,51)-(29,52)
(30,16)-(30,42)
(30,16)-(30,28)
(30,29)-(30,40)
(30,41)-(30,42)
(31,14)-(31,38)
(31,14)-(31,26)
(31,27)-(31,36)
(31,37)-(31,38)
(32,13)-(32,32)
(32,13)-(32,25)
(32,26)-(32,32)
(33,13)-(33,32)
(33,13)-(33,25)
(33,26)-(33,32)
*)
