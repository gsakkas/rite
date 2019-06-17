
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else n - ((n / 10) * (10 append digitsOfInt (n / 10)));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (n - ((n / 10) * 10)) :: (digitsOfInt (n / 10));;

*)

(* changed spans
(6,26)-(6,75)
(n - ((n / 10) * 10)) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)

(* type error slice
(6,3)-(6,75)
(6,18)-(6,20)
(6,26)-(6,75)
(6,42)-(6,74)
(6,43)-(6,45)
*)
