
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
(12,6)-(12,17)
(12,33)-(12,44)
(12,34)-(12,41)
*)

(* all spans
(2,12)-(5,6)
(3,2)-(5,6)
(3,13)-(4,66)
(4,4)-(4,66)
(4,7)-(4,29)
(4,7)-(4,8)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(4,35)-(4,37)
(4,43)-(4,66)
(4,43)-(4,50)
(4,44)-(4,49)
(4,44)-(4,45)
(4,47)-(4,48)
(4,54)-(4,66)
(4,55)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,6)
(5,2)-(5,4)
(5,5)-(5,6)
(7,16)-(9,11)
(8,2)-(9,11)
(8,17)-(8,74)
(8,22)-(8,74)
(8,39)-(8,41)
(8,54)-(8,74)
(8,54)-(8,60)
(8,61)-(8,71)
(8,62)-(8,64)
(8,68)-(8,70)
(8,72)-(8,74)
(9,2)-(9,11)
(9,2)-(9,8)
(9,9)-(9,11)
(11,15)-(12,65)
(12,2)-(12,65)
(12,5)-(12,44)
(12,5)-(12,30)
(12,6)-(12,17)
(12,18)-(12,29)
(12,19)-(12,26)
(12,27)-(12,28)
(12,33)-(12,44)
(12,34)-(12,41)
(12,42)-(12,43)
(12,50)-(12,54)
(12,60)-(12,65)
*)
