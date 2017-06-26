
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
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(25,24)-(25,36)
(25,24)-(25,63)
(25,37)-(25,43)
(25,44)-(25,63)
(25,45)-(25,58)
(25,46)-(25,53)
(25,47)-(25,48)
(26,19)-(26,49)
(26,32)-(26,42)
(27,21)-(27,53)
(27,34)-(27,46)
(28,16)-(28,42)
(28,29)-(28,40)
(29,14)-(29,38)
(29,27)-(29,36)
(30,26)-(30,32)
(31,26)-(31,32)
*)

(* type error slice
(11,3)-(11,45)
(11,18)-(11,43)
(13,3)-(13,30)
(13,16)-(13,28)
(15,3)-(15,26)
(15,14)-(15,24)
(17,3)-(17,41)
(17,16)-(17,39)
(19,3)-(19,22)
(19,11)-(19,20)
(21,3)-(21,22)
(21,11)-(21,20)
(24,2)-(31,32)
(25,24)-(25,36)
(25,24)-(25,63)
(25,37)-(25,43)
(25,44)-(25,63)
(25,45)-(25,58)
(25,46)-(25,53)
(25,47)-(25,48)
(25,51)-(25,52)
(25,56)-(25,57)
(25,61)-(25,62)
(26,19)-(26,31)
(26,19)-(26,49)
(26,32)-(26,42)
(27,21)-(27,33)
(27,21)-(27,53)
(27,34)-(27,46)
(28,16)-(28,28)
(28,16)-(28,42)
(28,29)-(28,40)
(29,14)-(29,26)
(29,14)-(29,38)
(29,27)-(29,36)
(30,13)-(30,25)
(30,13)-(30,32)
(30,26)-(30,32)
(31,13)-(31,25)
(31,13)-(31,32)
(31,26)-(31,32)
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
(17,16)-(17,39)
(17,25)-(17,39)
(17,32)-(17,34)
(17,36)-(17,38)
(19,11)-(19,20)
(19,16)-(19,20)
(21,11)-(21,20)
(21,16)-(21,20)
(23,21)-(31,32)
(24,2)-(31,32)
(24,8)-(24,9)
(25,24)-(25,63)
(25,24)-(25,36)
(25,37)-(25,43)
(25,44)-(25,63)
(25,45)-(25,58)
(25,46)-(25,53)
(25,47)-(25,48)
(25,51)-(25,52)
(25,56)-(25,57)
(25,61)-(25,62)
(26,19)-(26,49)
(26,19)-(26,31)
(26,32)-(26,42)
(26,43)-(26,49)
(26,44)-(26,45)
(26,47)-(26,48)
(27,21)-(27,53)
(27,21)-(27,33)
(27,34)-(27,46)
(27,47)-(27,53)
(27,48)-(27,49)
(27,51)-(27,52)
(28,16)-(28,42)
(28,16)-(28,28)
(28,29)-(28,40)
(28,41)-(28,42)
(29,14)-(29,38)
(29,14)-(29,26)
(29,27)-(29,36)
(29,37)-(29,38)
(30,13)-(30,32)
(30,13)-(30,25)
(30,26)-(30,32)
(31,13)-(31,32)
(31,13)-(31,25)
(31,26)-(31,32)
*)
