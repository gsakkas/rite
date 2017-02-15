
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
    let f a x = let carry = match a with | (x,y) -> x in carry in
    let base = (0, []) in
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
(16,16)-(16,62)
(16,57)-(16,62)
(17,4)-(19,51)
(17,15)-(17,22)
(17,16)-(17,17)
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
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(16,4)-(19,51)
(16,10)-(16,62)
(16,12)-(16,62)
(16,16)-(16,62)
(16,16)-(16,62)
(16,28)-(16,53)
(16,28)-(16,53)
(16,34)-(16,35)
(16,52)-(16,53)
(16,57)-(16,62)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
*)
