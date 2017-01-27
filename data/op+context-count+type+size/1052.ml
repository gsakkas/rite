
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
           +. (eval (ex5, x, y)))
  | TheThing (ex1,ex2,ex3) ->
      (((eval (ex1, x, y)) * (sin (pi * (eval (ex2, x, y))))) *
         (cos (pi * (eval (ex3, x, y)))))
        / 2;;


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
           +. (eval (ex5, x, y)))
  | TheThing (ex1,ex2,ex3) ->
      (((eval (ex1, x, y)) *. (sin (pi *. (eval (ex2, x, y))))) *.
         (cos (pi *. (eval (ex3, x, y)))))
        /. 2.;;

*)

(* changed spans
(38,10)-(38,25)
(38,10)-(38,57)
(38,10)-(39,37)
(38,10)-(40,12)
(38,36)-(38,57)
(39,16)-(39,37)
(40,11)-(40,12)
*)

(* type error slice
(13,4)-(13,29)
(13,10)-(13,26)
(16,3)-(40,12)
(17,14)-(17,15)
(19,28)-(19,32)
(19,28)-(19,42)
(19,34)-(19,36)
(19,34)-(19,42)
(19,38)-(19,39)
(19,41)-(19,42)
(38,10)-(38,14)
(38,10)-(38,25)
(38,10)-(38,57)
(38,10)-(40,12)
(38,16)-(38,19)
(38,16)-(38,25)
(38,21)-(38,22)
(38,24)-(38,25)
(38,31)-(38,34)
(38,31)-(38,57)
(38,36)-(38,38)
(38,36)-(38,57)
(38,42)-(38,46)
(38,42)-(38,57)
(38,48)-(38,51)
(38,48)-(38,57)
(38,53)-(38,54)
(38,56)-(38,57)
(39,11)-(39,14)
(39,11)-(39,37)
(39,16)-(39,18)
(39,16)-(39,37)
(39,22)-(39,26)
(39,22)-(39,37)
(39,28)-(39,31)
(39,28)-(39,37)
(39,33)-(39,34)
(39,36)-(39,37)
*)
