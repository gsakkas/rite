
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
(12,3)-(17,67)
(15,24)-(15,38)
(16,17)-(16,40)
(16,26)-(16,40)
(17,26)-(17,38)
(17,26)-(17,41)
(17,26)-(17,61)
(17,26)-(17,67)
(17,39)-(17,41)
(17,46)-(17,58)
(17,46)-(17,61)
(17,59)-(17,61)
(17,66)-(17,67)
*)

(* type error slice
(12,3)-(17,67)
(12,3)-(17,67)
(13,14)-(13,17)
(15,15)-(15,38)
(15,21)-(15,22)
(15,24)-(15,36)
(15,24)-(15,38)
(17,26)-(17,38)
(17,26)-(17,41)
(17,26)-(17,61)
(17,26)-(17,61)
(17,26)-(17,67)
(17,46)-(17,58)
(17,46)-(17,61)
*)
