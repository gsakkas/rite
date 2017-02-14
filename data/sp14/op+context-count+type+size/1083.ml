
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
(16,31)-(16,32)
*)

(* type error slice
(3,3)-(5,46)
(3,3)-(5,46)
(5,15)-(5,28)
(5,15)-(5,46)
(5,30)-(5,32)
(5,30)-(5,46)
(7,4)-(10,9)
(7,13)-(10,7)
(9,14)-(9,27)
(9,14)-(9,29)
(9,28)-(9,29)
(12,4)-(12,48)
(12,21)-(12,45)
(12,25)-(12,38)
(12,25)-(12,45)
(12,40)-(12,41)
(12,40)-(12,45)
(15,19)-(15,26)
(15,19)-(15,28)
(15,27)-(15,28)
(16,19)-(16,30)
(16,19)-(16,32)
(16,31)-(16,32)
*)
