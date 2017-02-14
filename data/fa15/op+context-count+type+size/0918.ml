
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2 "?") ^
                 ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")"))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e -> "sin" ^ (exprToString e)
  | Cosine e -> "cos" ^ (exprToString e)
  | Average (e,e1) ->
      "(" ^ ((exprToString e) ^ ("+" ^ ((exprToString e1) ^ (")" ^ "/2"))))
  | Times (e,e1) -> (exprToString e) ^ ("*" ^ (exprToString e1))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(24,17)-(24,36)
(24,33)-(24,36)
*)

(* type error slice
(15,15)-(15,38)
(15,21)-(15,22)
(15,24)-(15,36)
(15,24)-(15,38)
(24,17)-(24,29)
(24,17)-(24,36)
*)
