
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
(6,25)-(6,74)
append (digitsOfInt (n / 10))
       (n - ((n / 10) * 10))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

(6,32)-(6,43)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
