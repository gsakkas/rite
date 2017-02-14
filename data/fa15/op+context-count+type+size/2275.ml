
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
(12,2)-(22,10)
(15,13)-(15,39)
(15,13)-(15,45)
(15,14)-(15,23)
(15,26)-(15,38)
(15,42)-(15,45)
(16,15)-(16,41)
(16,15)-(16,47)
(16,16)-(16,25)
(16,28)-(16,40)
(16,44)-(16,47)
(17,16)-(17,62)
(17,16)-(17,70)
(17,17)-(17,46)
(17,18)-(17,39)
(17,19)-(17,23)
(17,26)-(17,38)
(17,42)-(17,45)
(17,49)-(17,61)
(17,65)-(17,70)
(18,14)-(18,34)
(18,14)-(18,49)
(18,15)-(18,27)
(18,30)-(18,33)
(18,37)-(18,49)
(20,6)-(20,76)
(20,6)-(21,13)
(20,7)-(20,60)
(20,8)-(20,53)
(20,9)-(20,37)
(20,10)-(20,30)
(20,11)-(20,14)
(20,17)-(20,29)
(20,33)-(20,36)
(20,40)-(20,52)
(20,56)-(20,59)
(20,63)-(20,75)
(21,10)-(21,13)
(22,9)-(22,10)
*)

(* type error slice
(11,3)-(22,12)
(11,21)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(12,2)-(22,10)
(13,13)-(13,16)
(15,13)-(15,39)
(15,13)-(15,39)
(15,13)-(15,45)
(15,13)-(15,45)
(15,14)-(15,23)
(15,26)-(15,38)
(15,42)-(15,45)
(16,15)-(16,41)
(16,15)-(16,47)
(16,15)-(16,47)
(16,16)-(16,25)
(16,44)-(16,47)
(17,16)-(17,70)
(17,16)-(17,70)
(17,17)-(17,46)
(17,18)-(17,39)
(17,19)-(17,23)
(17,42)-(17,45)
(17,65)-(17,70)
(18,14)-(18,34)
(18,14)-(18,49)
(18,30)-(18,33)
(20,6)-(21,13)
(20,6)-(21,13)
(20,7)-(20,60)
(20,9)-(20,37)
(20,10)-(20,30)
(20,11)-(20,14)
(20,33)-(20,36)
(20,56)-(20,59)
(21,10)-(21,13)
(22,9)-(22,10)
*)
