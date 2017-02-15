
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
(8,2)-(15,15)
(8,15)-(14,57)
(8,17)-(14,57)
(9,4)-(14,57)
(15,2)-(15,13)
(15,2)-(15,15)
(15,14)-(15,15)
*)

(* type error slice
(2,3)-(5,22)
(2,16)-(5,20)
(4,4)-(4,63)
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
