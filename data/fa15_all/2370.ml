
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y = match y with | [] -> [] | h::t -> t;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,57)-(7,58)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(9,15)-(10,68)
explode
VarG

(9,15)-(10,68)
x
VarG

(9,15)-(10,68)
explode x
AppG (fromList [VarG])

(9,15)-(10,68)
false
LitG

(9,15)-(10,68)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

*)
