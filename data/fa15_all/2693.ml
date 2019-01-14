
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr* expr
  | Exponential of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine i -> "sin(pi*" ^ ((exprToString i) ^ ")")
  | Cosine i -> "cos(pi*" ^ ((exprToString i) ^ ")")
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ ((exprToString i2) ^ ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ ("*" ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (":" ^ ((exprToString i4) ^ ")")))))))
  | Square (i1,i2) -> exprToString i1 "*" exprToString i2
  | Exponential (i1,i2) -> exprToString i1 "^" exprToString i2;;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Square of expr
  | Exponential of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine i -> "sin(pi*" ^ ((exprToString i) ^ ")")
  | Cosine i -> "cos(pi*" ^ ((exprToString i) ^ ")")
  | Average (i1,i2) ->
      "((" ^ ((exprToString i1) ^ (" + " ^ ((exprToString i2) ^ ")/2)")))
  | Times (i1,i2) -> (exprToString i1) ^ ("*" ^ (exprToString i2))
  | Thresh (i1,i2,i3,i4) ->
      "(" ^
        ((exprToString i1) ^
           ("<" ^
              ((exprToString i2) ^
                 (" ? " ^
                    ((exprToString i3) ^ (":" ^ ((exprToString i4) ^ ")")))))))
  | Square i -> (exprToString i) ^ ("*" ^ (exprToString i))
  | Exponential (i1,i2) -> (exprToString i1) ^ ("^" ^ (exprToString i2));;

*)

(* changed spans
(14,2)-(30,62)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine i -> "sin(pi*" ^ (exprToString i ^ ")")
| Cosine i -> "cos(pi*" ^ (exprToString i ^ ")")
| Average (i1 , i2) -> "((" ^ (exprToString i1 ^ (" + " ^ (exprToString i2 ^ ")/2)")))
| Times (i1 , i2) -> exprToString i1 ^ ("*" ^ exprToString i2)
| Thresh (i1 , i2 , i3 , i4) -> "(" ^ (exprToString i1 ^ ("<" ^ (exprToString i2 ^ (" ? " ^ (exprToString i3 ^ (":" ^ (exprToString i4 ^ ")")))))))
| Square i -> exprToString i ^ ("*" ^ exprToString i)
| Exponential (i1 , i2) -> exprToString i1 ^ ("^" ^ exprToString i2)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LitG)])

(29,22)-(29,34)
(^)
VarG

(29,22)-(29,34)
exprToString i
AppG (fromList [VarG])

(29,22)-(29,57)
exprToString i ^ ("*" ^ exprToString i)
AppG (fromList [AppG (fromList [EmptyG])])

(29,35)-(29,37)
i
VarG

(29,38)-(29,41)
(^)
VarG

(29,38)-(29,41)
"*" ^ exprToString i
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(29,42)-(29,54)
exprToString i
AppG (fromList [VarG])

(30,27)-(30,39)
(^)
VarG

(30,27)-(30,39)
exprToString i1
AppG (fromList [VarG])

(30,27)-(30,39)
exprToString i1 ^ ("^" ^ exprToString i2)
AppG (fromList [AppG (fromList [EmptyG])])

(30,27)-(30,62)
i
VarG

(30,43)-(30,46)
(^)
VarG

(30,43)-(30,46)
"^" ^ exprToString i2
AppG (fromList [AppG (fromList [EmptyG]),LitG])

(30,47)-(30,59)
exprToString i2
AppG (fromList [VarG])

*)
