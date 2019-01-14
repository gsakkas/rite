
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> [] | h::t -> w @ [];;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,15)-(7,67)
explode
VarG

(7,15)-(7,67)
x
VarG

(7,15)-(7,67)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,15)-(7,67)
explode x
AppG (fromList [VarG])

(7,15)-(7,67)
false
LitG

(7,15)-(7,67)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(7,61)-(7,62)
matchHeads
VarG

(7,61)-(7,62)
matchHeads w
AppG (fromList [VarG])

(7,63)-(7,64)
true
LitG

*)
