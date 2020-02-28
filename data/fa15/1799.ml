
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr
  | Three of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | SinCos ex ->
      "sin(pi*" ^
        ((exprToString ex) ^ (")*cos(pi*" ^ ((exprToString ex) ^ ")")))
  | Three (ex1,ex2,ex3) ->
      (exprToString ex1) ^
        ("*cos(pi*" ^
           ((exprToString ex2) ^ (")*sin(pi*" ^ (exprToString ex3 ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SinCos of expr
  | Three of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine ex -> "sin(pi*" ^ ((exprToString ex) ^ ")")
  | Cosine ex -> "cos(pi*" ^ ((exprToString ex) ^ ")")
  | Average (ex1,ex2) ->
      "((" ^ ((exprToString ex1) ^ ("+" ^ ((exprToString ex2) ^ ")/2)")))
  | Times (ex1,ex2) -> (exprToString ex1) ^ ("*" ^ (exprToString ex2))
  | Thresh (ex1,ex2,ex3,ex4) ->
      "(" ^
        ((exprToString ex1) ^
           ("<" ^
              ((exprToString ex2) ^
                 ("?" ^
                    ((exprToString ex3) ^ (":" ^ ((exprToString ex4) ^ ")")))))))
  | SinCos ex ->
      "sin(pi*" ^
        ((exprToString ex) ^ (")*cos(pi*" ^ ((exprToString ex) ^ ")")))
  | Three (ex1,ex2,ex3) ->
      (exprToString ex1) ^
        ("*cos(pi*" ^
           ((exprToString ex2) ^ (")*sin(pi*" ^ ((exprToString ex3) ^ ")"))));;

*)

(* changed spans
(35,49)-(35,71)
exprToString ex3 ^ ")"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(17,28)-(17,53)
(17,29)-(17,46)
(17,30)-(17,42)
(17,47)-(17,48)
(35,49)-(35,71)
(35,50)-(35,62)
*)
