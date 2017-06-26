
let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] -> if (i * h) > 10 then [carry i h] @ [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;


(* fix

let carry x y = (x * y) / 10;;

let remainder x y = (x * y) mod 10;;

let rec mulByDigit i l =
  if (i = 0) || (i > 9)
  then []
  else
    (match List.rev l with
     | [] -> []
     | h::t ->
         (match t with
          | [] ->
              if (i * h) > 10
              then [carry i h] @ [remainder i h]
              else [remainder i h]
          | h'::t' ->
              (mulByDigit i t') @
                ([(remainder h' i) + (carry h i)] @ [remainder h i])));;

*)

(* changed spans
(14,18)-(14,68)
(16,32)-(16,33)
*)

(* type error slice
(14,18)-(14,68)
(14,39)-(14,68)
(14,51)-(14,52)
*)

(* all spans
(2,10)-(2,28)
(2,12)-(2,28)
(2,16)-(2,28)
(2,16)-(2,23)
(2,17)-(2,18)
(2,21)-(2,22)
(2,26)-(2,28)
(4,14)-(4,34)
(4,16)-(4,34)
(4,20)-(4,34)
(4,20)-(4,27)
(4,21)-(4,22)
(4,25)-(4,26)
(4,32)-(4,34)
(6,19)-(17,70)
(6,21)-(17,70)
(7,2)-(17,70)
(7,5)-(7,23)
(7,5)-(7,12)
(7,6)-(7,7)
(7,10)-(7,11)
(7,16)-(7,23)
(7,17)-(7,18)
(7,21)-(7,22)
(8,7)-(8,9)
(10,4)-(17,70)
(10,11)-(10,21)
(10,11)-(10,19)
(10,20)-(10,21)
(11,13)-(11,15)
(13,9)-(17,69)
(13,16)-(13,17)
(14,18)-(14,68)
(14,21)-(14,33)
(14,21)-(14,28)
(14,22)-(14,23)
(14,26)-(14,27)
(14,31)-(14,33)
(14,39)-(14,68)
(14,51)-(14,52)
(14,39)-(14,50)
(14,40)-(14,49)
(14,40)-(14,45)
(14,46)-(14,47)
(14,48)-(14,49)
(14,53)-(14,68)
(14,54)-(14,67)
(14,54)-(14,63)
(14,64)-(14,65)
(14,66)-(14,67)
(16,14)-(17,68)
(16,32)-(16,33)
(16,14)-(16,31)
(16,15)-(16,25)
(16,26)-(16,27)
(16,28)-(16,30)
(17,16)-(17,68)
(17,50)-(17,51)
(17,17)-(17,49)
(17,18)-(17,48)
(17,18)-(17,34)
(17,19)-(17,28)
(17,29)-(17,31)
(17,32)-(17,33)
(17,37)-(17,48)
(17,38)-(17,43)
(17,44)-(17,45)
(17,46)-(17,47)
(17,52)-(17,67)
(17,53)-(17,66)
(17,53)-(17,62)
(17,63)-(17,64)
(17,65)-(17,66)
*)
