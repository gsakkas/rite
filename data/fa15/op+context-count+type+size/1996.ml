
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
  | Sine b -> "sin(pi*" ^ ((exprToString b) ^ ")")
  | Cosine b -> "cos(pi*" ^ ((exprToString b) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2))")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^
                    ((exprToString c) ^ (":" ^ ((exprToString d) :: ")")))))))
  | _ -> "";;


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
  | Sine b -> "sin(pi*" ^ ((exprToString b) ^ ")")
  | Cosine b -> "cos(pi*" ^ ((exprToString b) ^ ")")
  | Average (a,b) ->
      "((" ^ ((exprToString a) ^ ("+" ^ ((exprToString b) ^ "/2))")))
  | Times (a,b) -> (exprToString a) ^ ("*" ^ (exprToString b))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ ((exprToString d) ^ ")")))))))
  | _ -> "";;

*)

(* changed spans
(26,50)-(26,64)
(26,50)-(26,72)
*)

(* type error slice
(26,42)-(26,72)
(26,46)-(26,47)
(26,50)-(26,72)
(26,50)-(26,72)
(26,69)-(26,72)
*)
