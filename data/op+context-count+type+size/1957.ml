
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
(8,23)-(8,75)
(8,40)-(8,42)
(8,55)-(8,75)
(8,73)-(8,75)
(9,3)-(9,9)
(9,3)-(9,12)
(11,16)-(12,66)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,14)-(4,65)
(4,5)-(4,65)
(4,8)-(4,9)
(4,8)-(4,29)
(4,28)-(4,29)
(4,36)-(4,38)
(4,56)-(4,58)
(4,56)-(4,65)
(7,4)-(9,14)
(7,17)-(9,12)
(8,3)-(9,12)
(8,3)-(9,12)
(8,18)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,23)-(8,75)
(8,40)-(8,42)
(8,55)-(8,61)
(8,55)-(8,75)
(8,55)-(8,75)
(8,55)-(8,75)
(8,63)-(8,65)
(8,63)-(8,71)
(8,69)-(8,71)
(8,73)-(8,75)
(9,3)-(9,9)
(9,3)-(9,12)
(9,3)-(9,12)
(9,10)-(9,12)
(11,4)-(12,68)
(11,16)-(12,66)
(12,7)-(12,18)
(12,7)-(12,29)
(12,7)-(12,29)
(12,7)-(12,44)
(12,7)-(12,44)
(12,20)-(12,27)
(12,20)-(12,29)
(12,28)-(12,29)
(12,35)-(12,42)
(12,35)-(12,44)
*)
