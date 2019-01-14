
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = (explode w) = w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(7,15)-(7,34)
l
VarG

(7,15)-(7,34)
listReverse
VarG

(7,15)-(7,34)
t
VarG

(7,15)-(7,34)
(@)
VarG

(7,15)-(7,34)
h
VarG

(7,15)-(7,34)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,15)-(7,34)
listReverse t
AppG (fromList [VarG])

(7,15)-(7,34)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,15)-(7,34)
match l with
| [] -> []
| h :: t -> listReverse t @ [h]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(7,15)-(7,34)
[]
ListG EmptyG Nothing

(7,15)-(7,34)
[h]
ListG VarG Nothing

(7,33)-(7,34)
listReverse
VarG

(7,33)-(7,34)
explode
VarG

(7,33)-(7,34)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(7,33)-(7,34)
explode w
AppG (fromList [VarG])

*)
