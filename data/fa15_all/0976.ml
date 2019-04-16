
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
  | Sine s -> ("sin(pi*" + (exprToString s)) + ")"
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
(15,15)-(15,51)
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
(11,4)-(26,13)
(11,22)-(26,11)
(12,3)-(26,11)
(13,14)-(13,17)
(15,15)-(15,45)
(15,15)-(15,51)
(15,16)-(15,25)
(15,28)-(15,44)
(15,29)-(15,41)
(15,48)-(15,51)
(16,17)-(16,47)
(16,17)-(16,53)
(16,18)-(16,27)
(16,50)-(16,53)
(18,7)-(18,69)
(18,8)-(18,41)
(18,9)-(18,34)
(18,10)-(18,14)
(18,37)-(18,40)
(18,64)-(18,69)
(19,20)-(19,44)
(19,20)-(19,63)
(19,40)-(19,43)
(21,7)-(25,14)
(21,8)-(23,17)
(21,10)-(21,71)
(21,12)-(21,44)
(21,13)-(21,37)
(21,14)-(21,17)
(21,40)-(21,43)
(21,67)-(21,70)
(23,13)-(23,16)
(25,11)-(25,14)
(26,10)-(26,11)
*)
