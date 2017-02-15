
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
(12,49)-(12,50)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,3)-(10,22)
(7,16)-(10,20)
(9,4)-(9,61)
(9,4)-(9,61)
(9,35)-(9,48)
(9,35)-(9,61)
(9,60)-(9,61)
(10,2)-(10,15)
(10,2)-(10,20)
(10,19)-(10,20)
(12,22)-(12,33)
(12,23)-(12,30)
(12,31)-(12,32)
(12,36)-(12,51)
(12,37)-(12,48)
(12,49)-(12,50)
*)
