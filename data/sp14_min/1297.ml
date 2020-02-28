
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let rec exprToString e =
  let s = "" in
  match e with
  | VarX  -> s ^ "x"
  | VarY  -> s ^ "y"
  | Sine a -> s ^ ("sin(pi*" ^ ((exprToString a) ^ ")"))
  | Cosine a -> s ^ ("cos(pi*" ^ ((exprToString a) ^ ")"))
  | Average (a,b) ->
      s ^ ("((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2)"))))
  | Times (a,b) -> s ^ ((exprToString a) ^ ("*" ^ (exprToString b)))
  | Thresh (a,b,c,d) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("<" ^
                 ((exprToString b) ^
                    ("?" ^
                       ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")"))))))))
  | NewA (a,b) ->
      s ^
        ("sin(pi*" ^
           ((exprToString a) ^ (")*cos(pi*" ^ ((exprToString b) ^ ")"))))
  | NewB (a,b,c) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("+" ^ ((exprToString b) ^ (("+" + (exprToString c)) ^ ")^0")))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewA of expr* expr
  | NewB of expr* expr* expr;;

let rec exprToString e =
  let s = "" in
  match e with
  | VarX  -> s ^ "x"
  | VarY  -> s ^ "y"
  | Sine a -> s ^ ("sin(pi*" ^ ((exprToString a) ^ ")"))
  | Cosine a -> s ^ ("cos(pi*" ^ ((exprToString a) ^ ")"))
  | Average (a,b) ->
      s ^ ("((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2)"))))
  | Times (a,b) -> s ^ ((exprToString a) ^ ("*" ^ (exprToString b)))
  | Thresh (a,b,c,d) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("<" ^
                 ((exprToString b) ^
                    ("?" ^
                       ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")"))))))))
  | NewA (a,b) ->
      s ^
        ("sin(pi*" ^
           ((exprToString a) ^ (")*cos(pi*" ^ ((exprToString b) ^ ")"))))
  | NewB (a,b,c) ->
      s ^
        ("(" ^
           ((exprToString a) ^
              ("+" ^ ((exprToString b) ^ ("+" ^ ((exprToString c) ^ ")^0"))))));;

*)

(* changed spans
(39,43)-(39,67)
"+"
LitG

(39,70)-(39,75)
exprToString c ^ ")^0"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(18,32)-(18,56)
(18,33)-(18,49)
(18,34)-(18,46)
(18,50)-(18,51)
(39,42)-(39,76)
(39,43)-(39,67)
(39,44)-(39,47)
(39,50)-(39,66)
(39,51)-(39,63)
(39,68)-(39,69)
*)
