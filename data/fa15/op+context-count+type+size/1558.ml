
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
(14,3)-(25,69)
(25,42)-(25,54)
(25,59)-(25,64)
(25,59)-(25,69)
(25,66)-(25,69)
*)

(* type error slice
(17,29)-(17,32)
(17,29)-(17,34)
(17,29)-(17,41)
(17,36)-(17,37)
(25,59)-(25,62)
(25,59)-(25,64)
(25,59)-(25,69)
*)
