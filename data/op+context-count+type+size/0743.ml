
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(10,49)-(10,50)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(4,56)-(4,58)
(4,56)-(4,65)
(4,60)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(5,6)-(5,7)
(8,3)-(8,58)
(8,38)-(8,49)
(8,38)-(8,51)
(8,50)-(8,51)
(10,21)-(10,32)
(10,21)-(10,43)
(10,21)-(10,50)
(10,34)-(10,41)
(10,34)-(10,43)
(10,42)-(10,43)
(10,49)-(10,50)
*)
