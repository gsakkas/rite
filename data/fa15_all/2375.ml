
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match explode x with
  | h::t ->
      if (getHeads (explode x)) = []
      then true
      else if [h] = (getHeads t) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let getHeads y = match listReverse y with | [] -> [] | h::t -> [h];;

let loseTail z = match listReverse z with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x =
  match x with
  | h::t ->
      if (getHeads x) = []
      then true
      else if [h] = (getHeads t) then matchHeads (loseTail t) else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(7,12)-(10,6)
listReverse
VarG

(7,12)-(10,6)
z
VarG

(7,12)-(10,6)
t
VarG

(7,12)-(10,6)
fun z ->
  match listReverse z with
  | [] -> []
  | h :: t -> t
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(7,12)-(10,6)
listReverse z
AppG (fromList [VarG])

(7,12)-(10,6)
match listReverse z with
| [] -> []
| h :: t -> t
CaseG (AppG (fromList [EmptyG])) (fromList [(Nothing,VarG),(Nothing,ListG EmptyG Nothing)])

(7,12)-(10,6)
[]
ListG EmptyG Nothing

(17,38)-(17,42)
matchHeads (loseTail t)
AppG (fromList [AppG (fromList [EmptyG])])

(17,48)-(17,53)
matchHeads
VarG

(17,48)-(17,53)
loseTail
VarG

(17,48)-(17,53)
t
VarG

(17,48)-(17,53)
loseTail t
AppG (fromList [VarG])

*)
