
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Quad of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Quad (e1,e2,e3) ->
      (((eval (e1, x, y)) ** 2.0) +. ((eval (e1, x, y)) * (eval (e2, x, y))))
        +. (eval (e3, x, y))
  | _ -> failwith "we are seriously writing a lisp compiler god save us all";;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Sqrt of expr
  | Abs of expr
  | Gauss of expr* expr* expr;;

let pi = 4.0 *. (atan 1.0);;

let rec eval (e,x,y) =
  match e with
  | VarX  -> x
  | VarY  -> y
  | Sine e' -> sin (pi *. (eval (e', x, y)))
  | Cosine e' -> cos (pi *. (eval (e', x, y)))
  | Average (e1,e2) -> ((eval (e1, x, y)) +. (eval (e2, x, y))) /. 2.0
  | Times (e1,e2) -> (eval (e1, x, y)) *. (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
  | Sqrt e -> sqrt (abs_float (eval (e, x, y)))
  | Gauss (e1,e2,e3) ->
      2.0 *.
        (exp
           (-.
              ((((eval (e1, x, y)) -. (eval (e2, x, y))) ** 2.0) /.
                 (eval (e3, x, y)))));;

*)

(* changed spans
(17,3)-(32,77)
(30,10)-(30,14)
(30,10)-(30,24)
(30,10)-(30,33)
(30,10)-(30,74)
(30,10)-(31,27)
(30,16)-(30,18)
(30,16)-(30,24)
(30,20)-(30,21)
(30,23)-(30,24)
(30,30)-(30,33)
(30,40)-(30,74)
(31,13)-(31,27)
(32,10)-(32,77)
*)

(* type error slice
(17,3)-(32,77)
(20,28)-(20,32)
(20,28)-(20,42)
(20,34)-(20,36)
(20,34)-(20,42)
(20,38)-(20,39)
(20,41)-(20,42)
(30,10)-(30,74)
(30,40)-(30,44)
(30,40)-(30,54)
(30,40)-(30,74)
(30,46)-(30,48)
(30,46)-(30,54)
(30,50)-(30,51)
(30,53)-(30,54)
(30,60)-(30,64)
(30,60)-(30,74)
(30,66)-(30,68)
(30,66)-(30,74)
(30,70)-(30,71)
(30,73)-(30,74)
*)
