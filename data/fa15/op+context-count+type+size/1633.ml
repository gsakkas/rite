
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "(" ^ ((exprToString ex1) ^ ("*" ^ ((exprToString ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((ex t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((ex t) ^ ")")
  | Average (ex1,ex2) -> "(" ^ ((ex ex1) ^ ("*" ^ ((ex ex2) ^ ")/2")))
  | Times (ex1,ex2) -> (ex ex1) ^ ("*" ^ (ex ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((ex ex1) ^
           ("<" ^ ((ex ex2) ^ ("?" ^ ((ex ex3) ^ (":" ^ ((ex ex4) ^ ")")))))));;

*)

(* changed spans
(16,29)-(16,41)
(16,48)-(16,51)
(17,31)-(17,43)
(17,50)-(17,53)
(19,15)-(19,27)
(19,44)-(19,56)
(20,25)-(20,37)
(20,53)-(20,65)
(23,11)-(23,23)
(25,17)-(25,29)
(27,23)-(27,35)
(27,52)-(27,64)
*)

(* type error slice
(12,3)-(27,75)
(12,12)-(12,24)
(16,29)-(16,41)
(16,29)-(16,44)
(16,42)-(16,44)
(17,31)-(17,43)
(17,31)-(17,46)
(17,44)-(17,46)
*)
