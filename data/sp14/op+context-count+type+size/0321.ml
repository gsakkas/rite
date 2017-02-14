
let append x l = match l with | [] -> [x] | _ -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* fix

let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,17)-(2,55)
(2,23)-(2,24)
(2,38)-(2,41)
(2,39)-(2,40)
(2,49)-(2,50)
(2,49)-(2,55)
(4,20)-(5,65)
(5,25)-(5,31)
(5,32)-(5,54)
(5,33)-(5,44)
(5,45)-(5,53)
(5,46)-(5,47)
(5,50)-(5,52)
(5,55)-(5,65)
(5,56)-(5,57)
(5,56)-(5,64)
(5,62)-(5,64)
*)

(* type error slice
(2,3)-(2,57)
(2,11)-(2,55)
(2,13)-(2,55)
(2,49)-(2,50)
(2,49)-(2,55)
(2,49)-(2,55)
(2,54)-(2,55)
(4,3)-(5,67)
(4,20)-(5,65)
(5,2)-(5,65)
(5,17)-(5,19)
(5,25)-(5,31)
(5,25)-(5,65)
(5,32)-(5,54)
(5,33)-(5,44)
(5,55)-(5,65)
(5,55)-(5,65)
(5,56)-(5,64)
*)
