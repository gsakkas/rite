
let rec append list1 list2 =
  match list1 with | [] -> list2 | h::t -> h :: (append t list2);;

let rec listReverse l =
  match l with | [] -> [] | h::t -> append (listReverse t) [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse (append [n mod 10] digitsOfInt (n / 10));;
