
let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else append digitsOfInt (n / 10) (n - ((n / 10) * 10));;


(* fix

let rec append xs x =
  match xs with | [] -> [x] | hd::tl -> hd :: (append tl x);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) (n - ((n / 10) * 10));;

*)

(* changed spans
(6,26)-(6,75)
append (digitsOfInt (n / 10))
       (n - ((n / 10) * 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(3,41)-(3,60)
(3,47)-(3,60)
(3,48)-(3,54)
(6,26)-(6,32)
(6,26)-(6,75)
*)
