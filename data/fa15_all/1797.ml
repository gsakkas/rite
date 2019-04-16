
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
(16,28)-(16,45)
ex t
AppG (fromList [VarG])

(17,30)-(17,47)
ex t
AppG (fromList [VarG])

(19,14)-(19,32)
ex ex1
AppG (fromList [VarG])

(19,43)-(19,61)
ex ex2
AppG (fromList [VarG])

(20,24)-(20,42)
ex ex1
AppG (fromList [VarG])

(20,52)-(20,70)
ex ex2
AppG (fromList [VarG])

(23,10)-(23,28)
ex ex1
AppG (fromList [VarG])

(25,16)-(25,34)
ex ex2
AppG (fromList [VarG])

(27,22)-(27,40)
ex ex3
AppG (fromList [VarG])

(27,51)-(27,69)
ex ex4
AppG (fromList [VarG])

*)

(* type error slice
(12,3)-(27,82)
(12,12)-(12,24)
(16,28)-(16,45)
(16,29)-(16,41)
(16,42)-(16,44)
(17,30)-(17,47)
(17,31)-(17,43)
(17,44)-(17,46)
*)
