
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Hoi of expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b) -> "sin(pi*" ^ ((exp a) ^ (")/(cos(pi*" ^ ((exp b) ")")));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Hoi of expr* expr* expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  let exp = exprToString in
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine a -> "sin(pi*" ^ ((exp a) ^ ")")
  | Cosine a -> "cos(pi*" ^ ((exp a) ^ ")")
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;

*)

(* changed spans
(14,2)-(25,71)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine a -> "sin(pi*" ^ (exp a ^ ")")
| Cosine a -> "cos(pi*" ^ (exp a ^ ")")
| Average (a , b) -> "((" ^ (exp a ^ ("+" ^ (exp b ^ ")/2)")))
| Times (a , b) -> exp a ^ ("*" ^ exp b)
| Thresh (a , b , c , d) -> "(" ^ (exp a ^ ("<" ^ (exp b ^ ("?" ^ (exp c ^ (":" ^ (exp d ^ ")")))))))
| Hoi (a , b , c) -> "sin(pi*" ^ (exp a ^ (")*cos(pi*" ^ (exp b ^ (")/(" ^ (exp c ^ ")")))))
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(25,56)-(25,69)
")*cos(pi*"
LitG

(25,57)-(25,64)
(^)
VarG

(25,57)-(25,64)
exp b ^ (")/(" ^ (exp c ^ ")"))
AppG (fromList [AppG (fromList [EmptyG])])

(25,65)-(25,68)
(^)
VarG

(25,65)-(25,68)
exp
VarG

(25,65)-(25,68)
c
VarG

(25,65)-(25,68)
(^)
VarG

(25,65)-(25,68)
")/(" ^ (exp c ^ ")")
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(25,65)-(25,68)
exp c ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(25,65)-(25,68)
exp c
AppG (fromList [VarG])

(25,65)-(25,68)
")/("
LitG

*)
