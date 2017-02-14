
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
  | Sine x -> ("sin(pi*" + (exprToString x)) + ")"
  | Cosine x -> ("cos(pi*" + (exprToString x)) + ")"
  | Average (x,y) ->
      ((("((" + (exprToString x)) + "*") + (exprToString y)) + ")/2)"
  | Times (x,y) -> ((exprToString x) + "*") + (exprToString y)
  | Thresh (a,b,c,d) ->
      ((((("(" + (exprToString a)) + "<") + (exprToString b)) +
          ("?" exprToString c))
         + ":")
        + (exprToString d);;


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
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))));;

*)

(* changed spans
(15,14)-(15,44)
(15,14)-(15,50)
(15,15)-(15,24)
(15,27)-(15,43)
(16,16)-(16,46)
(16,16)-(16,52)
(16,17)-(16,26)
(16,29)-(16,45)
(18,6)-(18,60)
(18,6)-(18,69)
(18,7)-(18,40)
(18,8)-(18,33)
(18,9)-(18,13)
(18,16)-(18,32)
(18,36)-(18,39)
(18,43)-(18,59)
(19,19)-(19,43)
(19,19)-(19,62)
(19,20)-(19,36)
(19,39)-(19,42)
(21,6)-(23,15)
(21,6)-(24,26)
(21,7)-(22,31)
(21,8)-(21,61)
(21,9)-(21,41)
(21,10)-(21,34)
(21,11)-(21,14)
(21,17)-(21,33)
(21,37)-(21,40)
(21,44)-(21,60)
(21,45)-(21,57)
(21,58)-(21,59)
(22,11)-(22,14)
(22,15)-(22,27)
(22,28)-(22,29)
(23,11)-(23,14)
(24,11)-(24,23)
(24,24)-(24,25)
*)

(* type error slice
(11,3)-(24,28)
(11,21)-(24,26)
(12,2)-(24,26)
(12,2)-(24,26)
(12,2)-(24,26)
(12,2)-(24,26)
(12,2)-(24,26)
(12,2)-(24,26)
(13,13)-(13,16)
(15,14)-(15,44)
(15,14)-(15,44)
(15,14)-(15,50)
(15,14)-(15,50)
(15,15)-(15,24)
(15,27)-(15,43)
(15,28)-(15,40)
(15,47)-(15,50)
(16,16)-(16,46)
(16,16)-(16,52)
(16,16)-(16,52)
(16,17)-(16,26)
(16,49)-(16,52)
(18,6)-(18,69)
(18,6)-(18,69)
(18,7)-(18,40)
(18,8)-(18,33)
(18,9)-(18,13)
(18,36)-(18,39)
(18,63)-(18,69)
(19,19)-(19,43)
(19,19)-(19,62)
(19,39)-(19,42)
(21,6)-(23,15)
(21,6)-(24,26)
(21,9)-(21,41)
(21,10)-(21,34)
(21,11)-(21,14)
(21,37)-(21,40)
(22,10)-(22,30)
(22,11)-(22,14)
(23,11)-(23,14)
*)
