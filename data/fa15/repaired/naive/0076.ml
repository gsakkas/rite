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
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString (__fun_1__ __var_1__) ^ exprToString __lit__)))
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
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString (__fun_1__ __var_1__) ^ __var_1__)))
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
    | Uncreative (e1 , e2 , e3) -> "(" ^ (exprToString e1 ^ ("/2*" ^ (exprToString (__fun_1__ __var_1__
                                                                                              __var_2__) ^ exprToString __lit__)))
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
           ("/2*" ^ ((exprToString e2 "/3*") ^ (exprToString e3 "/4)"))))
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

(32,22)-(32,45)
exprToString e2
AppG [VarG]

(32,48)-(32,71)
"/3*" ^ (exprToString e3 ^ "/4)")
AppG [LitG,AppG [EmptyG,EmptyG]]

*)
