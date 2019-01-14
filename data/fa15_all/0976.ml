
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
(15,14)-(15,44)
String.concat ""
              ["sin(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(15,15)-(15,24)
String.concat
VarG

(15,15)-(15,24)
""
LitG

(15,15)-(15,24)
["sin(pi*" ; exprToString s ; ")"]
ListG LitG Nothing

(16,16)-(16,46)
String.concat ""
              ["cos(pi*" ; exprToString s ; ")"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(16,17)-(16,26)
String.concat
VarG

(16,17)-(16,26)
""
LitG

(16,17)-(16,26)
["cos(pi*" ; exprToString s ; ")"]
ListG LitG Nothing

(18,8)-(18,33)
String.concat ""
              ["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(18,9)-(18,13)
String.concat
VarG

(18,9)-(18,13)
""
LitG

(18,9)-(18,13)
["((" ; exprToString s ; "+" ; exprToString p ; ")/2"]
ListG LitG Nothing

(19,19)-(19,43)
String.concat ""
              [exprToString s ; "*" ; exprToString p]
AppG (fromList [LitG,ListG EmptyG Nothing])

(19,20)-(19,36)
String.concat
VarG

(19,20)-(19,36)
""
LitG

(19,20)-(19,36)
[exprToString s ; "*" ; exprToString p]
ListG LitG Nothing

(21,12)-(21,36)
String.concat ""
              ["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
AppG (fromList [LitG,ListG EmptyG Nothing])

(21,13)-(21,16)
String.concat
VarG

(21,13)-(21,16)
""
LitG

(21,13)-(21,16)
["(" ; exprToString s ; "<" ; exprToString p ; "?" ; exprToString r ; ":" ; exprToString d ; ")"]
ListG LitG Nothing

(26,9)-(26,10)
""
LitG

*)
