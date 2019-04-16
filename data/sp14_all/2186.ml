
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  let expr = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((expr a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((expr a) ^ ")")
  | Average (a,b) -> "((" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ")/2)")))
  | Times (a,b) -> (expr a) ^ ("*" ^ (expr b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((expr a) ^
           ("<" ^ ((expr b) ^ ("?" ^ ((expr c) ^ (":" ^ ((expr d) ^ ")")))))))
  | Poly (a,b,c) ->
      "(" ^
        ((expr a) ^
           ("*" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ("*" ^ ((expr c) ^ ")")))))))
  | Tan a -> "sin(pi*" ^ ((expr a) ^ (")/cos(pi*" ^ ((expr a) ")")));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Poly of expr* expr* expr
  | Tan of expr;;

let rec exprToString e =
  let expr = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((expr a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((expr a) ^ ")")
  | Average (a,b) -> "((" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ")/2)")))
  | Times (a,b) -> (expr a) ^ ("*" ^ (expr b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((expr a) ^
           ("<" ^ ((expr b) ^ ("?" ^ ((expr c) ^ (":" ^ ((expr d) ^ ")")))))))
  | Poly (a,b,c) ->
      "(" ^
        ((expr a) ^
           ("*" ^ ((expr a) ^ ("+" ^ ((expr b) ^ ("*" ^ ((expr c) ^ ")")))))))
  | Tan a -> "sin(pi*" ^ ((expr a) ^ (")/cos(pi*" ^ ((expr a) ^ ")")));;

*)

(* changed spans
(30,53)-(30,67)
expr a ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

*)

(* type error slice
(18,27)-(18,43)
(18,28)-(18,36)
(18,29)-(18,33)
(18,37)-(18,38)
(30,53)-(30,67)
(30,54)-(30,62)
(30,55)-(30,59)
*)
