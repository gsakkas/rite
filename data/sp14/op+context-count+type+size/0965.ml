
let rec reverseHelper (original,sofar) =
  match original with
  | [] -> sofar
  | hd::tl -> reverseHelper (tl, (hd :: sofar));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = reverseHelper (l, []);;

let palindrome w =
  let converted = explode w in
  if converted = (listReverse w) then true else false;;


(* fix

let rec reverseHelper (original,sofar) =
  match original with
  | [] -> sofar
  | hd::tl -> reverseHelper (tl, (hd :: sofar));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = reverseHelper (l, []);;

let palindrome w =
  let converted = explode w in
  if converted = (listReverse converted) then true else false;;

*)

(* changed spans
(16,30)-(16,31)
*)

(* type error slice
(3,2)-(5,47)
(3,2)-(5,47)
(5,14)-(5,27)
(5,14)-(5,47)
(5,28)-(5,47)
(5,29)-(5,31)
(7,3)-(10,8)
(7,12)-(10,6)
(9,12)-(9,29)
(9,13)-(9,26)
(9,27)-(9,28)
(12,3)-(12,47)
(12,20)-(12,45)
(12,24)-(12,37)
(12,24)-(12,45)
(12,38)-(12,45)
(12,39)-(12,40)
(15,18)-(15,25)
(15,18)-(15,27)
(15,26)-(15,27)
(16,17)-(16,32)
(16,18)-(16,29)
(16,30)-(16,31)
*)
