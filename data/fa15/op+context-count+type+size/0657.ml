
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      ("(" "1/sin(pi*") ^
        ((exprToString e1) ^
           (")" ^
              ("cos(pi*" ^
                 ((exprToString e1) ^
                    (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")"))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | NewOp1 of expr* expr* expr
  | NewOp2 of expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^
        ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ (")" ^ "/2)"))))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))))
  | NewOp1 (e1,e2,e3) ->
      "(" ^
        ("1/sin(pi*" ^
           ((exprToString e1) ^
              (")" ^
                 ("cos(pi*" ^
                    ((exprToString e1) ^
                       (")" ^ ("sin(pi*" ^ ((exprToString e1) ^ (")" ^ ")")))))))))
  | NewOp2 e1 -> "1/sin(pi*" ^ ((exprToString e1) ^ ")");;

*)

(* changed spans
(31,6)-(31,23)
(31,11)-(31,22)
*)

(* type error slice
(31,6)-(31,23)
(31,7)-(31,10)
*)
