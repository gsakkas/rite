
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(14,33)-(14,56)
(14,46)-(14,53)
*)

(* type error slice
(7,3)-(12,16)
(7,20)-(12,14)
(8,2)-(12,14)
(9,4)-(11,52)
(9,4)-(11,52)
(10,12)-(10,19)
(11,21)-(11,28)
(11,21)-(11,52)
(11,34)-(11,52)
(11,44)-(11,51)
(12,2)-(12,9)
(12,2)-(12,14)
(14,33)-(14,56)
(14,34)-(14,45)
*)
