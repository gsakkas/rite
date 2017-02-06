
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Halve of expr
  | Average of expr* expr
  | Times of expr* expr
  | Wow of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Halve x -> "(" ^ (exprToString ^ ")/2")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))))
  | Wow (x,y,z) ->
      "sqrt(" ^
        ("abs(" ^
           ((exprToString x) ^
              (")*" ^
                 ("abs(" ^
                    ((exprToString y) ^
                       (")*" ^ ("abs(" ^ ((exprToString z) ^ "))"))))))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Halve of expr
  | Average of expr* expr
  | Times of expr* expr
  | Wow of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let rec exprToString e =
  match e with
  | VarX  -> "x"
  | VarY  -> "y"
  | Sine x -> "sin(pi*" ^ ((exprToString x) ^ ")")
  | Cosine x -> "cos(pi*" ^ ((exprToString x) ^ ")")
  | Halve x -> "(" ^ ((exprToString x) ^ ")/2")
  | Average (x,y) ->
      "((" ^ ((exprToString x) ^ ("*" ^ ((exprToString y) ^ ")/2)")))
  | Times (x,y) -> (exprToString x) ^ ("*" ^ (exprToString y))
  | Thresh (a,b,c,d) ->
      "(" ^
        ((exprToString a) ^
           ("<" ^
              ((exprToString b) ^
                 ("?" ^ ((exprToString c) ^ (":" ^ (exprToString d)))))))
  | Wow (x,y,z) ->
      "sqrt(" ^
        ("abs(" ^
           ((exprToString x) ^
              (")*" ^
                 ("abs(" ^
                    ((exprToString y) ^
                       (")*" ^ ("abs(" ^ ((exprToString z) ^ "))"))))))));;

*)

(* changed spans
(19,23)-(19,35)
(19,38)-(19,43)
*)

(* type error slice
(13,22)-(36,66)
(14,3)-(36,66)
(14,3)-(36,66)
(14,3)-(36,66)
(14,3)-(36,66)
(14,3)-(36,66)
(14,9)-(14,10)
(17,15)-(17,24)
(17,15)-(17,50)
(17,25)-(17,26)
(17,29)-(17,41)
(17,29)-(17,43)
(17,29)-(17,43)
(17,29)-(17,50)
(17,29)-(17,50)
(17,42)-(17,43)
(17,45)-(17,46)
(17,47)-(17,50)
(18,17)-(18,26)
(18,17)-(18,52)
(18,27)-(18,28)
(18,31)-(18,43)
(18,31)-(18,45)
(18,31)-(18,52)
(18,44)-(18,45)
(18,47)-(18,48)
(18,49)-(18,52)
(19,16)-(19,19)
(19,20)-(19,21)
(19,23)-(19,35)
(19,23)-(19,43)
(19,23)-(19,43)
(19,36)-(19,37)
(19,38)-(19,43)
*)
