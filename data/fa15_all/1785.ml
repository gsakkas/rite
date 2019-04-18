
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
  | [] -> []
  | h::e' ->
      (match h with
       | VarX  -> "x" ^ (exprToString e')
       | VarY  -> "y" ^ (exprToString e')
       | Sine e1 ->
           "sin(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Cosine e1 ->
           "cos(pi*" ^ ((exprToString e1) ^ (")" ^ (exprToString e')))
       | Average (e1,e2) ->
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times (e1,e2) ->
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh (e1,e2,e3,e4) ->
           "(" ^
             ((exprToString e1) ^
                ("<" ^
                   ((exprToString e2) ^
                      ("?" ^
                         ((exprToString e3) ^
                            (":" ^
                               ((exprToString e4) ^ (")" ^ (exprToString e'))))))))));;


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
  | Sine e1 -> "sin(pi*" ^ ((exprToString e1) ^ ")")
  | Cosine e1 -> "cos(pi*" ^ ((exprToString e1) ^ ")")
  | Average (e1,e2) ->
      "((" ^ ((exprToString e1) ^ ("+" ^ ((exprToString e2) ^ ")/2)")))
  | Times (e1,e2) -> (exprToString e1) ^ ("*" ^ (exprToString e2))
  | Thresh (e1,e2,e3,e4) ->
      "(" ^
        ((exprToString e1) ^
           ("<" ^
              ((exprToString e2) ^
                 ("?" ^
                    ((exprToString e3) ^ (":" ^ ((exprToString e4) ^ ")")))))));;

*)

(* changed spans
(12,3)-(37,86)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
CaseG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(11,4)-(37,88)
(11,22)-(37,86)
(12,3)-(37,86)
(13,11)-(13,13)
(15,7)-(37,86)
(16,19)-(16,42)
(16,23)-(16,24)
(16,25)-(16,42)
(16,26)-(16,38)
(16,39)-(16,41)
(19,25)-(19,42)
(19,26)-(19,38)
(19,39)-(19,41)
(21,25)-(21,42)
(21,26)-(21,38)
(21,39)-(21,41)
(24,15)-(24,32)
(24,16)-(24,28)
(24,29)-(24,31)
(25,25)-(25,42)
(25,26)-(25,38)
(25,39)-(25,41)
(27,12)-(27,29)
(27,13)-(27,25)
(27,26)-(27,28)
(28,22)-(28,39)
(28,23)-(28,35)
(28,36)-(28,38)
(31,15)-(31,32)
(31,16)-(31,28)
(31,29)-(31,31)
(33,21)-(33,38)
(33,22)-(33,34)
(33,35)-(33,37)
(35,27)-(35,44)
(35,28)-(35,40)
(35,41)-(35,43)
(37,33)-(37,50)
(37,34)-(37,46)
(37,47)-(37,49)
*)
