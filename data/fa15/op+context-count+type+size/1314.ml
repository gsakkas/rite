
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
  | Average (e1,e2) -> (eval (e1, x, y)) +. ((eval (e2, x, y)) / 2)
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
(19,23)-(19,67)
(19,44)-(19,67)
(19,65)-(19,66)
(20,21)-(20,38)
(20,21)-(20,66)
(20,39)-(20,40)
(20,41)-(20,66)
(20,42)-(20,45)
(20,46)-(20,47)
(22,6)-(22,9)
(22,6)-(27,81)
(22,10)-(22,11)
(23,8)-(27,81)
(23,9)-(23,27)
(23,28)-(23,29)
(24,11)-(27,80)
(24,12)-(24,16)
(24,17)-(24,18)
(25,14)-(27,79)
(25,34)-(25,35)
(26,17)-(27,78)
*)

(* type error slice
(17,21)-(17,48)
(17,28)-(17,47)
(17,29)-(17,33)
(19,23)-(19,67)
(19,44)-(19,67)
(19,44)-(19,67)
(19,45)-(19,62)
(19,46)-(19,50)
(20,41)-(20,66)
(20,46)-(20,47)
(20,48)-(20,65)
(20,49)-(20,53)
(27,49)-(27,75)
(27,50)-(27,68)
(27,51)-(27,55)
(27,69)-(27,70)
*)
