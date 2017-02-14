
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
(29,22)-(29,34)
(29,22)-(29,57)
(29,35)-(29,37)
(29,38)-(29,41)
(29,42)-(29,54)
(29,55)-(29,57)
(30,27)-(30,39)
(30,27)-(30,62)
(30,40)-(30,42)
(30,43)-(30,46)
(30,60)-(30,62)
*)

(* type error slice
(17,26)-(17,50)
(17,27)-(17,43)
(17,28)-(17,40)
(17,44)-(17,45)
(29,22)-(29,34)
(29,22)-(29,57)
(30,27)-(30,39)
(30,27)-(30,62)
*)
