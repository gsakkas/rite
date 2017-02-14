
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
(19,25)-(19,67)
(19,47)-(19,67)
(19,66)-(19,67)
(20,23)-(20,37)
(20,23)-(20,64)
(20,40)-(20,41)
(20,43)-(20,46)
(20,43)-(20,64)
(20,47)-(20,48)
(22,7)-(22,10)
(22,7)-(27,75)
(22,11)-(22,12)
(23,11)-(23,26)
(23,11)-(27,75)
(23,29)-(23,30)
(24,13)-(24,17)
(24,13)-(27,75)
(24,18)-(24,19)
(25,17)-(27,75)
(25,35)-(25,36)
(26,19)-(27,75)
*)

(* type error slice
(17,23)-(17,46)
(17,30)-(17,34)
(17,30)-(17,46)
(19,25)-(19,67)
(19,47)-(19,51)
(19,47)-(19,61)
(19,47)-(19,67)
(19,47)-(19,67)
(20,43)-(20,64)
(20,47)-(20,48)
(20,50)-(20,54)
(20,50)-(20,64)
(27,52)-(27,56)
(27,52)-(27,67)
(27,52)-(27,75)
(27,70)-(27,71)
*)
