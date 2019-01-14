
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = if String.length = 0 then true else explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | x::xs' -> (listReverse xs') @ [x];;

let palindrome w =
  let wList = explode w in
  let revList = listReverse wList in match revList with | wList -> true;;

*)

(* changed spans
(7,15)-(7,64)
l
VarG

(7,15)-(7,64)
listReverse
VarG

(7,15)-(7,64)
xs'
VarG

(7,15)-(7,64)
(@)
VarG

(7,15)-(7,64)
x
VarG

(7,15)-(7,64)
fun l ->
  match l with
  | [] -> []
  | x :: xs' -> listReverse xs' @ [x]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,15)-(7,64)
listReverse xs'
AppG (fromList [VarG])

(7,15)-(7,64)
listReverse xs' @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(7,15)-(7,64)
match l with
| [] -> []
| x :: xs' -> listReverse xs' @ [x]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(7,15)-(7,64)
[]
ListG EmptyG Nothing

(7,15)-(7,64)
[x]
ListG VarG Nothing

(7,45)-(7,49)
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

*)
