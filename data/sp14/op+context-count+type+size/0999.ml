
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
(16,16)-(16,17)
(17,4)-(19,51)
(17,15)-(17,23)
(17,15)-(17,43)
(17,24)-(17,43)
(18,4)-(19,51)
(18,15)-(18,23)
(18,15)-(18,44)
(18,24)-(18,44)
(18,25)-(18,37)
(18,38)-(18,40)
(18,41)-(18,43)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(4,43)-(4,44)
(4,43)-(4,65)
(4,43)-(4,65)
(4,48)-(4,65)
(4,49)-(4,54)
(4,55)-(4,56)
(6,3)-(9,69)
(6,12)-(9,67)
(6,15)-(9,67)
(7,2)-(9,67)
(8,7)-(8,67)
(8,9)-(8,56)
(8,10)-(8,15)
(8,16)-(8,17)
(8,64)-(8,66)
(9,12)-(9,66)
(9,13)-(9,60)
(9,14)-(9,19)
(9,61)-(9,62)
(9,63)-(9,65)
(12,2)-(12,69)
(12,2)-(12,69)
(12,2)-(12,69)
(12,2)-(12,69)
(12,50)-(12,60)
(12,50)-(12,62)
(12,61)-(12,62)
(15,2)-(20,34)
(15,11)-(19,51)
(16,4)-(19,51)
(16,4)-(19,51)
(16,10)-(16,17)
(16,12)-(16,17)
(16,16)-(16,17)
(17,4)-(19,51)
(18,4)-(19,51)
(18,4)-(19,51)
(18,15)-(18,23)
(18,15)-(18,44)
(18,24)-(18,44)
(18,25)-(18,37)
(18,41)-(18,43)
(19,4)-(19,51)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
*)
