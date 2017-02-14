
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
      match (a, x) with | (h::t,(x1,x2)::t2) -> if ((x1 + x2) + h) > 9 then 9 in
    let base = [0] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
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
(16,6)-(16,77)
(16,12)-(16,18)
(16,13)-(16,14)
(16,48)-(16,77)
(16,51)-(16,66)
(16,51)-(16,70)
(16,53)-(16,55)
(16,58)-(16,60)
(16,64)-(16,65)
(16,69)-(16,70)
(16,76)-(16,77)
(17,4)-(19,51)
(17,15)-(17,18)
(17,16)-(17,17)
(18,4)-(19,51)
(18,15)-(18,44)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(15,4)-(19,51)
(15,10)-(16,77)
(15,12)-(16,77)
(16,6)-(16,77)
(16,6)-(16,77)
(16,6)-(16,77)
(16,12)-(16,18)
(16,13)-(16,14)
(16,48)-(16,77)
(16,48)-(16,77)
(16,48)-(16,77)
(16,76)-(16,77)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)
