
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> true | h::t -> explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,15)-(7,72)
explode
VarG

(7,15)-(7,72)
x
VarG

(7,15)-(7,72)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,15)-(7,72)
explode x
AppG (fromList [VarG])

(7,15)-(7,72)
false
LitG

(7,15)-(7,72)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(7,63)-(7,70)
matchHeads
VarG

*)
