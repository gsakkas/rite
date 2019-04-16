
let rec mulByDigit i l =
  match l with | [] -> [] | 0 -> [] | hd::tl -> (mulByDigit i tl) @ (hd * i);;


(* fix

let rec mulByDigit i l =
  match l with | [] -> [] | hd::tl -> (mulByDigit i tl) @ [hd * i];;

*)

(* changed spans
(3,3)-(3,77)
match l with
| [] -> []
| hd :: tl -> mulByDigit i
                         tl @ [hd * i]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(3,3)-(3,77)
(3,49)-(3,77)
(3,67)-(3,68)
(3,69)-(3,77)
*)
