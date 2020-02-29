type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr
| Uncreative of expr * expr * expr
| Creative of expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e -> "sin(pi*" ^ (exprToString e ^ ")")
    | Cosine e -> "cos(pi*" ^ (exprToString e ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString e2 ^ ("/3*" ^ exprToString e))))
    | Creative e1 -> "(-1*" ^ (exprToString e1 ^ ")")


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr
| Uncreative of expr * expr * expr
| Creative of expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e -> "sin(pi*" ^ (exprToString e ^ ")")
    | Cosine e -> "cos(pi*" ^ (exprToString e ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString e2 ^ ("/3*" ^ exprToString __var_1__))))
    | Creative e1 -> "(-1*" ^ (exprToString e1 ^ ")")


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr
| Uncreative of expr * expr * expr
| Creative of expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Sine e -> "sin(pi*" ^ (exprToString e ^ ")")
    | Cosine e -> "cos(pi*" ^ (exprToString e ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString e2 ^ ("/3*" ^ (exprToString e3 ^ "x")))))
    | Creative e1 -> "(-1*" ^ (exprToString e1 ^ ")")


(* -------------------------------------- *)


(* bad

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Uncreative (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/2*" ^ ((exprToString e2) ^ ("/3*" ^ (exprToString e3 "/4)")))))
  | Creative e1 -> "(-1*" ^ ((exprToString e1) ^ ")");;

*)

(* student fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Uncreative of expr* expr* expr
  | Creative of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin(pi*" ^ ((exprToString e) ^ ")")
  | Cosine e -> "cos(pi*" ^ ((exprToString e) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | Uncreative (e1,e2,e3) ->
      "(" ^
        ((exprToString e1) ^
           ("/2*" ^
              ((exprToString e2) ^ ("/3*" ^ ((exprToString e3) ^ "/4)")))))
  | Creative e1 -> "(-1*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans

(32,51)-(32,74)
exprToString e3 ^ "/4)"
AppG [AppG [EmptyG],LitG]

*)
