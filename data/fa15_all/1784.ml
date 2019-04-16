
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
       | Sine  -> "sin(pi*" ^ ((exprToString e') ^ ")")
       | Cosine  -> "cos(pi*" ^ ((exprToString e') ^ ")")
       | Average  ->
           let (e1,e2) = h in
           "((" ^
             ((exprToString e1) ^
                ("+" ^ ((exprToString e2) ^ (")/2)" ^ (exprToString e')))))
       | Times  ->
           let (e1,e2) = h in
           (exprToString e1) ^
             ("*" ^ ((exprToString e2) ^ (exprToString e')))
       | Thresh  ->
           let (e1,e2,e3,e4) = h in
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
(12,3)-(38,86)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine e1 -> "sin(pi*" ^ (exprToString e1 ^ ")")
| Cosine e1 -> "cos(pi*" ^ (exprToString e1 ^ ")")
| Average (e1 , e2) -> "((" ^ (exprToString e1 ^ ("+" ^ (exprToString e2 ^ ")/2)")))
| Times (e1 , e2) -> exprToString e1 ^ ("*" ^ exprToString e2)
| Thresh (e1 , e2 , e3 , e4) -> "(" ^ (exprToString e1 ^ ("<" ^ (exprToString e2 ^ ("?" ^ (exprToString e3 ^ (":" ^ (exprToString e4 ^ ")")))))))
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG]))])

*)

(* type error slice
(12,3)-(38,86)
(13,11)-(13,13)
(15,7)-(38,86)
(15,14)-(15,15)
(16,19)-(16,42)
(16,23)-(16,24)
(16,25)-(16,42)
(16,26)-(16,38)
(16,39)-(16,41)
(21,12)-(24,76)
(21,26)-(21,27)
(23,15)-(23,32)
(23,16)-(23,28)
(23,29)-(23,31)
(24,25)-(24,42)
(24,26)-(24,38)
(24,39)-(24,41)
(26,12)-(28,61)
(26,26)-(26,27)
(27,12)-(27,29)
(27,13)-(27,25)
(27,26)-(27,28)
(28,22)-(28,39)
(28,23)-(28,35)
(28,36)-(28,38)
(30,12)-(38,85)
(30,32)-(30,33)
*)
