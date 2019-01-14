
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse (append [n mod 10] digitsOfInt (n / 10));;


(* fix

let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse (append [n mod 10] (digitsOfInt (n / 10)));;

*)

(* changed spans
(9,37)-(9,77)
append [n mod 10]
       (digitsOfInt (n / 10))
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(9,56)-(9,67)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)
