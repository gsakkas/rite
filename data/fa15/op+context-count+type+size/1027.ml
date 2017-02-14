
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
(14,35)-(14,56)
(14,47)-(14,54)
*)

(* type error slice
(7,4)-(12,17)
(7,21)-(12,15)
(8,3)-(12,15)
(9,5)-(11,52)
(9,5)-(11,52)
(10,13)-(10,20)
(11,22)-(11,29)
(11,22)-(11,52)
(11,36)-(11,52)
(11,45)-(11,52)
(12,3)-(12,10)
(12,3)-(12,15)
(14,35)-(14,46)
(14,35)-(14,56)
*)
