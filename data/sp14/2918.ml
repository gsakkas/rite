
let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a :: x in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | 0 -> [] | a -> if a < 0 then [] else (clone x (n - 1)) @ [x];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let carry = match a with | (x,y) -> x in
      match x with
      | (addend_a,addend_b) ->
          let new_carry = ((carry + addend_a) + addend_b) / 10 in
          let digit = ((carry + addend_a) + addend_b) mod 10 in
          (match a with | (x,y) -> (new_carry, (digit :: y))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,16)-(15,17)
(15,16)-(15,22)
(16,4)-(17,68)
(16,15)-(16,17)
(17,15)-(17,17)
(17,21)-(17,68)
*)

(* type error slice
(15,4)-(17,68)
(15,10)-(15,22)
(15,12)-(15,22)
(15,16)-(15,17)
(15,16)-(15,22)
(17,35)-(17,49)
(17,35)-(17,61)
(17,50)-(17,51)
*)

(* all spans
(2,14)-(3,77)
(2,16)-(3,77)
(3,2)-(3,77)
(3,8)-(3,9)
(3,22)-(3,24)
(3,32)-(3,77)
(3,35)-(3,40)
(3,35)-(3,36)
(3,39)-(3,40)
(3,46)-(3,48)
(3,54)-(3,77)
(3,72)-(3,73)
(3,54)-(3,71)
(3,55)-(3,60)
(3,61)-(3,62)
(3,63)-(3,70)
(3,64)-(3,65)
(3,68)-(3,69)
(3,74)-(3,77)
(3,75)-(3,76)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(6,5)-(6,40)
(6,5)-(6,21)
(6,6)-(6,17)
(6,18)-(6,20)
(6,24)-(6,40)
(6,25)-(6,36)
(6,37)-(6,39)
(7,7)-(7,77)
(7,8)-(7,10)
(7,12)-(7,76)
(7,13)-(7,24)
(7,25)-(7,72)
(7,26)-(7,31)
(7,32)-(7,33)
(7,34)-(7,71)
(7,35)-(7,51)
(7,36)-(7,47)
(7,48)-(7,50)
(7,54)-(7,70)
(7,55)-(7,66)
(7,67)-(7,69)
(7,73)-(7,75)
(8,7)-(8,77)
(8,8)-(8,72)
(8,9)-(8,20)
(8,21)-(8,68)
(8,22)-(8,27)
(8,28)-(8,29)
(8,30)-(8,67)
(8,31)-(8,47)
(8,32)-(8,43)
(8,44)-(8,46)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(8,69)-(8,71)
(8,74)-(8,76)
(10,19)-(11,68)
(11,2)-(11,68)
(11,8)-(11,9)
(11,23)-(11,24)
(11,35)-(11,68)
(11,38)-(11,43)
(11,38)-(11,39)
(11,42)-(11,43)
(11,49)-(11,61)
(11,49)-(11,59)
(11,60)-(11,61)
(11,67)-(11,68)
(13,11)-(18,34)
(13,14)-(18,34)
(14,2)-(18,34)
(14,11)-(17,68)
(15,4)-(17,68)
(15,10)-(15,22)
(15,12)-(15,22)
(15,16)-(15,22)
(15,16)-(15,17)
(15,21)-(15,22)
(16,4)-(17,68)
(16,15)-(16,17)
(17,4)-(17,68)
(17,15)-(17,17)
(17,21)-(17,68)
(17,35)-(17,61)
(17,35)-(17,49)
(17,50)-(17,51)
(17,52)-(17,56)
(17,57)-(17,61)
(17,65)-(17,68)
(18,2)-(18,34)
(18,2)-(18,12)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)
