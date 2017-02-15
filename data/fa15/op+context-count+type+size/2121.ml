
let getHead h = match h with | [] -> [] | h::t -> h;;

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
      then matchHeads (listReverse t)
      else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match x with | [] -> true | h::t -> false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,12)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(4,20)-(5,57)
(5,2)-(5,57)
(5,8)-(5,9)
(5,23)-(5,25)
(5,36)-(5,51)
(5,36)-(5,57)
(5,37)-(5,48)
(5,49)-(5,50)
(5,52)-(5,53)
(5,54)-(5,57)
(5,55)-(5,56)
(8,2)-(10,6)
(13,2)-(18,16)
(13,8)-(13,9)
*)

(* type error slice
(2,3)-(2,53)
(2,12)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,16)-(2,51)
(2,22)-(2,23)
(2,37)-(2,39)
(2,50)-(2,51)
(5,2)-(5,57)
(5,2)-(5,57)
(5,36)-(5,51)
(5,36)-(5,57)
(5,37)-(5,48)
(5,49)-(5,50)
(5,52)-(5,53)
(5,54)-(5,57)
(5,54)-(5,57)
(5,55)-(5,56)
(7,3)-(10,8)
(7,12)-(10,6)
(8,2)-(10,6)
(9,43)-(9,50)
(9,43)-(9,66)
(9,43)-(9,66)
(9,44)-(9,49)
(9,54)-(9,66)
(9,55)-(9,57)
(10,2)-(10,4)
(10,2)-(10,6)
(16,9)-(16,20)
(16,10)-(16,17)
(16,18)-(16,19)
(16,32)-(16,47)
(16,33)-(16,44)
(16,45)-(16,46)
(17,11)-(17,21)
(17,11)-(17,37)
(17,22)-(17,37)
(17,23)-(17,34)
(21,46)-(21,56)
(21,46)-(21,68)
(21,57)-(21,68)
(21,58)-(21,65)
*)
