
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
(13,27)-(13,62)
aPHelper (sumList (digits n))
         (i + 1)
AppG [AppG [EmptyG],BopG EmptyG EmptyG]

*)

(* type error slice
(12,3)-(14,4)
(12,20)-(13,62)
(12,22)-(13,62)
(13,5)-(13,62)
(13,27)-(13,35)
(13,27)-(13,62)
*)
