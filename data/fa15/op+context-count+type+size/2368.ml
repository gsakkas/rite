
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
(2,13)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(4,21)-(5,58)
(5,3)-(5,58)
(5,9)-(5,10)
(5,24)-(5,26)
(5,38)-(5,49)
(5,38)-(5,51)
(5,38)-(5,58)
(5,50)-(5,51)
(5,53)-(5,54)
(5,55)-(5,58)
(5,56)-(5,57)
(8,3)-(10,7)
(20,16)-(21,68)
*)

(* type error slice
(2,4)-(2,54)
(2,13)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,17)-(2,52)
(2,23)-(2,24)
(2,38)-(2,40)
(2,51)-(2,52)
(5,3)-(5,58)
(5,3)-(5,58)
(5,38)-(5,49)
(5,38)-(5,51)
(5,38)-(5,58)
(5,50)-(5,51)
(5,53)-(5,54)
(5,55)-(5,58)
(5,55)-(5,58)
(5,56)-(5,57)
(7,4)-(10,9)
(7,13)-(10,7)
(8,3)-(10,7)
(9,45)-(9,50)
(9,45)-(9,50)
(9,45)-(9,65)
(9,45)-(9,65)
(9,56)-(9,58)
(9,56)-(9,65)
(10,3)-(10,5)
(10,3)-(10,7)
(16,11)-(16,18)
(16,11)-(16,20)
(16,19)-(16,20)
(16,34)-(16,45)
(16,34)-(16,47)
(16,46)-(16,47)
(17,12)-(17,22)
(17,12)-(17,37)
(17,24)-(17,35)
(17,24)-(17,37)
(21,47)-(21,57)
(21,47)-(21,68)
(21,59)-(21,66)
(21,59)-(21,68)
*)
