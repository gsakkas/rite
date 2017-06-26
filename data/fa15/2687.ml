
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
  | Sine i -> "sin" ^ (exprToString i)
  | Cosine i -> "cos" ^ (exprToString i)
  | Average (i1,i2) -> ((exprToString i1) + (exprToString i2)) / 2;;


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
(12,2)-(17,66)
(15,22)-(15,38)
(16,16)-(16,40)
(16,24)-(16,40)
(17,23)-(17,62)
(17,23)-(17,66)
(17,24)-(17,41)
(17,44)-(17,61)
(17,65)-(17,66)
*)

(* type error slice
(12,2)-(17,66)
(13,13)-(13,16)
(15,14)-(15,38)
(15,20)-(15,21)
(15,22)-(15,38)
(15,23)-(15,35)
(17,23)-(17,62)
(17,23)-(17,66)
(17,24)-(17,41)
(17,25)-(17,37)
(17,44)-(17,61)
(17,45)-(17,57)
*)

(* all spans
(11,21)-(17,66)
(12,2)-(17,66)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,38)
(15,20)-(15,21)
(15,14)-(15,19)
(15,22)-(15,38)
(15,23)-(15,35)
(15,36)-(15,37)
(16,16)-(16,40)
(16,22)-(16,23)
(16,16)-(16,21)
(16,24)-(16,40)
(16,25)-(16,37)
(16,38)-(16,39)
(17,23)-(17,66)
(17,23)-(17,62)
(17,24)-(17,41)
(17,25)-(17,37)
(17,38)-(17,40)
(17,44)-(17,61)
(17,45)-(17,57)
(17,58)-(17,60)
(17,65)-(17,66)
*)
