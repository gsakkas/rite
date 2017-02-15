
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs = function | [] -> xs | hd::tl -> helper (hd :: xs) tl in
  helper [];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs l =
    match l with | [] -> [] | hd::tl -> helper (hd :: xs) l in
  helper [] l;;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(8,22)-(8,74)
(8,39)-(8,41)
(8,54)-(8,74)
(8,72)-(8,74)
(9,2)-(9,8)
(9,2)-(9,11)
(11,15)-(12,65)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(3,2)-(5,6)
(4,43)-(4,66)
(4,54)-(4,66)
(4,55)-(4,57)
(5,2)-(5,4)
(5,2)-(5,6)
(7,3)-(9,13)
(7,16)-(9,11)
(8,2)-(9,11)
(8,54)-(8,60)
(8,54)-(8,74)
(9,2)-(9,8)
(9,2)-(9,11)
(12,5)-(12,30)
(12,5)-(12,44)
(12,5)-(12,44)
(12,6)-(12,17)
(12,33)-(12,44)
(12,34)-(12,41)
*)
