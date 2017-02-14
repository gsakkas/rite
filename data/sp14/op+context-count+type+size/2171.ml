
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
(12,2)-(19,53)
(12,8)-(12,9)
(13,13)-(13,17)
(13,13)-(13,19)
(14,13)-(14,17)
(14,13)-(14,19)
(14,18)-(14,19)
(15,15)-(15,19)
(16,17)-(16,21)
(16,17)-(16,24)
(16,22)-(16,24)
(17,23)-(17,30)
(17,23)-(17,36)
(17,31)-(17,33)
(17,34)-(17,36)
(18,21)-(18,28)
(18,21)-(18,34)
(18,29)-(18,31)
(18,32)-(18,34)
(19,28)-(19,41)
(19,28)-(19,53)
(19,42)-(19,44)
(19,45)-(19,47)
(19,48)-(19,50)
(19,51)-(19,53)
*)

(* type error slice
(13,13)-(13,17)
(13,13)-(13,19)
(14,13)-(14,17)
(14,13)-(14,19)
(15,15)-(15,19)
(15,15)-(15,22)
(16,17)-(16,21)
(16,17)-(16,24)
(17,23)-(17,30)
(17,23)-(17,36)
(18,21)-(18,28)
(18,21)-(18,34)
(19,28)-(19,41)
(19,28)-(19,53)
*)
