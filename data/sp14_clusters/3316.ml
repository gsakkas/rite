
let rec mulByDigit i l = match l with | [] -> [] | h::t -> h * i;;


(* fix

let rec mulByDigit i l = match l with | [] -> [] | h::m::t -> t;;

*)

(* changed spans
(2,25)-(2,64)
match l with
| [] -> []
| h :: m :: t -> t
CaseG VarG [(Nothing,ListG EmptyG Nothing),(Nothing,VarG)]

(2,63)-(2,64)
t
VarG

*)
