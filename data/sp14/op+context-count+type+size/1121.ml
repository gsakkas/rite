
let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = x in
    let base = failwith "to be implemented" in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let t x = x + 1;;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

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
(16,17)-(16,18)
(17,5)-(19,52)
(17,16)-(17,24)
(17,16)-(17,44)
(17,25)-(17,44)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,44)
(18,26)-(18,38)
(18,26)-(18,44)
(18,39)-(18,41)
(18,42)-(18,44)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,33)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)

(* type error slice
(4,44)-(4,45)
(4,44)-(4,64)
(4,44)-(4,64)
(4,50)-(4,55)
(4,50)-(4,64)
(4,56)-(4,57)
(6,4)-(9,70)
(6,13)-(9,66)
(6,16)-(9,66)
(7,3)-(9,66)
(8,11)-(8,16)
(8,11)-(8,54)
(8,11)-(8,67)
(8,17)-(8,18)
(8,65)-(8,67)
(9,15)-(9,20)
(9,15)-(9,58)
(9,15)-(9,66)
(9,62)-(9,63)
(9,64)-(9,66)
(12,3)-(12,70)
(12,3)-(12,70)
(12,3)-(12,70)
(12,3)-(12,70)
(12,51)-(12,61)
(12,51)-(12,63)
(12,62)-(12,63)
(15,3)-(20,33)
(15,12)-(19,52)
(16,5)-(19,52)
(16,5)-(19,52)
(16,11)-(16,18)
(16,13)-(16,18)
(16,17)-(16,18)
(17,5)-(19,52)
(18,5)-(19,52)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,44)
(18,26)-(18,38)
(18,26)-(18,44)
(18,42)-(18,44)
(19,5)-(19,52)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,41)-(19,45)
(19,49)-(19,52)
(20,3)-(20,13)
(20,3)-(20,33)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
*)
