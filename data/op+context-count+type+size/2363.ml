
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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           (("<" exprToString e2) ^
              (" ? " ^
                 ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")"))))));;


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
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e) ^ ")/2")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(23,14)-(23,33)
(23,18)-(23,30)
*)

(* type error slice
(11,22)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,3)-(25,72)
(12,9)-(12,10)
(15,15)-(15,24)
(15,15)-(15,50)
(15,25)-(15,26)
(15,29)-(15,41)
(15,29)-(15,43)
(15,29)-(15,43)
(15,29)-(15,50)
(15,29)-(15,50)
(15,42)-(15,43)
(15,45)-(15,46)
(15,47)-(15,50)
(16,17)-(16,26)
(16,17)-(16,52)
(16,27)-(16,28)
(16,31)-(16,43)
(16,31)-(16,45)
(16,31)-(16,52)
(16,44)-(16,45)
(16,47)-(16,48)
(16,49)-(16,52)
(18,7)-(18,10)
(18,7)-(18,65)
(18,11)-(18,12)
(18,15)-(18,27)
(18,15)-(18,29)
(18,15)-(18,29)
(18,15)-(18,65)
(18,28)-(18,29)
(18,31)-(18,32)
(18,34)-(18,37)
(18,34)-(18,65)
(18,38)-(18,39)
(18,42)-(18,54)
(18,42)-(18,56)
(18,42)-(18,65)
(18,55)-(18,56)
(18,58)-(18,59)
(18,60)-(18,65)
(19,23)-(19,35)
(19,23)-(19,38)
(19,23)-(19,65)
(19,36)-(19,38)
(19,40)-(19,41)
(19,43)-(19,46)
(19,43)-(19,65)
(19,47)-(19,48)
(19,50)-(19,62)
(19,50)-(19,65)
(19,63)-(19,65)
(21,7)-(21,10)
(21,11)-(21,12)
(22,11)-(22,23)
(22,11)-(22,26)
(22,24)-(22,26)
(22,28)-(22,29)
(23,14)-(23,17)
(23,14)-(23,33)
(23,18)-(23,30)
(23,31)-(23,33)
(23,35)-(23,36)
*)
