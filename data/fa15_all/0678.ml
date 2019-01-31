
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Tangent of expr
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
  | Tangent a ->
      "sin(pi*" ^ ((exp a) ^ (")/(" ("cos(pi*" ^ ((exp a) ^ ")")) ")"));;


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
(14,2)-(26,71)
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

(26,30)-(26,35)
(^)
VarG

(26,36)-(26,65)
")*cos(pi*"
LitG

(26,37)-(26,46)
exp b
AppG (fromList [VarG])

(26,49)-(26,64)
exp
VarG

(26,49)-(26,64)
b
VarG

(26,50)-(26,57)
(^)
VarG

(26,50)-(26,57)
exp c ^ ")"
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(26,50)-(26,57)
")/("
LitG

(26,60)-(26,63)
c
VarG

*)
