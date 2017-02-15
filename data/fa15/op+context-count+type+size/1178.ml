
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> "" ^ (sin (pi *. (eval (sine, x, y))))
  | Cosine cos -> "cos(pi*" ^ ((eval (cos, x, y)) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((eval (e1, x, y)) ^ ("+" ^ ((eval (e2, x, y)) ^ ")/2)")))
  | Times (t1,t2) -> (eval (t1, x, y)) ^ ("*" ^ (eval (t2, x, y)))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((eval (th1, x, y)) ^
           ("<*" ^
              ((eval (th2, x, y)) ^
                 ("?" ^
                    ((eval (th3, x, y)) ^ (":" ^ ((eval (th4, x, y)) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin (pi *. (eval (sine, x, y)))
  | Cosine cosine -> cos (pi *. (eval (cosine, x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (t1,t2) -> (eval (t1, x, y)) *. (eval (t2, x, y))
  | Thresh (th1,th2,th3,th4) ->
      if (eval (th1, x, y)) < (eval (th2, x, y))
      then eval (th3, x, y)
      else eval (th4, x, y);;

*)

(* changed spans
(14,2)-(28,81)
(17,17)-(17,19)
(17,17)-(17,55)
(17,20)-(17,21)
(18,18)-(18,27)
(18,18)-(18,56)
(18,28)-(18,29)
(18,30)-(18,56)
(18,32)-(18,36)
(18,38)-(18,41)
(18,50)-(18,51)
(18,52)-(18,55)
(20,6)-(20,10)
(20,6)-(20,71)
(20,11)-(20,12)
(20,13)-(20,71)
(20,14)-(20,31)
(20,32)-(20,33)
(20,34)-(20,70)
(20,35)-(20,38)
(20,39)-(20,40)
(20,41)-(20,69)
(20,60)-(20,61)
(20,62)-(20,68)
(21,21)-(21,38)
(21,21)-(21,66)
(21,39)-(21,40)
(21,41)-(21,66)
(21,42)-(21,45)
(21,46)-(21,47)
(23,6)-(23,9)
(23,6)-(28,81)
(23,10)-(23,11)
(24,8)-(28,81)
(24,9)-(24,27)
(24,28)-(24,29)
(25,11)-(28,80)
(25,17)-(25,18)
*)

(* type error slice
(17,17)-(17,55)
(17,20)-(17,21)
(17,22)-(17,55)
(17,23)-(17,26)
(17,27)-(17,54)
(17,34)-(17,53)
(17,35)-(17,39)
(18,30)-(18,56)
(18,31)-(18,49)
(18,32)-(18,36)
(18,50)-(18,51)
(20,41)-(20,69)
(20,42)-(20,59)
(20,43)-(20,47)
(20,60)-(20,61)
(21,41)-(21,66)
(21,46)-(21,47)
(21,48)-(21,65)
(21,49)-(21,53)
(28,49)-(28,75)
(28,50)-(28,68)
(28,51)-(28,55)
(28,69)-(28,70)
*)
