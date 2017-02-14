
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
(16,28)-(16,40)
(16,47)-(16,50)
(17,30)-(17,42)
(17,49)-(17,52)
(19,14)-(19,26)
(19,43)-(19,55)
(20,24)-(20,36)
(20,52)-(20,64)
(23,10)-(23,22)
(25,16)-(25,28)
(27,22)-(27,34)
(27,51)-(27,63)
*)

(* type error slice
(12,2)-(27,81)
(12,11)-(12,23)
(16,27)-(16,44)
(16,28)-(16,40)
(16,41)-(16,43)
(17,29)-(17,46)
(17,30)-(17,42)
(17,43)-(17,45)
*)
