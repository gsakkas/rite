
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
  | VarX  -> "%s" e
  | VarY  -> "%s" e
  | Sine e1 -> "%s" e1
  | Cosine e2 -> "%s" e2
  | Average (e3,e4) -> "%s %s" e3 e4
  | Times (e5,e6) -> "%s %s" e5 e6
  | Thresh (e7,e8,e9,e0) -> "%s %s %s %s" e7 e8 e9 e0;;


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
  | Sine e1 -> Printf.sprintf "%s" (exprToString e1)
  | Cosine e2 -> Printf.sprintf "%s" (exprToString e2)
  | Average (e3,e4) ->
      Printf.sprintf "%s %s" (exprToString e3) (exprToString e4)
  | Times (e5,e6) ->
      Printf.sprintf "%s %s" (exprToString e5) (exprToString e6)
  | Thresh (e7,e8,e9,e0) ->
      Printf.sprintf "%s %s %s %s" (exprToString e7) (exprToString e8)
        (exprToString e9) (exprToString e0)
  | _ -> "";;

*)

(* changed spans
(12,3)-(19,54)
(12,9)-(12,10)
(13,14)-(13,18)
(13,14)-(13,20)
(14,14)-(14,18)
(14,14)-(14,20)
(14,19)-(14,20)
(15,16)-(15,20)
(16,18)-(16,22)
(16,18)-(16,25)
(16,23)-(16,25)
(17,24)-(17,31)
(17,24)-(17,37)
(17,32)-(17,34)
(17,35)-(17,37)
(18,22)-(18,29)
(18,22)-(18,35)
(18,30)-(18,32)
(18,33)-(18,35)
(19,29)-(19,42)
(19,29)-(19,54)
(19,43)-(19,45)
(19,46)-(19,48)
(19,49)-(19,51)
(19,52)-(19,54)
*)

(* type error slice
(11,4)-(19,56)
(11,22)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,3)-(19,54)
(12,9)-(12,10)
(13,14)-(13,18)
(13,14)-(13,20)
(13,14)-(13,20)
(13,19)-(13,20)
(14,14)-(14,18)
(14,14)-(14,20)
(14,14)-(14,20)
(14,19)-(14,20)
(15,16)-(15,20)
(15,16)-(15,23)
(15,21)-(15,23)
(16,18)-(16,22)
(16,18)-(16,25)
(16,23)-(16,25)
(17,24)-(17,31)
(17,24)-(17,37)
(17,32)-(17,34)
(17,35)-(17,37)
(18,22)-(18,29)
(18,22)-(18,35)
(18,30)-(18,32)
(18,33)-(18,35)
(19,29)-(19,42)
(19,29)-(19,54)
(19,43)-(19,45)
(19,46)-(19,48)
(19,49)-(19,51)
(19,52)-(19,54)
*)
