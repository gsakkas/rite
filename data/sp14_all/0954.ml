
let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList n));;


(* fix

let rec append xs1 xs2 =
  match xs1 with | [] -> xs2 | hd::tl -> hd :: (append tl xs2);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n - ((n / 10) * 10)];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(5,59)-(5,60)
digits n
AppG (fromList [VarG])

*)

(* type error slice
(2,22)-(2,75)
(2,63)-(2,75)
(2,64)-(2,71)
(2,72)-(2,74)
(5,6)-(5,7)
(5,6)-(5,12)
(5,10)-(5,12)
(5,50)-(5,61)
(5,51)-(5,58)
(5,59)-(5,60)
*)
