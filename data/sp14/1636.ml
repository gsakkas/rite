
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ (("*" (exprToString t2)) ^ ")"))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "(sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "(cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "( " ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2")))
  | Times (t1,t2) ->
      "(" ^ ((exprToString t1) ^ ("*" ^ ((exprToString t2) ^ ")")))
  | Thresh (th1,th2,th3,th4) -> "bullshit";;

*)

(* changed spans
(20,34)-(20,57)
(20,39)-(20,56)
*)

(* type error slice
(20,34)-(20,57)
(20,35)-(20,38)
*)

(* all spans
(11,21)-(21,42)
(12,2)-(21,42)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,16)-(15,55)
(15,27)-(15,28)
(15,16)-(15,26)
(15,29)-(15,55)
(15,49)-(15,50)
(15,30)-(15,48)
(15,31)-(15,43)
(15,44)-(15,47)
(15,51)-(15,54)
(16,18)-(16,57)
(16,29)-(16,30)
(16,18)-(16,28)
(16,31)-(16,57)
(16,51)-(16,52)
(16,32)-(16,50)
(16,33)-(16,45)
(16,46)-(16,49)
(16,53)-(16,56)
(18,6)-(18,70)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,70)
(18,32)-(18,33)
(18,14)-(18,31)
(18,15)-(18,27)
(18,28)-(18,30)
(18,34)-(18,69)
(18,39)-(18,40)
(18,35)-(18,38)
(18,41)-(18,68)
(18,60)-(18,61)
(18,42)-(18,59)
(18,43)-(18,55)
(18,56)-(18,58)
(18,62)-(18,67)
(20,6)-(20,65)
(20,10)-(20,11)
(20,6)-(20,9)
(20,12)-(20,65)
(20,31)-(20,32)
(20,13)-(20,30)
(20,14)-(20,26)
(20,27)-(20,29)
(20,33)-(20,64)
(20,58)-(20,59)
(20,34)-(20,57)
(20,35)-(20,38)
(20,39)-(20,56)
(20,40)-(20,52)
(20,53)-(20,55)
(20,60)-(20,63)
(21,32)-(21,42)
*)
