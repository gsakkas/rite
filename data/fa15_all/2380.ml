
let getHead h = match h with | [] -> [] | h::t -> h;;

let getTail t = match t with | [] -> [] | h::t -> t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads (x,y) =
  match x with
  | [] -> true
  | h::t ->
      if (getHead x) = (getHead y)
      then matchHeads (t, (getTail y))
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


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
(11,21)-(17,17)
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
LamG VarPatG (CaseG EmptyG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG),(ConPatG Nothing,Nothing,EmptyG)]))

(20,58)-(20,69)
[["b"]]
ListG (fromList [ListG (fromList [EmptyG])])

*)

(* type error slice
(6,4)-(9,9)
(6,13)-(9,7)
(7,3)-(9,7)
(8,44)-(8,67)
(8,55)-(8,67)
(8,56)-(8,58)
(9,3)-(9,5)
(9,3)-(9,7)
(16,12)-(16,22)
(16,12)-(16,39)
(16,23)-(16,39)
(20,47)-(20,57)
(20,47)-(20,69)
(20,58)-(20,69)
(20,59)-(20,66)
*)
