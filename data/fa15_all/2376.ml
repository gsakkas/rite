
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
(4,38)-(4,40)
t
VarG

(4,51)-(4,52)
[]
ListG (fromList [])

(10,1)-(10,1)
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

(11,21)-(12,58)
EMPTY
EmptyG

(14,22)-(18,76)
match x with
| [] -> true
| h :: t -> if getHead x = getHead (listReverse x)
            then matchHeads (getTail (listReverse t))
            else false
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,IteG EmptyG EmptyG EmptyG),(ConPatG Nothing,Nothing,LitG)])

(23,13)-(23,61)
matchHeads [["b"]]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(6,4)-(9,9)
(6,13)-(9,7)
(7,3)-(9,7)
(8,44)-(8,51)
(8,44)-(8,67)
(8,45)-(8,50)
(8,55)-(8,67)
(8,56)-(8,58)
(9,3)-(9,5)
(9,3)-(9,7)
(15,3)-(18,76)
(15,9)-(15,10)
(18,10)-(18,21)
(18,11)-(18,18)
(18,19)-(18,20)
(18,41)-(18,51)
(18,41)-(18,65)
(18,52)-(18,53)
(23,13)-(23,23)
(23,13)-(23,61)
(23,24)-(23,35)
(23,25)-(23,32)
*)
