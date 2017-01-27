
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
    let f a x = failwith "to be implemented" in
    let base = [] in
    let args = l1 l2 in let (_,res) = List.fold_left f base args in res in
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
(15,17)-(15,25)
(15,17)-(15,45)
(15,26)-(15,45)
(16,16)-(16,18)
(17,5)-(17,72)
(17,16)-(17,18)
(17,16)-(17,21)
(17,19)-(17,21)
(17,25)-(17,72)
(17,39)-(17,53)
(17,39)-(17,65)
(17,54)-(17,55)
(17,56)-(17,60)
(17,61)-(17,65)
(17,69)-(17,72)
(18,3)-(18,13)
(18,3)-(18,33)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)

(* type error slice
(3,56)-(3,61)
(3,56)-(3,70)
(3,62)-(3,63)
(3,65)-(3,70)
(5,4)-(8,80)
(5,13)-(8,77)
(5,16)-(8,77)
(6,3)-(8,77)
(6,7)-(6,18)
(6,7)-(6,21)
(6,19)-(6,21)
(6,26)-(6,37)
(6,26)-(6,40)
(6,38)-(6,40)
(7,9)-(7,11)
(7,9)-(7,76)
(7,14)-(7,25)
(7,14)-(7,76)
(7,27)-(7,32)
(7,27)-(7,70)
(7,33)-(7,34)
(7,37)-(7,70)
(7,74)-(7,76)
(14,3)-(18,33)
(14,12)-(17,72)
(15,5)-(17,72)
(15,11)-(15,45)
(15,13)-(15,45)
(16,5)-(17,72)
(16,16)-(16,18)
(17,5)-(17,72)
(17,16)-(17,18)
(17,16)-(17,21)
(17,19)-(17,21)
(17,25)-(17,72)
(17,39)-(17,53)
(17,39)-(17,65)
(17,54)-(17,55)
(17,56)-(17,60)
(17,61)-(17,65)
(17,69)-(17,72)
(18,15)-(18,18)
(18,15)-(18,33)
(18,20)-(18,27)
(18,20)-(18,33)
(18,28)-(18,30)
(18,31)-(18,33)
*)
