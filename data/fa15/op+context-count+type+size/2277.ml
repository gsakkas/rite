
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
(15,15)-(15,24)
(15,15)-(15,39)
(15,15)-(15,46)
(15,27)-(15,39)
(15,43)-(15,46)
(16,17)-(16,26)
(16,17)-(16,41)
(16,17)-(16,48)
(16,29)-(16,41)
(16,45)-(16,48)
(17,20)-(17,24)
(17,20)-(17,39)
(17,20)-(17,46)
(17,20)-(17,62)
(17,20)-(17,71)
(17,27)-(17,39)
(17,43)-(17,46)
(17,50)-(17,62)
(17,66)-(17,71)
(18,16)-(18,28)
(18,16)-(18,34)
(18,16)-(18,50)
(18,31)-(18,34)
(18,38)-(18,50)
(20,12)-(20,15)
(20,12)-(20,30)
(20,12)-(20,37)
(20,12)-(20,53)
(20,12)-(20,60)
(20,12)-(20,76)
(20,12)-(21,14)
(20,18)-(20,30)
(20,34)-(20,37)
(20,41)-(20,53)
(20,57)-(20,60)
(20,64)-(20,76)
(21,11)-(21,14)
(22,10)-(22,11)
*)

(* type error slice
(11,4)-(22,13)
(11,22)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(12,3)-(22,11)
(13,14)-(13,17)
(15,15)-(15,24)
(15,15)-(15,39)
(15,15)-(15,39)
(15,15)-(15,46)
(15,15)-(15,46)
(15,27)-(15,39)
(15,43)-(15,46)
(16,17)-(16,26)
(16,17)-(16,41)
(16,17)-(16,48)
(16,17)-(16,48)
(16,45)-(16,48)
(17,20)-(17,24)
(17,20)-(17,39)
(17,20)-(17,46)
(17,20)-(17,71)
(17,20)-(17,71)
(17,43)-(17,46)
(17,66)-(17,71)
(18,16)-(18,34)
(18,16)-(18,50)
(18,31)-(18,34)
(20,12)-(20,15)
(20,12)-(20,30)
(20,12)-(20,37)
(20,12)-(20,60)
(20,12)-(21,14)
(20,12)-(21,14)
(20,34)-(20,37)
(20,57)-(20,60)
(21,11)-(21,14)
(22,10)-(22,11)
*)
