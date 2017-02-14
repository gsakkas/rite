
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
(15,16)-(15,24)
(15,16)-(15,44)
(15,25)-(15,44)
(16,4)-(17,71)
(16,15)-(16,17)
(17,4)-(17,71)
(17,15)-(17,17)
(17,15)-(17,20)
(17,18)-(17,20)
(17,24)-(17,71)
(17,38)-(17,52)
(17,38)-(17,64)
(17,53)-(17,54)
(17,55)-(17,59)
(17,60)-(17,64)
(17,68)-(17,71)
(18,2)-(18,12)
(18,2)-(18,34)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
(18,27)-(18,29)
(18,30)-(18,32)
*)

(* type error slice
(5,3)-(8,79)
(5,12)-(8,77)
(5,15)-(8,77)
(6,2)-(8,77)
(7,7)-(7,77)
(7,8)-(7,10)
(8,50)-(8,66)
(8,51)-(8,62)
(8,63)-(8,65)
(14,2)-(18,34)
(14,11)-(17,71)
(16,4)-(17,71)
(16,15)-(16,17)
(17,15)-(17,17)
(17,15)-(17,20)
(17,24)-(17,71)
(17,38)-(17,52)
(17,38)-(17,64)
(17,55)-(17,59)
(18,13)-(18,34)
(18,14)-(18,17)
(18,18)-(18,33)
(18,19)-(18,26)
*)
