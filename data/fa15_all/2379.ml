
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with
  | [] -> true
  | h::t -> matchHeads (listReverse (explode w)) (listReverse (explode w));;


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

(14,20)-(20,16)
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(19,11)-(19,21)
listReverse
VarG

(19,11)-(19,21)
x
VarG

(19,11)-(19,21)
matchHeads (getTail (listReverse t))
AppG (fromList [AppG (fromList [EmptyG])])

(19,35)-(19,36)
listReverse t
AppG (fromList [VarG])

(20,11)-(20,16)
listReverse
VarG

(20,11)-(20,16)
t
VarG

(25,71)-(25,72)
matchHeads
VarG

*)
