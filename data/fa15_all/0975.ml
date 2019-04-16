
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
  | Sine  -> ("sin(pi*" + exprToString) + ")"
  | Cosine  -> ("cos(pi*" + exprToString) + ")"
  | Average  -> ((("((" + exprToString) + "+") + exprToString) + ")/2"
  | Times  -> (exprToString + "*") + exprToString
  | Thresh  ->
      ((((("(" + exprToString) + "?") + exprToString) + ":") + exprToString)
        + ")"
  | _ -> 0;;


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
  | Sine s -> String.concat "" ["sin(pi*"; exprToString s; ")"]
  | Cosine s -> String.concat "" ["cos(pi*"; exprToString s; ")"]
  | Average (s,p) ->
      String.concat "" ["(("; exprToString s; "+"; exprToString p; ")/2"]
  | Times (s,p) -> String.concat "" [exprToString s; "*"; exprToString p]
  | Thresh (s,p,r,d) ->
      String.concat ""
        ["(";
        exprToString s;
        "<";
        exprToString p;
        "?";
        exprToString r;
        ":";
        exprToString d;
        ")"]
  | _ -> "";;

*)

(* changed spans
(12,3)-(22,11)
match e with
| VarX -> "x"
| VarY -> "y"
| Sine s -> String.concat ""
                          ["sin(pi*" ; exprToString s ; ")"]
| Cosine s -> String.concat ""
                            ["cos(pi*" ; exprToString s ; ")"]
| Average (s , p) -> String.concat ""
                                   ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
| Times (s , p) -> String.concat ""
                                 [exprToString s ; "*" ; exprToString p]
| Thresh (s , p , r , d) -> String.concat ""
                                          ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
| _ -> ""
CaseG VarG (fromList [(ConPatG Nothing,Nothing,LitG),(ConPatG (Just VarPatG),Nothing,AppG (fromList [EmptyG])),(ConPatG (Just (TuplePatG (fromList [EmptyPatG]))),Nothing,AppG (fromList [EmptyG])),(WildPatG,Nothing,LitG)])

*)

(* type error slice
(11,4)-(22,13)
(11,22)-(22,11)
(12,3)-(22,11)
(13,14)-(13,17)
(15,14)-(15,40)
(15,14)-(15,46)
(15,15)-(15,24)
(15,27)-(15,39)
(15,43)-(15,46)
(16,16)-(16,42)
(16,16)-(16,48)
(16,17)-(16,26)
(16,45)-(16,48)
(17,17)-(17,71)
(17,18)-(17,47)
(17,19)-(17,40)
(17,20)-(17,24)
(17,43)-(17,46)
(17,66)-(17,71)
(18,15)-(18,35)
(18,15)-(18,50)
(18,31)-(18,34)
(20,7)-(21,14)
(20,8)-(20,61)
(20,10)-(20,38)
(20,11)-(20,31)
(20,12)-(20,15)
(20,34)-(20,37)
(20,57)-(20,60)
(21,11)-(21,14)
(22,10)-(22,11)
*)
