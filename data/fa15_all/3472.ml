
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = explode l listReverse "nikhil";;


(* fix

let rec listReverse l = match l with | [] -> [];;

*)

(* changed spans
(7,24)-(7,31)
match l with
| [] -> []
CaseG VarG (fromList [(Nothing,ListG EmptyG Nothing)])

(7,46)-(7,54)
[]
ListG EmptyG Nothing

*)
