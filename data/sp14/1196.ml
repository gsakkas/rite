
let digitsOfInt n =
  let rec loop n tlist =
    if n = 0 then tlist else loop (n / 10) ((n mod 10) :: tlist) in
  match n with | 0 -> [0] | _ -> loop n [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec aPHelper n i =
    if n < 10 then i else aPHelper sumList (digits n) (i + 1) in
  n;;


(* fix

let digitsOfInt n =
  let rec loop n tlist =
    if n = 0 then tlist else loop (n / 10) ((n mod 10) :: tlist) in
  match n with | 0 -> [0] | _ -> loop n [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec aPHelper n i =
    if n < 10 then i else aPHelper (sumList (digits n)) (i + 1) in
  n;;

*)

(* changed spans
(13,26)-(13,61)
(13,35)-(13,42)
*)

(* type error slice
(12,2)-(14,3)
(12,19)-(13,61)
(12,21)-(13,61)
(13,4)-(13,61)
(13,26)-(13,34)
(13,26)-(13,61)
*)

(* all spans
(2,16)-(5,42)
(3,2)-(5,42)
(3,15)-(4,64)
(3,17)-(4,64)
(4,4)-(4,64)
(4,7)-(4,12)
(4,7)-(4,8)
(4,11)-(4,12)
(4,18)-(4,23)
(4,29)-(4,64)
(4,29)-(4,33)
(4,34)-(4,42)
(4,35)-(4,36)
(4,39)-(4,41)
(4,43)-(4,64)
(4,44)-(4,54)
(4,45)-(4,46)
(4,51)-(4,53)
(4,58)-(4,63)
(5,2)-(5,42)
(5,8)-(5,9)
(5,22)-(5,25)
(5,23)-(5,24)
(5,33)-(5,42)
(5,33)-(5,37)
(5,38)-(5,39)
(5,40)-(5,42)
(7,11)-(7,34)
(7,15)-(7,34)
(7,15)-(7,26)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,16)-(9,74)
(9,21)-(9,74)
(9,27)-(9,29)
(9,43)-(9,44)
(9,57)-(9,74)
(9,57)-(9,59)
(9,62)-(9,74)
(9,63)-(9,70)
(9,71)-(9,73)
(11,28)-(14,3)
(12,2)-(14,3)
(12,19)-(13,61)
(12,21)-(13,61)
(13,4)-(13,61)
(13,7)-(13,13)
(13,7)-(13,8)
(13,11)-(13,13)
(13,19)-(13,20)
(13,26)-(13,61)
(13,26)-(13,34)
(13,35)-(13,42)
(13,43)-(13,53)
(13,44)-(13,50)
(13,51)-(13,52)
(13,54)-(13,61)
(13,55)-(13,56)
(13,59)-(13,60)
(14,2)-(14,3)
*)
