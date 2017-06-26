
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  let digOfInt n =
    match n > 0 with
    | false  -> []
    | true  ->
        (match n > 9 with
         | false  -> n :: (digitsOfInt (n / 10))
         | true  -> (n mod 10) :: (digitsOfInt (n / 10))) in
  listReverse n;;


(* fix

let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  listReverse
    (match n > 0 with
     | false  -> []
     | true  ->
         (match n > 9 with
          | false  -> n :: (digitsOfInt (n / 10))
          | true  -> (n mod 10) :: (digitsOfInt (n / 10))));;

let rec digOfInt n =
  match n > 0 with
  | false  -> []
  | true  ->
      (match n > 9 with
       | false  -> n :: (digitsOfInt (n / 10))
       | true  -> (n mod 10) :: (digitsOfInt (n / 10)));;

let rec digitsOfInt n = digOfInt n;;

*)

(* changed spans
(8,2)-(15,15)
(8,15)-(14,57)
(15,2)-(15,13)
(15,2)-(15,15)
*)

(* type error slice
(2,3)-(5,22)
(2,16)-(5,20)
(4,4)-(4,63)
(4,38)-(4,51)
(4,38)-(4,63)
(4,52)-(4,53)
(5,2)-(5,15)
(5,2)-(5,20)
(5,16)-(5,17)
(7,3)-(15,17)
(7,20)-(15,15)
(13,26)-(13,48)
(13,27)-(13,38)
(13,39)-(13,47)
(15,2)-(15,13)
(15,2)-(15,15)
(15,14)-(15,15)
*)

(* all spans
(2,16)-(5,20)
(3,2)-(5,20)
(3,24)-(4,63)
(3,26)-(4,63)
(4,4)-(4,63)
(4,10)-(4,11)
(4,25)-(4,27)
(4,38)-(4,63)
(4,38)-(4,51)
(4,52)-(4,53)
(4,54)-(4,63)
(4,55)-(4,56)
(4,60)-(4,62)
(5,2)-(5,20)
(5,2)-(5,15)
(5,16)-(5,17)
(5,18)-(5,20)
(7,20)-(15,15)
(8,2)-(15,15)
(8,15)-(14,57)
(9,4)-(14,57)
(9,10)-(9,15)
(9,10)-(9,11)
(9,14)-(9,15)
(10,16)-(10,18)
(12,8)-(14,57)
(12,15)-(12,20)
(12,15)-(12,16)
(12,19)-(12,20)
(13,21)-(13,48)
(13,21)-(13,22)
(13,26)-(13,48)
(13,27)-(13,38)
(13,39)-(13,47)
(13,40)-(13,41)
(13,44)-(13,46)
(14,20)-(14,56)
(14,20)-(14,30)
(14,21)-(14,22)
(14,27)-(14,29)
(14,34)-(14,56)
(14,35)-(14,46)
(14,47)-(14,55)
(14,48)-(14,49)
(14,52)-(14,54)
(15,2)-(15,15)
(15,2)-(15,13)
(15,14)-(15,15)
*)
