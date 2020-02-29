type  expr =
| VarX
| VarY
| Neg of expr
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Neg e1 -> "(" ^ (__var_1__ ^ " * -1)")
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Neg of expr
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Neg e1 -> "(" ^ (exprToString __lit__ ^ " * -1)")
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))


(* -------------------------------------- *)

type  expr =
| VarX
| VarY
| Neg of expr
| Sine of expr
| Cosine of expr
| Average of expr * expr
| Times of expr * expr
| Thresh of expr * expr * expr * expr

let rec exprToString =
  fun e ->
    match e with
    | VarX -> "x"
    | VarY -> "y"
    | Neg e1 -> "(" ^ __var_1__
    | Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
    | Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
    | Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
    | Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
    | Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))


(* -------------------------------------- *)


(* bad

type expr =
  | VarX
  | VarY
  | Neg of expr
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Neg e1 -> "(" ^ (e1 ^ " * -1)")
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* student fix

type expr =
  | VarX
  | VarY
  | Neg of expr
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Neg e1 -> "(" ^ ((exprToString e1) ^ " * -1)")
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans

(16,22)-(16,24)
exprToString e1
AppG [VarG]

*)
