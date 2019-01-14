
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,2)-(3,76)
match l with
| [] -> []
| hd :: tl -> mulByDigit i
                         tl @ [hd * i]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(3,68)-(3,76)
[hd * i]
ListG (BopG EmptyG EmptyG) Nothing

*)
