
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
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
  | Square a -> ("(" ^ ((exp a) ^ ("*" ^ ((exp a) ^ ")")))) "/2"
  | Average (a,b) -> "((" ^ ((exp a) ^ ("+" ^ ((exp b) ^ ")/2)")))
  | Times (a,b) -> (exp a) ^ ("*" ^ (exp b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exp a) ^
           ("<" ^ ((exp b) ^ ("?" ^ ((exp c) ^ (":" ^ ((exp d) ^ ")")))))))
  | Hoi (a,b,c) ->
      "sin(pi*" ^
        ((exp a) ^ (")*cos(pi*" ^ ((exp b) ^ (")/(" ^ ((exp c) ^ ")")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Square of expr
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
  | Square a -> "((" ^ ((exp a) ^ ("*" ^ ((exp a) ^ ")/2)")))
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
(20,17)-(20,65)
"((" ^ (exp a ^ ("*" ^ (exp a ^ ")/2)")))
AppG [LitG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(20,17)-(20,60)
(20,17)-(20,65)
(20,22)-(20,23)
*)
