
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
converted
VarG

*)

(* type error slice
(3,3)-(5,48)
(5,15)-(5,28)
(5,15)-(5,48)
(5,29)-(5,48)
(5,30)-(5,32)
(7,4)-(10,9)
(7,13)-(10,7)
(9,13)-(9,30)
(9,14)-(9,27)
(9,28)-(9,29)
(12,4)-(12,48)
(12,21)-(12,46)
(12,25)-(12,38)
(12,25)-(12,46)
(12,39)-(12,46)
(12,40)-(12,41)
(15,19)-(15,26)
(15,19)-(15,28)
(15,27)-(15,28)
(16,18)-(16,33)
(16,19)-(16,30)
(16,31)-(16,32)
*)
