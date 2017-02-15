
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
(39,42)-(39,66)
(39,49)-(39,65)
*)

(* type error slice
(18,31)-(18,55)
(18,32)-(18,48)
(18,33)-(18,45)
(18,49)-(18,50)
(39,41)-(39,75)
(39,42)-(39,66)
(39,42)-(39,66)
(39,42)-(39,66)
(39,43)-(39,46)
(39,49)-(39,65)
(39,50)-(39,62)
(39,67)-(39,68)
*)
