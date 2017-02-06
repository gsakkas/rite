
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
(20,36)-(20,56)
(20,41)-(20,56)
*)

(* type error slice
(11,22)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,3)-(21,43)
(12,9)-(12,10)
(15,17)-(15,27)
(15,17)-(15,55)
(15,28)-(15,29)
(15,32)-(15,44)
(15,32)-(15,48)
(15,32)-(15,48)
(15,32)-(15,55)
(15,32)-(15,55)
(15,45)-(15,48)
(15,50)-(15,51)
(15,52)-(15,55)
(16,19)-(16,29)
(16,19)-(16,57)
(16,30)-(16,31)
(16,34)-(16,46)
(16,34)-(16,50)
(16,34)-(16,57)
(16,47)-(16,50)
(16,52)-(16,53)
(16,54)-(16,57)
(18,7)-(18,11)
(18,7)-(18,68)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,31)
(18,16)-(18,68)
(18,29)-(18,31)
(18,33)-(18,34)
(18,36)-(18,39)
(18,36)-(18,68)
(18,40)-(18,41)
(18,44)-(18,56)
(18,44)-(18,59)
(18,44)-(18,68)
(18,57)-(18,59)
(18,61)-(18,62)
(18,63)-(18,68)
(20,7)-(20,10)
(20,11)-(20,12)
(20,15)-(20,27)
(20,15)-(20,30)
(20,28)-(20,30)
(20,32)-(20,33)
(20,36)-(20,39)
(20,36)-(20,56)
(20,41)-(20,53)
(20,41)-(20,56)
(20,54)-(20,56)
(20,59)-(20,60)
*)
