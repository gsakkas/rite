
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
(3,3)-(5,7)
(4,45)-(4,65)
(4,56)-(4,58)
(4,56)-(4,65)
(5,3)-(5,5)
(5,3)-(5,7)
(7,4)-(9,14)
(7,17)-(9,12)
(8,3)-(9,12)
(8,55)-(8,61)
(8,55)-(8,75)
(9,3)-(9,9)
(9,3)-(9,12)
(12,7)-(12,18)
(12,7)-(12,29)
(12,7)-(12,44)
(12,7)-(12,44)
(12,35)-(12,42)
(12,35)-(12,44)
*)
