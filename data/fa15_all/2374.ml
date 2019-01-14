
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = x;;

let palindrome w = match explode w with | [] -> [] | h::t -> matchHeads w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,23)-(7,24)
explode
VarG

(7,23)-(7,24)
explode x
AppG (fromList [VarG])

(7,23)-(7,24)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(9,15)-(9,73)
false
LitG

(9,48)-(9,50)
true
LitG

*)
