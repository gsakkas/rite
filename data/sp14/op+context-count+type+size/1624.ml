
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
(35,49)-(35,74)
(35,50)-(35,68)
(39,41)-(39,65)
(39,46)-(39,64)
*)

(* type error slice
(17,28)-(17,54)
(17,29)-(17,47)
(17,30)-(17,42)
(17,48)-(17,49)
(35,49)-(35,74)
(35,50)-(35,68)
(35,51)-(35,63)
(39,41)-(39,65)
(39,42)-(39,45)
*)
