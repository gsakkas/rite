
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
