
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


(* changed spans
(39,43)-(39,44)
(39,48)-(39,49)
(39,66)-(39,67)
*)

(* type error slice
(39,44)-(39,65)
*)
