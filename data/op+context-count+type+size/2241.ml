
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
(15,16)-(15,25)
(15,16)-(15,43)
(15,16)-(15,51)
(15,29)-(15,43)
(16,18)-(16,27)
(16,18)-(16,45)
(16,18)-(16,53)
(16,31)-(16,45)
(18,10)-(18,14)
(18,10)-(18,32)
(18,10)-(18,40)
(18,10)-(18,59)
(18,10)-(18,70)
(18,18)-(18,32)
(18,37)-(18,40)
(18,45)-(18,59)
(19,22)-(19,36)
(19,22)-(19,43)
(19,22)-(19,62)
(19,40)-(19,43)
(21,12)-(21,15)
(21,12)-(21,33)
(21,12)-(21,41)
(21,12)-(21,60)
(21,12)-(22,30)
(21,12)-(23,15)
(21,12)-(24,26)
(21,19)-(21,33)
(21,38)-(21,41)
(21,46)-(21,58)
(21,46)-(21,60)
(21,59)-(21,60)
(22,12)-(22,15)
(22,16)-(22,28)
(22,29)-(22,30)
(23,12)-(23,15)
(24,12)-(24,24)
(24,25)-(24,26)
*)

(* type error slice
(11,4)-(24,29)
(11,22)-(24,26)
(12,3)-(24,26)
(12,9)-(12,10)
(13,14)-(13,17)
(15,16)-(15,25)
(15,16)-(15,43)
(15,16)-(15,51)
(15,29)-(15,41)
(15,29)-(15,43)
(15,42)-(15,43)
(15,48)-(15,51)
(16,18)-(16,27)
(16,18)-(16,45)
(16,18)-(16,53)
(16,50)-(16,53)
(18,10)-(18,14)
(18,10)-(18,32)
(18,10)-(18,40)
(18,10)-(18,70)
(18,37)-(18,40)
(18,64)-(18,70)
(19,22)-(19,43)
(19,22)-(19,62)
(19,40)-(19,43)
(21,12)-(21,15)
(21,12)-(21,33)
(21,12)-(21,41)
(21,12)-(23,15)
(21,12)-(24,26)
(21,38)-(21,41)
(22,12)-(22,15)
(22,12)-(22,30)
(22,16)-(22,28)
(22,29)-(22,30)
(23,12)-(23,15)
*)
