
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y ")") ^ "^2")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | SqDist of expr* expr;;

let rec exprToString e =
  let ex = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((ex x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((ex x) ^ ")")
  | Average (x,y) -> "((" ^ ((ex x) ^ ("+" ^ ((ex y) ^ ")/2)")))
  | Times (x,y) -> (ex x) ^ ("*" ^ (ex y))
  | Thresh (w,x,y,z) ->
      "(" ^
        ((ex w) ^
           ("<" ^ ((ex x) ^ ("?" ^ ((ex y) ^ (":" ^ ((ex z) ^ ")")))))))
  | SqDist (x,y) ->
      "(" ^ ((ex x) ^ (")" ^ ("^2+" ^ ("(" ^ ((ex y) ^ (")" ^ "^2"))))));;

*)

(* changed spans
(26,46)-(26,56)
(26,52)-(26,55)
*)

(* type error slice
(17,26)-(17,40)
(17,27)-(17,33)
(17,28)-(17,30)
(17,34)-(17,35)
(26,46)-(26,56)
(26,47)-(26,49)
*)
