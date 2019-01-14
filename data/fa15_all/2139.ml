
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
(16,28)-(16,29)
exprToString
VarG

(17,30)-(17,31)
exprToString
VarG

(18,30)-(18,31)
exprToString
VarG

(18,46)-(18,47)
exprToString
VarG

(19,20)-(19,21)
exprToString
VarG

(19,35)-(19,36)
exprToString
VarG

(22,10)-(22,11)
exprToString
VarG

(22,26)-(22,27)
exprToString
VarG

(22,42)-(22,43)
exprToString
VarG

(22,58)-(22,59)
exprToString
VarG

*)
