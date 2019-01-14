
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let cutTail z = match listReverse z with | [] -> [] | h::t -> t;;

let getHeads x = match listReverse x with | [] -> [] | h::t -> h;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y =
  match y with
  | [] -> true
  | h::t -> if h = (getHeads t) then matchHeads (cutTail t) else false;;

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
(17,37)-(17,47)
fun x ->
  match explode x with
  | h :: t -> false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(17,48)-(17,59)
match explode x with
| h :: t -> false
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,LitG)])

(17,57)-(17,58)
explode
VarG

(17,65)-(17,70)
x
VarG

*)
