
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads x y =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y) then matchHeads t (getTail y) else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (explode w) (listReverse (explode w));;


(* fix

let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead (listReverse x))
      then matchHeads (getTail (listReverse t))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads [["b"]];;

*)

(* changed spans
(6,12)-(9,6)
l
VarG

(6,12)-(9,6)
listReverse
VarG

(6,12)-(9,6)
t
VarG

(6,12)-(9,6)
(@)
VarG

(6,12)-(9,6)
h
VarG

(6,12)-(9,6)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(6,12)-(9,6)
listReverse t
AppG (fromList [VarG])

(6,12)-(9,6)
listReverse t @ [h]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(6,12)-(9,6)
match l with
| [] -> []
| h :: t -> listReverse t @ [h]
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG Nothing)])

(6,12)-(9,6)
[]
ListG EmptyG Nothing

(6,12)-(9,6)
[h]
ListG VarG Nothing

(18,40)-(18,50)
listReverse
VarG

(18,40)-(18,50)
x
VarG

(18,40)-(18,50)
matchHeads (getTail (listReverse t))
AppG (fromList [AppG (fromList [EmptyG])])

(18,40)-(18,64)
listReverse x
AppG (fromList [VarG])

(18,62)-(18,63)
listReverse t
AppG (fromList [VarG])

(18,70)-(18,75)
listReverse
VarG

(18,70)-(18,75)
t
VarG

(23,57)-(23,58)
matchHeads
VarG

*)
