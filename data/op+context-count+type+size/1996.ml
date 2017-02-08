
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
      match x with
      | ([],[]) -> a
      | ((h1::t1)::[],(h2::t2)::[]) -> if (h1 + h2) > 9 then x in
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
(16,7)-(18,63)
(16,13)-(16,14)
(17,20)-(17,21)
(18,40)-(18,63)
(18,44)-(18,46)
(18,44)-(18,51)
(18,44)-(18,56)
(18,49)-(18,51)
(18,55)-(18,56)
(19,5)-(20,72)
(19,16)-(19,18)
(20,5)-(20,72)
(20,16)-(20,18)
(20,16)-(20,21)
(20,19)-(20,21)
(20,25)-(20,72)
(20,39)-(20,53)
(20,39)-(20,65)
(20,54)-(20,55)
(20,56)-(20,60)
(20,61)-(20,65)
(20,69)-(20,72)
(21,3)-(21,13)
(21,3)-(21,33)
(21,15)-(21,18)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(5,4)-(8,80)
(5,13)-(8,77)
(5,16)-(8,77)
(6,3)-(8,77)
(7,9)-(7,11)
(7,9)-(7,76)
(8,52)-(8,63)
(8,52)-(8,66)
(8,64)-(8,66)
(14,3)-(21,33)
(14,12)-(20,72)
(15,5)-(20,72)
(15,11)-(18,63)
(16,7)-(18,63)
(16,7)-(18,63)
(16,7)-(18,63)
(16,7)-(18,63)
(16,13)-(16,14)
(17,20)-(17,21)
(18,40)-(18,63)
(18,40)-(18,63)
(18,40)-(18,63)
(18,62)-(18,63)
(19,5)-(20,72)
(19,16)-(19,18)
(20,16)-(20,18)
(20,16)-(20,21)
(20,39)-(20,53)
(20,39)-(20,65)
(20,54)-(20,55)
(20,56)-(20,60)
(21,15)-(21,18)
(21,15)-(21,33)
(21,20)-(21,27)
(21,20)-(21,33)
*)
