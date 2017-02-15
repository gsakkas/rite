
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
(27,24)-(27,76)
(28,19)-(28,64)
(29,21)-(29,68)
(30,16)-(30,57)
(31,14)-(31,53)
(32,26)-(32,32)
(33,13)-(33,25)
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
