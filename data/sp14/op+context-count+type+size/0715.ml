
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
(11,14)-(23,76)
(12,2)-(23,76)
(15,19)-(15,36)
(16,21)-(16,38)
(17,23)-(17,62)
(17,23)-(17,66)
(17,24)-(17,41)
(17,65)-(17,66)
(18,21)-(18,38)
(18,21)-(18,58)
(22,11)-(22,15)
(22,16)-(22,26)
(22,17)-(22,19)
(22,21)-(22,22)
(22,24)-(22,25)
(23,9)-(23,17)
(23,18)-(23,76)
*)

(* type error slice
(15,15)-(15,18)
(15,15)-(15,36)
(15,19)-(15,36)
(15,20)-(15,24)
(17,23)-(17,62)
(17,23)-(17,62)
(17,24)-(17,41)
(17,25)-(17,29)
(17,44)-(17,61)
(17,45)-(17,49)
(18,21)-(18,38)
(18,21)-(18,58)
(18,21)-(18,58)
(18,22)-(18,26)
(18,41)-(18,58)
(18,42)-(18,46)
*)
