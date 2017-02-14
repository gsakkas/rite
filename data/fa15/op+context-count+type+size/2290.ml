
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
(12,2)-(22,75)
(12,10)-(12,22)
(16,28)-(16,29)
(17,30)-(17,31)
(18,30)-(18,31)
(18,46)-(18,47)
(19,20)-(19,21)
(19,35)-(19,36)
(22,10)-(22,11)
(22,26)-(22,27)
(22,42)-(22,43)
(22,58)-(22,59)
*)

(* type error slice
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,2)-(22,75)
(13,8)-(13,9)
(16,27)-(16,32)
(16,28)-(16,29)
*)
