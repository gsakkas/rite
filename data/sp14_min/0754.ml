
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ (("*" (exprToString tm3)) ^ ")"))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | DivAdd of expr* expr* expr* expr
  | TriMult of expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine sin -> "sin(pi*" ^ ((exprToString sin) ^ ")")
  | Cosine cos -> "cos(pi*" ^ ((exprToString cos) ^ ")")
  | Average (n1,n2) ->
      "((" ^ ((exprToString n1) ^ ("+" ^ ((exprToString n2) ^ ")/2)")))
  | Times (t1,t2) -> (exprToString t1) ^ ("*" ^ (exprToString t2))
  | Thresh (th1,th2,th3,th4) ->
      "(" ^
        ((exprToString th1) ^
           ("<" ^
              ((exprToString th2) ^
                 ("?" ^
                    ((exprToString th3) ^ (":" ^ ((exprToString th4) ^ ")")))))))
  | DivAdd (ds1,ds2,ds3,ds4) ->
      "((" ^
        ((exprToString ds1) ^
           ("+" ^
              ((exprToString ds2) ^
                 (") / (" ^
                    ((exprToString ds3) ^ ("+" ^ ((exprToString ds4) ^ "))")))))))
  | TriMult (tm1,tm2,tm3) ->
      "(" ^
        ((exprToString tm1) ^
           ("*" ^ ((exprToString tm2) ^ ("*" ^ ((exprToString tm3) ^ ")")))));;

*)

(* changed spans
(35,50)-(35,75)
exprToString ds4 ^ "))"
AppG [AppG [EmptyG],LitG]

(39,42)-(39,66)
"*"
LitG

(39,69)-(39,72)
exprToString tm3 ^ ")"
AppG [AppG [EmptyG],LitG]

*)

(* type error slice
(17,29)-(17,55)
(17,30)-(17,48)
(17,31)-(17,43)
(17,49)-(17,50)
(35,50)-(35,75)
(35,51)-(35,69)
(35,52)-(35,64)
(39,42)-(39,66)
(39,43)-(39,46)
*)
