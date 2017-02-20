
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let a = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((e t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((e t) ^ ")")
  | Average (s,t) -> "((" ^ ((e s) ^ ("+" ^ ((e t) ^ ")/2)")))
  | Times (s,t) -> (e s) ^ ("*" ^ (e t))
  | Thresh (s,t,u,v) ->
      "(" ^
        ((e s) ^ ("<" ^ ((e t) ^ ("?" ^ ((e u) ^ (":" ^ ((e v) ^ ")")))))));;


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
  | Sine t -> "sin(pi*" ^ ((exprToString t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((exprToString t) ^ ")")
  | Average (s,t) ->
      "((" ^ ((exprToString s) ^ ("+" ^ ((exprToString t) ^ ")/2)")))
  | Times (s,t) -> (exprToString s) ^ ("*" ^ (exprToString t))
  | Thresh (s,t,u,v) ->
      "(" ^
        ((exprToString s) ^
           ("<" ^
              ((exprToString t) ^
                 ("?" ^ ((exprToString u) ^ (":" ^ ((exprToString v) ^ ")")))))));;

*)

(* changed spans
(12,2)-(22,75)
(12,10)-(12,22)
(16,28)-(16,29)
(17,30)-(17,31)
(18,30)-(18,31)
(18,46)-(18,47)
(19,20)-(19,21)
(19,35)-(19,36)
(22,10)-(22,11)
(22,26)-(22,27)
(22,42)-(22,43)
(22,58)-(22,59)
*)

(* type error slice
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,8)-(13,9)
(16,27)-(16,32)
(16,28)-(16,29)
*)

(* all spans
(11,21)-(22,75)
(12,2)-(22,75)
(12,10)-(12,22)
(13,2)-(22,75)
(13,8)-(13,9)
(14,13)-(14,16)
(15,13)-(15,16)
(16,14)-(16,39)
(16,24)-(16,25)
(16,14)-(16,23)
(16,26)-(16,39)
(16,33)-(16,34)
(16,27)-(16,32)
(16,28)-(16,29)
(16,30)-(16,31)
(16,35)-(16,38)
(17,16)-(17,41)
(17,26)-(17,27)
(17,16)-(17,25)
(17,28)-(17,41)
(17,35)-(17,36)
(17,29)-(17,34)
(17,30)-(17,31)
(17,32)-(17,33)
(17,37)-(17,40)
(18,21)-(18,62)
(18,26)-(18,27)
(18,21)-(18,25)
(18,28)-(18,62)
(18,35)-(18,36)
(18,29)-(18,34)
(18,30)-(18,31)
(18,32)-(18,33)
(18,37)-(18,61)
(18,42)-(18,43)
(18,38)-(18,41)
(18,44)-(18,60)
(18,51)-(18,52)
(18,45)-(18,50)
(18,46)-(18,47)
(18,48)-(18,49)
(18,53)-(18,59)
(19,19)-(19,40)
(19,25)-(19,26)
(19,19)-(19,24)
(19,20)-(19,21)
(19,22)-(19,23)
(19,27)-(19,40)
(19,32)-(19,33)
(19,28)-(19,31)
(19,34)-(19,39)
(19,35)-(19,36)
(19,37)-(19,38)
(21,6)-(22,75)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(22,75)
(22,15)-(22,16)
(22,9)-(22,14)
(22,10)-(22,11)
(22,12)-(22,13)
(22,17)-(22,74)
(22,22)-(22,23)
(22,18)-(22,21)
(22,24)-(22,73)
(22,31)-(22,32)
(22,25)-(22,30)
(22,26)-(22,27)
(22,28)-(22,29)
(22,33)-(22,72)
(22,38)-(22,39)
(22,34)-(22,37)
(22,40)-(22,71)
(22,47)-(22,48)
(22,41)-(22,46)
(22,42)-(22,43)
(22,44)-(22,45)
(22,49)-(22,70)
(22,54)-(22,55)
(22,50)-(22,53)
(22,56)-(22,69)
(22,63)-(22,64)
(22,57)-(22,62)
(22,58)-(22,59)
(22,60)-(22,61)
(22,65)-(22,68)
*)
