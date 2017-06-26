
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
  | Sine s -> String.concat ("sin(pi*", (exprToString s), ")")
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
(15,14)-(15,62)
(15,28)-(15,62)
(15,29)-(15,38)
(16,16)-(16,46)
(16,16)-(16,52)
(16,17)-(16,26)
(18,6)-(18,60)
(18,6)-(18,68)
(18,7)-(18,40)
(18,8)-(18,33)
(18,9)-(18,13)
(19,19)-(19,43)
(19,19)-(19,62)
(19,20)-(19,36)
(21,6)-(24,28)
(21,6)-(25,13)
(21,7)-(23,16)
(21,8)-(22,28)
(21,9)-(21,70)
(21,10)-(21,63)
(21,11)-(21,43)
(21,12)-(21,36)
(21,13)-(21,16)
(26,9)-(26,10)
*)

(* type error slice
(11,3)-(26,12)
(11,21)-(26,10)
(12,2)-(26,10)
(13,13)-(13,16)
(15,14)-(15,27)
(15,14)-(15,62)
(15,28)-(15,62)
(16,16)-(16,46)
(16,16)-(16,52)
(16,17)-(16,26)
(16,29)-(16,45)
(16,30)-(16,42)
(16,49)-(16,52)
(18,6)-(18,68)
(18,7)-(18,40)
(18,8)-(18,33)
(18,9)-(18,13)
(18,36)-(18,39)
(18,63)-(18,68)
(19,19)-(19,43)
(19,19)-(19,62)
(19,39)-(19,42)
(21,6)-(25,13)
(21,7)-(23,16)
(21,9)-(21,70)
(21,11)-(21,43)
(21,12)-(21,36)
(21,13)-(21,16)
(21,39)-(21,42)
(21,66)-(21,69)
(23,12)-(23,15)
(25,10)-(25,13)
(26,9)-(26,10)
*)

(* all spans
(11,21)-(26,10)
(12,2)-(26,10)
(12,8)-(12,9)
(13,13)-(13,16)
(14,13)-(14,16)
(15,14)-(15,62)
(15,14)-(15,27)
(15,28)-(15,62)
(15,29)-(15,38)
(15,40)-(15,56)
(15,41)-(15,53)
(15,54)-(15,55)
(15,58)-(15,61)
(16,16)-(16,52)
(16,16)-(16,46)
(16,17)-(16,26)
(16,29)-(16,45)
(16,30)-(16,42)
(16,43)-(16,44)
(16,49)-(16,52)
(18,6)-(18,68)
(18,6)-(18,60)
(18,7)-(18,40)
(18,8)-(18,33)
(18,9)-(18,13)
(18,16)-(18,32)
(18,17)-(18,29)
(18,30)-(18,31)
(18,36)-(18,39)
(18,43)-(18,59)
(18,44)-(18,56)
(18,57)-(18,58)
(18,63)-(18,68)
(19,19)-(19,62)
(19,19)-(19,43)
(19,20)-(19,36)
(19,21)-(19,33)
(19,34)-(19,35)
(19,39)-(19,42)
(19,46)-(19,62)
(19,47)-(19,59)
(19,60)-(19,61)
(21,6)-(25,13)
(21,6)-(24,28)
(21,7)-(23,16)
(21,8)-(22,28)
(21,9)-(21,70)
(21,10)-(21,63)
(21,11)-(21,43)
(21,12)-(21,36)
(21,13)-(21,16)
(21,19)-(21,35)
(21,20)-(21,32)
(21,33)-(21,34)
(21,39)-(21,42)
(21,46)-(21,62)
(21,47)-(21,59)
(21,60)-(21,61)
(21,66)-(21,69)
(22,11)-(22,27)
(22,12)-(22,24)
(22,25)-(22,26)
(23,12)-(23,15)
(24,11)-(24,27)
(24,12)-(24,24)
(24,25)-(24,26)
(25,10)-(25,13)
(26,9)-(26,10)
*)
