
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
  | Sine s -> String.concat ["sin(pi*"; exprToString s; ")"]
  | Cosine s -> ("cos(pi*" + (exprToString s)) + ")"
  | Average (s,p) ->
      ((("((" + (exprToString s)) + "+") + (exprToString p)) + ")/2"
  | Times (s,p) -> ((exprToString s) + "*") + (exprToString p)
  | Thresh (s,p,r,d) ->
      ((((((("(" + (exprToString s)) + "<") + (exprToString p)) + "?") +
           (exprToString r))
          + ":")
         + (exprToString d))
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
(15,15)-(15,61)
String.concat ""
              ["sin(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG (fromList [EmptyG])])

(16,17)-(16,53)
String.concat ""
              ["cos(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG (fromList [EmptyG])])

(18,7)-(18,69)
String.concat ""
              ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
AppG (fromList [LitG,ListG (fromList [EmptyG])])

(19,20)-(19,63)
String.concat ""
              [exprToString s ; "*" ; exprToString p]
AppG (fromList [LitG,ListG (fromList [EmptyG])])

(21,7)-(25,14)
String.concat ""
              ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
AppG (fromList [LitG,ListG (fromList [EmptyG])])

(26,10)-(26,11)
""
LitG

*)

(* type error slice
(12,3)-(26,11)
(13,14)-(13,17)
(15,15)-(15,28)
(15,15)-(15,61)
(15,29)-(15,61)
(15,30)-(15,39)
(15,41)-(15,53)
(15,41)-(15,55)
(16,17)-(16,47)
(16,17)-(16,53)
(16,18)-(16,27)
(16,30)-(16,46)
(16,31)-(16,43)
(16,50)-(16,53)
(18,7)-(18,61)
(18,7)-(18,69)
(18,8)-(18,41)
(18,9)-(18,34)
(18,10)-(18,14)
(18,17)-(18,33)
(18,18)-(18,30)
(18,37)-(18,40)
(18,44)-(18,60)
(18,45)-(18,57)
(18,64)-(18,69)
(19,20)-(19,44)
(19,20)-(19,63)
(19,21)-(19,37)
(19,22)-(19,34)
(19,40)-(19,43)
(19,47)-(19,63)
(19,48)-(19,60)
(21,7)-(24,29)
(21,7)-(25,14)
(21,8)-(23,17)
(21,9)-(22,29)
(21,10)-(21,71)
(21,11)-(21,64)
(21,12)-(21,44)
(21,13)-(21,37)
(21,14)-(21,17)
(21,20)-(21,36)
(21,21)-(21,33)
(21,40)-(21,43)
(21,47)-(21,63)
(21,48)-(21,60)
(21,67)-(21,70)
(22,12)-(22,28)
(22,13)-(22,25)
(23,13)-(23,16)
(24,12)-(24,28)
(24,13)-(24,25)
(25,11)-(25,14)
(26,10)-(26,11)
*)
