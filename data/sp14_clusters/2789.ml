
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
  | VarX  -> "%s" e
  | VarY  -> "%s" e
  | Sine  -> "%s %s" e e
  | Cosine  -> "%s" e
  | Average  -> "%s" e
  | Times  -> "%s" e
  | Thresh  -> "%s" e;;


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
  | Sine e1 -> Printf.sprintf "%s" (exprToString e1)
  | Cosine e2 -> Printf.sprintf "%s" (exprToString e2)
  | Average (e3,e4) ->
      Printf.sprintf "%s %s" (exprToString e3) (exprToString e4)
  | Times (e5,e6) ->
      Printf.sprintf "%s %s" (exprToString e5) (exprToString e6)
  | Thresh (e7,e8,e9,e0) ->
      Printf.sprintf "%s %s %s %s" (exprToString e7) (exprToString e8)
        (exprToString e9) (exprToString e0)
  | _ -> "";;

*)

(* changed spans
(12,2)-(19,21)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> Printf.sprintf "%s"
                            (exprToString e1)
| Cosine e2 -> Printf.sprintf "%s"
                              (exprToString e2)
| Average (e3 , e4) -> Printf.sprintf "%s %s"
                                      (exprToString e3)
                                      (exprToString e4)
| Times (e5 , e6) -> Printf.sprintf "%s %s"
                                    (exprToString e5)
                                    (exprToString e6)
| Thresh (e7 , e8 , e9 , e0) -> Printf.sprintf "%s %s %s %s"
                                               (exprToString e7)
                                               (exprToString e8)
                                               (exprToString e9)
                                               (exprToString e0)
| _ -> ""
CaseG VarG [(Nothing,LitG),(Nothing,LitG),(Nothing,AppG EmptyG [EmptyG,EmptyG]),(Nothing,AppG EmptyG [EmptyG,EmptyG]),(Nothing,AppG EmptyG [EmptyG,EmptyG,EmptyG]),(Nothing,AppG EmptyG [EmptyG,EmptyG,EmptyG]),(Nothing,AppG EmptyG [EmptyG,EmptyG,EmptyG,EmptyG,EmptyG]),(Nothing,LitG)]

(13,13)-(13,17)
Printf.sprintf "%s"
               (exprToString e1)
AppG VarG [LitG,AppG EmptyG [EmptyG]]

(15,13)-(15,20)
exprToString e2
AppG VarG [VarG]

(15,13)-(15,20)
Printf.sprintf "%s %s"
               (exprToString e3)
               (exprToString e4)
AppG VarG [LitG,AppG EmptyG [EmptyG],AppG EmptyG [EmptyG]]

(18,14)-(18,20)
Printf.sprintf "%s %s"
               (exprToString e5)
               (exprToString e6)
AppG VarG [LitG,AppG EmptyG [EmptyG],AppG EmptyG [EmptyG]]

*)
