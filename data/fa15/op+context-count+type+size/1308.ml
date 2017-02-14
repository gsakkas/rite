
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
(14,3)-(28,75)
(17,18)-(17,20)
(17,18)-(17,52)
(17,21)-(17,22)
(18,19)-(18,28)
(18,19)-(18,56)
(18,29)-(18,30)
(18,33)-(18,37)
(18,33)-(18,56)
(18,39)-(18,42)
(18,51)-(18,52)
(18,53)-(18,56)
(20,7)-(20,11)
(20,7)-(20,69)
(20,12)-(20,13)
(20,16)-(20,30)
(20,16)-(20,69)
(20,33)-(20,34)
(20,36)-(20,39)
(20,36)-(20,69)
(20,40)-(20,41)
(20,44)-(20,69)
(20,61)-(20,62)
(20,63)-(20,69)
(21,23)-(21,37)
(21,23)-(21,64)
(21,40)-(21,41)
(21,43)-(21,46)
(21,43)-(21,64)
(21,47)-(21,48)
(23,7)-(23,10)
(23,7)-(28,75)
(23,11)-(23,12)
(24,11)-(24,26)
(24,11)-(28,75)
(24,29)-(24,30)
(25,13)-(28,75)
*)

(* type error slice
(17,18)-(17,52)
(17,21)-(17,22)
(17,24)-(17,27)
(17,24)-(17,52)
(17,29)-(17,52)
(17,36)-(17,40)
(17,36)-(17,52)
(18,33)-(18,37)
(18,33)-(18,48)
(18,33)-(18,56)
(18,51)-(18,52)
(20,44)-(20,48)
(20,44)-(20,58)
(20,44)-(20,69)
(20,61)-(20,62)
(21,43)-(21,64)
(21,47)-(21,48)
(21,50)-(21,54)
(21,50)-(21,64)
(28,52)-(28,56)
(28,52)-(28,67)
(28,52)-(28,75)
(28,70)-(28,71)
*)
