
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval ex1) *. ((eval ex1) + (eval ex2))) *
          (((eval ex1) + (eval ex2)) + (eval ex3)))
         * ((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)))
        *
        (((((eval ex1) + (eval ex2)) + (eval ex3)) + (eval ex4)) + (eval ex5));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | FiboPlus of expr* expr* expr* expr* expr
  | TheThing of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine ex -> sin (pi *. (eval (ex, x, y)))
  | Cosine ex -> cos (pi *. (eval (ex, x, y)))
  | Average (ex1,ex2) -> ((eval (ex1, x, y)) +. (eval (ex2, x, y))) /. 2.
  | Times (ex1,ex2) -> (eval (ex1, x, y)) *. (eval (ex2, x, y))
  | Thresh (ex1,ex2,ex3,ex4) ->
      if (eval (ex1, x, y)) < (eval (ex2, x, y))
      then eval (ex3, x, y)
      else eval (ex4, x, y)
  | FiboPlus (ex1,ex2,ex3,ex4,ex5) ->
      ((((eval (ex1, x, y)) *. ((eval (ex1, x, y)) +. (eval (ex2, x, y)))) *.
          (((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y))))
         *.
         ((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y))))
        *.
        (((((eval (ex1, x, y)) +. (eval (ex2, x, y))) +. (eval (ex3, x, y)))
            +. (eval (ex4, x, y)))
           +. (eval (ex5, x, y)));;

*)

(* changed spans
(28,11)-(28,15)
(28,11)-(28,19)
(28,11)-(29,49)
(28,11)-(30,65)
(28,11)-(32,77)
(28,16)-(28,19)
(28,26)-(28,34)
(28,26)-(28,47)
(28,31)-(28,34)
(28,39)-(28,43)
(28,39)-(28,47)
(28,44)-(28,47)
(29,14)-(29,22)
(29,14)-(29,35)
(29,14)-(29,49)
(29,19)-(29,22)
(29,27)-(29,35)
(29,32)-(29,35)
(29,41)-(29,45)
(29,41)-(29,49)
(29,46)-(29,49)
(30,16)-(30,24)
(30,16)-(30,37)
(30,16)-(30,51)
(30,16)-(30,65)
(30,21)-(30,24)
(30,29)-(30,37)
(30,34)-(30,37)
(30,43)-(30,51)
(30,48)-(30,51)
(30,57)-(30,61)
(30,57)-(30,65)
(30,62)-(30,65)
(32,14)-(32,22)
(32,14)-(32,35)
(32,14)-(32,49)
(32,14)-(32,63)
(32,14)-(32,77)
(32,19)-(32,22)
(32,27)-(32,35)
(32,32)-(32,35)
(32,41)-(32,45)
(32,41)-(32,49)
(32,46)-(32,49)
(32,55)-(32,63)
(32,60)-(32,63)
(32,69)-(32,73)
(32,74)-(32,77)
*)

(* type error slice
(16,3)-(32,77)
(17,14)-(17,15)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(28,11)-(28,15)
(28,11)-(28,19)
(28,11)-(28,47)
(28,11)-(29,49)
(28,11)-(32,77)
(28,16)-(28,19)
(28,26)-(28,30)
(28,26)-(28,34)
(28,26)-(28,47)
(28,31)-(28,34)
(28,39)-(28,43)
(28,39)-(28,47)
(28,44)-(28,47)
(29,14)-(29,18)
(29,14)-(29,22)
(29,19)-(29,22)
(29,27)-(29,31)
(29,27)-(29,35)
(29,32)-(29,35)
(29,41)-(29,45)
(29,41)-(29,49)
(29,46)-(29,49)
(30,16)-(30,20)
(30,16)-(30,24)
(30,21)-(30,24)
(30,29)-(30,33)
(30,29)-(30,37)
(30,34)-(30,37)
(30,43)-(30,47)
(30,43)-(30,51)
(30,48)-(30,51)
(30,57)-(30,61)
(30,57)-(30,65)
(30,62)-(30,65)
(32,14)-(32,18)
(32,14)-(32,22)
(32,19)-(32,22)
(32,27)-(32,31)
(32,27)-(32,35)
(32,32)-(32,35)
(32,41)-(32,45)
(32,41)-(32,49)
(32,46)-(32,49)
(32,55)-(32,59)
(32,55)-(32,63)
(32,60)-(32,63)
(32,69)-(32,73)
(32,69)-(32,77)
(32,74)-(32,77)
*)
