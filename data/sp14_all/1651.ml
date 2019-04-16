
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
exprToString x
AppG (fromList [VarG])

*)

(* type error slice
(17,28)-(17,44)
(17,29)-(17,41)
(19,22)-(19,44)
(19,23)-(19,35)
(19,36)-(19,37)
*)
