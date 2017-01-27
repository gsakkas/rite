
let listReverse l =
  let rec reverseHelper l rl =
    match l with | [] -> rl | h::t -> reverseHelper t (h :: rl) in
  reverseHelper l [];;

let rec digitsOfInt n =
  let digOfInt n r =
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
(8,3)-(15,16)
(8,16)-(14,55)
(8,18)-(14,55)
(9,5)-(14,55)
(15,3)-(15,14)
(15,3)-(15,16)
(15,15)-(15,16)
*)

(* type error slice
(2,4)-(5,23)
(2,17)-(5,21)
(3,3)-(5,21)
(4,5)-(4,63)
(4,39)-(4,52)
(4,39)-(4,63)
(4,53)-(4,54)
(4,56)-(4,63)
(5,3)-(5,16)
(5,3)-(5,21)
(5,17)-(5,18)
(5,19)-(5,21)
(7,4)-(15,18)
(7,21)-(15,16)
(8,3)-(15,16)
(13,28)-(13,39)
(13,28)-(13,47)
(13,41)-(13,47)
(15,3)-(15,14)
(15,3)-(15,16)
(15,15)-(15,16)
*)
