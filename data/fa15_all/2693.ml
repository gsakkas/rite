
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
(14,3)-(30,63)
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
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

(29,23)-(29,58)
exprToString i ^ ("*" ^ exprToString i)
AppG (fromList [AppG (fromList [EmptyG])])

(30,28)-(30,63)
exprToString i1 ^ ("^" ^ exprToString i2)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(17,27)-(17,51)
(17,28)-(17,44)
(17,29)-(17,41)
(17,45)-(17,46)
(29,23)-(29,35)
(29,23)-(29,58)
(30,28)-(30,40)
(30,28)-(30,63)
*)
