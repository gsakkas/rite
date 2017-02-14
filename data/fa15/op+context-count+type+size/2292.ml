
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let a = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((e t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((e t) ^ ")")
  | Average (s,t) -> "((" ^ ((e s) ^ ("+" ^ ((e t) ^ ")/2)")))
  | Times (s,t) -> (e s) ^ ("*" ^ (e t))
  | Thresh (s,t,u,v) ->
      "(" ^
        ((e s) ^ ("<" ^ ((e t) ^ ("?" ^ ((e u) ^ (":" ^ ((e v) ^ ")")))))));;


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
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine t -> "sin(pi*" ^ ((exprToString t) ^ ")")
  | Cosine t -> "cos(pi*" ^ ((exprToString t) ^ ")")
  | Average (s,t) ->
      "((" ^ ((exprToString s) ^ ("+" ^ ((exprToString t) ^ ")/2)")))
  | Times (s,t) -> (exprToString s) ^ ("*" ^ (exprToString t))
  | Thresh (s,t,u,v) ->
      "(" ^
        ((exprToString s) ^
           ("<" ^
              ((exprToString t) ^
                 ("?" ^ ((exprToString u) ^ (":" ^ ((exprToString v) ^ ")")))))));;

*)

(* changed spans
(12,3)-(22,69)
(12,11)-(12,23)
(16,29)-(16,30)
(17,31)-(17,32)
(18,31)-(18,32)
(18,47)-(18,48)
(19,21)-(19,22)
(19,36)-(19,37)
(22,11)-(22,12)
(22,27)-(22,28)
(22,43)-(22,44)
(22,59)-(22,60)
*)

(* type error slice
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,3)-(22,69)
(13,9)-(13,10)
(16,29)-(16,30)
(16,29)-(16,32)
*)
