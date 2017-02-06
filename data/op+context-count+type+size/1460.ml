
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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ (("+" exprToString y) ^ ")/2)"))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 (" ? " ^
                    ((exprToString y) ^ (" : " ^ ((exprToString z) ^ ")")))))));;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("+" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((exprToString w) ^
           ("<" ^
              ((exprToString x) ^
                 (" ? " ^
                    ((exprToString y) ^ (" : " ^ ((exprToString z) ^ ")")))))));;

*)

(* changed spans
(18,36)-(18,54)
(18,40)-(18,52)
*)

(* type error slice
(11,22)-(26,73)
(12,3)-(26,73)
(12,3)-(26,73)
(12,3)-(26,73)
(12,3)-(26,73)
(12,3)-(26,73)
(12,3)-(26,73)
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
(18,7)-(18,11)
(18,12)-(18,13)
(18,16)-(18,28)
(18,16)-(18,30)
(18,29)-(18,30)
(18,32)-(18,33)
(18,36)-(18,39)
(18,36)-(18,54)
(18,40)-(18,52)
(18,53)-(18,54)
(18,56)-(18,57)
*)
