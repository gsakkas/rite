
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
  | Sine sine -> sin (eval (sine, x, y))
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
(11,15)-(26,75)
(12,3)-(26,75)
(15,23)-(15,39)
(16,19)-(16,28)
(16,19)-(16,56)
(16,29)-(16,30)
(16,33)-(16,37)
(16,33)-(16,56)
(16,39)-(16,42)
(16,51)-(16,52)
(16,53)-(16,56)
(18,7)-(18,11)
(18,7)-(18,69)
(18,12)-(18,13)
(18,16)-(18,30)
(18,16)-(18,69)
(18,33)-(18,34)
(18,36)-(18,39)
(18,36)-(18,69)
(18,40)-(18,41)
(18,44)-(18,69)
(18,61)-(18,62)
(18,63)-(18,69)
(19,23)-(19,37)
(19,23)-(19,64)
(19,40)-(19,41)
(19,43)-(19,46)
(19,43)-(19,64)
(19,47)-(19,48)
(21,7)-(21,10)
(21,7)-(26,75)
(21,11)-(21,12)
(22,11)-(22,26)
(22,11)-(26,75)
(22,29)-(22,30)
(23,13)-(23,17)
(23,13)-(26,75)
(23,18)-(23,19)
(24,17)-(26,75)
(24,35)-(24,36)
(25,19)-(26,75)
*)

(* type error slice
(15,18)-(15,21)
(15,18)-(15,39)
(15,23)-(15,27)
(15,23)-(15,39)
(16,33)-(16,37)
(16,33)-(16,48)
(16,33)-(16,56)
(16,51)-(16,52)
(18,44)-(18,48)
(18,44)-(18,58)
(18,44)-(18,69)
(18,61)-(18,62)
(19,43)-(19,64)
(19,47)-(19,48)
(19,50)-(19,54)
(19,50)-(19,64)
(26,52)-(26,56)
(26,52)-(26,67)
(26,52)-(26,75)
(26,70)-(26,71)
*)
