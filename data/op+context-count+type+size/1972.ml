
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

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
(30,12)-(30,21)
(30,17)-(30,21)
(32,12)-(32,21)
(32,17)-(32,21)
(36,25)-(36,37)
(36,25)-(36,61)
(36,38)-(36,49)
(37,20)-(37,49)
(37,33)-(37,43)
(38,22)-(38,53)
(38,35)-(38,47)
(39,17)-(39,43)
(39,30)-(39,41)
(40,15)-(40,39)
(40,28)-(40,37)
(41,14)-(41,26)
(41,27)-(41,33)
(42,14)-(42,26)
(42,27)-(42,33)
*)

(* type error slice
(20,4)-(20,46)
(20,19)-(20,43)
(20,28)-(20,43)
(20,37)-(20,39)
(20,41)-(20,43)
(22,4)-(22,31)
(22,17)-(22,29)
(22,21)-(22,29)
(22,28)-(22,29)
(24,4)-(24,27)
(24,15)-(24,25)
(24,19)-(24,25)
(24,24)-(24,25)
(26,4)-(26,70)
(26,18)-(26,67)
(26,39)-(26,67)
(26,47)-(26,48)
(26,50)-(26,51)
(26,53)-(26,59)
(26,61)-(26,67)
(28,4)-(28,42)
(28,17)-(28,39)
(28,26)-(28,39)
(28,33)-(28,35)
(28,37)-(28,39)
(30,4)-(30,23)
(30,12)-(30,21)
(30,12)-(30,21)
(30,17)-(30,21)
(32,4)-(32,23)
(32,12)-(32,21)
(32,12)-(32,21)
(32,17)-(32,21)
(34,4)-(42,35)
(34,22)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,3)-(42,33)
(35,9)-(35,10)
(36,25)-(36,37)
(36,25)-(36,61)
(36,25)-(36,61)
(36,25)-(36,61)
(36,38)-(36,49)
(36,51)-(36,52)
(36,51)-(36,61)
(36,54)-(36,55)
(36,57)-(36,58)
(36,60)-(36,61)
(37,20)-(37,32)
(37,20)-(37,49)
(37,20)-(37,49)
(37,20)-(37,49)
(37,33)-(37,43)
(37,45)-(37,46)
(37,45)-(37,49)
(37,48)-(37,49)
(38,22)-(38,34)
(38,22)-(38,53)
(38,22)-(38,53)
(38,22)-(38,53)
(38,35)-(38,47)
(38,49)-(38,50)
(38,49)-(38,53)
(38,52)-(38,53)
(39,17)-(39,29)
(39,17)-(39,43)
(39,17)-(39,43)
(39,17)-(39,43)
(39,30)-(39,41)
(39,42)-(39,43)
(40,15)-(40,27)
(40,15)-(40,39)
(40,15)-(40,39)
(40,15)-(40,39)
(40,28)-(40,37)
(40,38)-(40,39)
(41,14)-(41,26)
(41,14)-(41,33)
(41,14)-(41,33)
(41,27)-(41,33)
(42,14)-(42,26)
(42,14)-(42,33)
(42,14)-(42,33)
(42,27)-(42,33)
*)
