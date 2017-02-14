
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (explode (listReverse w));;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(12,35)-(12,42)
(12,44)-(12,57)
(12,56)-(12,57)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(7,4)-(10,27)
(7,21)-(10,25)
(9,5)-(9,71)
(9,5)-(9,71)
(9,42)-(9,59)
(9,42)-(9,71)
(9,60)-(9,61)
(10,3)-(10,20)
(10,3)-(10,25)
(10,21)-(10,22)
(12,21)-(12,28)
(12,21)-(12,30)
(12,29)-(12,30)
(12,44)-(12,55)
(12,44)-(12,57)
(12,56)-(12,57)
*)
