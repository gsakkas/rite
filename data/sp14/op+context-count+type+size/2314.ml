
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else n = (sumList (digitsOfInt n));;


(* fix

let a = int_of_char '3';;

let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let rec loop n a = if n = 0 then a else loop (n / 10) ((n mod 10) :: a) in
     match n with | 0 -> [0] | _ -> loop n []);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then a else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,20)-(7,46)
(6,4)-(7,46)
(12,17)-(12,18)
(12,24)-(12,25)
(12,24)-(12,53)
(12,29)-(12,36)
(12,38)-(12,49)
(12,50)-(12,51)
*)

(* type error slice
(12,2)-(12,53)
(12,2)-(12,53)
(12,5)-(12,6)
(12,5)-(12,11)
(12,5)-(12,11)
(12,9)-(12,11)
(12,17)-(12,18)
(12,24)-(12,53)
*)
