
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
  | Sine i -> "sin" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Cosine i -> "cos" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ (exprToString i2 ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ (" * " ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (" : " ^ ((exprToString i3) ^ ")")))))));;


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
  | Sine i -> "sin" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Cosine i -> "cos" ^ ("(pi*" ^ ((exprToString i) ^ ")"))
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ ((exprToString i2) ^ ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ (" * " ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (" : " ^ ((exprToString i3) ^ ")")))))));;

*)

(* changed spans
(18,44)-(18,56)
*)

(* type error slice
(15,32)-(15,56)
(15,33)-(15,49)
(15,34)-(15,46)
(15,50)-(15,51)
(18,43)-(18,67)
(18,44)-(18,56)
*)

(* all spans
(11,21)-(26,81)
(12,2)-(26,81)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,57)
(15,20)-(15,21)
(15,14)-(15,19)
(15,22)-(15,57)
(15,30)-(15,31)
(15,23)-(15,29)
(15,32)-(15,56)
(15,50)-(15,51)
(15,33)-(15,49)
(15,34)-(15,46)
(15,47)-(15,48)
(15,52)-(15,55)
(16,16)-(16,59)
(16,22)-(16,23)
(16,16)-(16,21)
(16,24)-(16,59)
(16,32)-(16,33)
(16,25)-(16,31)
(16,34)-(16,58)
(16,52)-(16,53)
(16,35)-(16,51)
(16,36)-(16,48)
(16,49)-(16,50)
(16,54)-(16,57)
(18,6)-(18,69)
(18,11)-(18,12)
(18,6)-(18,10)
(18,13)-(18,69)
(18,32)-(18,33)
(18,14)-(18,31)
(18,15)-(18,27)
(18,28)-(18,30)
(18,34)-(18,68)
(18,41)-(18,42)
(18,35)-(18,40)
(18,43)-(18,67)
(18,44)-(18,56)
(18,57)-(18,59)
(18,60)-(18,66)
(19,21)-(19,68)
(19,39)-(19,40)
(19,21)-(19,38)
(19,22)-(19,34)
(19,35)-(19,37)
(19,41)-(19,68)
(19,48)-(19,49)
(19,42)-(19,47)
(19,50)-(19,67)
(19,51)-(19,63)
(19,64)-(19,66)
(21,6)-(26,81)
(21,10)-(21,11)
(21,6)-(21,9)
(22,8)-(26,81)
(22,27)-(22,28)
(22,9)-(22,26)
(22,10)-(22,22)
(22,23)-(22,25)
(23,11)-(26,80)
(23,16)-(23,17)
(23,12)-(23,15)
(24,14)-(26,79)
(24,33)-(24,34)
(24,15)-(24,32)
(24,16)-(24,28)
(24,29)-(24,31)
(25,17)-(26,78)
(25,24)-(25,25)
(25,18)-(25,23)
(26,20)-(26,77)
(26,39)-(26,40)
(26,21)-(26,38)
(26,22)-(26,34)
(26,35)-(26,37)
(26,41)-(26,76)
(26,48)-(26,49)
(26,42)-(26,47)
(26,50)-(26,75)
(26,69)-(26,70)
(26,51)-(26,68)
(26,52)-(26,64)
(26,65)-(26,67)
(26,71)-(26,74)
*)
