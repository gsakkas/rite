
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine sine -> sin sine
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
(11,14)-(26,81)
(12,2)-(26,81)
(15,21)-(15,25)
(16,18)-(16,27)
(16,18)-(16,56)
(16,28)-(16,29)
(16,30)-(16,56)
(16,31)-(16,49)
(16,38)-(16,41)
(16,43)-(16,44)
(16,50)-(16,51)
(16,52)-(16,55)
(18,6)-(18,10)
(18,6)-(18,71)
(18,11)-(18,12)
(18,13)-(18,71)
(18,14)-(18,31)
(18,32)-(18,33)
(18,34)-(18,70)
(18,35)-(18,38)
(18,39)-(18,40)
(18,41)-(18,69)
(18,60)-(18,61)
(18,62)-(18,68)
(19,21)-(19,38)
(19,21)-(19,66)
(19,39)-(19,40)
(19,41)-(19,66)
(19,42)-(19,45)
(19,46)-(19,47)
(21,6)-(21,9)
(21,6)-(26,81)
(21,10)-(21,11)
(22,8)-(26,81)
(22,9)-(22,27)
(22,28)-(22,29)
(23,11)-(26,80)
(23,12)-(23,16)
(23,17)-(23,18)
(24,14)-(26,79)
(24,34)-(24,35)
(25,17)-(26,78)
(25,18)-(25,21)
(25,22)-(25,23)
(26,20)-(26,77)
*)

(* type error slice
(12,2)-(26,81)
(15,17)-(15,20)
(15,17)-(15,25)
(15,21)-(15,25)
*)
