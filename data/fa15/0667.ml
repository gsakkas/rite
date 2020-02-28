
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
(14,34)-(14,57)
listReverse (explode w)
AppG [AppG [EmptyG]]

*)

(* type error slice
(7,4)-(12,17)
(7,21)-(12,15)
(8,3)-(12,15)
(9,5)-(11,53)
(10,13)-(10,20)
(11,22)-(11,29)
(11,22)-(11,53)
(11,35)-(11,53)
(11,45)-(11,52)
(12,3)-(12,10)
(12,3)-(12,15)
(14,34)-(14,57)
(14,35)-(14,46)
*)
