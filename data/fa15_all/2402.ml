
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match explode w with | [] -> true | h::t -> listReverse (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads w =
  match w with
  | [] -> true
  | h::t -> if h = (List.hd (listReverse w)) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(5,6)
l
VarG

(2,12)-(5,6)
listReverse
VarG

(2,12)-(5,6)
t
VarG

(2,12)-(5,6)
(@)
VarG

(2,12)-(5,6)
h
VarG

(2,12)-(5,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(2,12)-(5,6)
listReverse t
AppG (fromList [VarG])

(2,12)-(5,6)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(2,12)-(5,6)
match l with
| [] -> []
| h :: t -> listReverse t @ [h]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(2,12)-(5,6)
[]
ListG EmptyG Nothing

(2,12)-(5,6)
[h]
ListG VarG Nothing

(7,20)-(8,57)
fun w ->
  match w with
  | [] -> true
  | h :: t -> if h = List.hd (listReverse w)
              then true
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,36)-(8,51)
h
VarG

(8,36)-(8,51)
h = List.hd (listReverse w)
BopG VarG (AppG (fromList [EmptyG]))

(8,36)-(8,51)
true
LitG

(8,36)-(8,51)
if h = List.hd (listReverse w)
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

(8,37)-(8,48)
List.hd
VarG

(8,37)-(8,48)
listReverse w
AppG (fromList [VarG])

(8,52)-(8,53)
w
VarG

(8,55)-(8,56)
w
VarG

(10,15)-(11,69)
true
LitG

(10,15)-(11,69)
false
LitG

(11,46)-(11,57)
matchHeads
VarG

*)
