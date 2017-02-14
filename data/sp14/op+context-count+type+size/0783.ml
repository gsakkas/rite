
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
  | Sine e' -> sin (eval (e', x, y))
  | Cosine e' -> cos (eval (e', x, y))
  | Average (e1,e2) -> ((eval (e1, x, y)) + (eval (e2, x, y))) / 2
  | Times (e1,e2) -> (eval (e1, x, y)) * (eval (e2, x, y))
  | Thresh (e1,e2,e3,e4) ->
      if (eval (e1, x, y)) < (eval (e2, x, y))
      then eval (e3, x, y)
      else eval (e4, x, y)
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
(11,15)-(23,77)
(12,3)-(23,77)
(15,21)-(15,35)
(16,23)-(16,37)
(17,26)-(17,40)
(17,26)-(17,60)
(17,26)-(17,67)
(17,66)-(17,67)
(18,23)-(18,37)
(18,23)-(18,57)
(22,12)-(22,16)
(22,18)-(22,20)
(22,18)-(22,26)
(22,22)-(22,23)
(22,25)-(22,26)
(23,10)-(23,18)
(23,19)-(23,77)
*)

(* type error slice
(15,16)-(15,19)
(15,16)-(15,35)
(15,21)-(15,25)
(15,21)-(15,35)
(17,26)-(17,30)
(17,26)-(17,40)
(17,26)-(17,60)
(17,26)-(17,60)
(17,46)-(17,50)
(17,46)-(17,60)
(18,23)-(18,27)
(18,23)-(18,37)
(18,23)-(18,57)
(18,23)-(18,57)
(18,43)-(18,47)
(18,43)-(18,57)
*)
