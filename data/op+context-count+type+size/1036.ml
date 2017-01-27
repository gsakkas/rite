
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec reverseHelper acc =
    function | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec reverseHelper acc =
    function | [] -> acc | h::t -> reverseHelper (h :: acc) t in
  reverseHelper [] l;;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(12,50)-(12,51)
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
(7,4)-(10,23)
(7,17)-(10,21)
(8,3)-(10,21)
(9,5)-(9,62)
(9,36)-(9,49)
(9,36)-(9,62)
(9,51)-(9,59)
(9,61)-(9,62)
(10,3)-(10,16)
(10,3)-(10,21)
(10,17)-(10,19)
(10,20)-(10,21)
(12,24)-(12,31)
(12,24)-(12,33)
(12,32)-(12,33)
(12,38)-(12,49)
(12,38)-(12,51)
(12,50)-(12,51)
*)
