
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin (pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))))
  | TimesTimes (e1,e2,e3) ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e2) ^ (" * " ^ (exprToString e3))))
  | Cube e1 ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e1) ^ (" * " ^ (exprToString e1))))
  | MultDivBy6 (e1,e2) ->
      ("((" (exprToString e1)) ^ (" * " ^ ((exprToString e2) ^ ") /6)"));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | TimesTimes of expr* expr* expr
  | Cube of expr
  | MultDivBy6 of expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine e1 -> "sin (pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos (pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" + " ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ (" * " ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 (" ? " ^
                    ((exprToString e3) ^ (" : " ^ ((exprToString e4) ^ ")")))))))
  | TimesTimes (e1,e2,e3) ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e2) ^ (" * " ^ (exprToString e3))))
  | Cube e1 ->
      (exprToString e1) ^
        (" * " ^ ((exprToString e1) ^ (" * " ^ (exprToString e1))))
  | MultDivBy6 (e1,e2) ->
      "((" ^ ((exprToString e1) ^ (" * " ^ ((exprToString e2) ^ ") /6)")));;

*)

(* changed spans
(37,6)-(37,30)
(37,12)-(37,29)
*)

(* type error slice
(37,6)-(37,30)
(37,7)-(37,11)
*)
