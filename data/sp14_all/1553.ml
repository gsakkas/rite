
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

let palindrome w =
  if (listReverse explode w) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listHelper l l2 =
    match l with | [] -> l2 | h::t -> listHelper t (h :: l2) in
  listHelper l [];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(13,6)-(13,29)
listReverse (explode w)
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,4)-(10,20)
(7,21)-(10,18)
(8,3)-(10,18)
(9,5)-(9,61)
(9,26)-(9,28)
(9,39)-(9,49)
(9,39)-(9,61)
(9,52)-(9,61)
(9,58)-(9,60)
(10,3)-(10,13)
(10,3)-(10,18)
(13,6)-(13,29)
(13,7)-(13,18)
*)
