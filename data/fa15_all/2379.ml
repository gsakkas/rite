
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
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

(14,21)-(20,17)
EMPTY
EmptyG

(25,13)-(25,75)
matchHeads [["b"]]
AppG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(18,7)-(20,17)
(19,12)-(19,22)
(19,12)-(19,39)
(20,12)-(20,17)
(25,13)-(25,23)
(25,13)-(25,75)
*)
