
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((o,sum),[]) -> (0, sum)
      | ((o,sum),(b,c)::l') ->
          let d = (b + c) + o in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

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
(15,7)-(19,67)
(15,14)-(15,15)
(15,14)-(15,18)
(16,26)-(16,27)
(16,26)-(16,32)
(16,29)-(16,32)
(18,11)-(19,67)
(18,20)-(18,21)
(18,20)-(18,30)
(18,24)-(18,25)
(18,29)-(18,30)
(19,11)-(19,67)
(19,14)-(19,15)
(19,14)-(19,20)
(19,18)-(19,20)
(19,27)-(19,28)
(19,27)-(19,39)
(19,31)-(19,32)
(19,31)-(19,39)
(19,36)-(19,39)
(19,48)-(19,49)
(19,48)-(19,67)
(19,53)-(19,54)
(19,53)-(19,59)
(19,57)-(19,59)
(19,64)-(19,67)
(20,5)-(22,52)
*)

(* type error slice
(14,5)-(22,52)
(14,11)-(19,67)
(14,13)-(19,67)
(15,7)-(19,67)
(15,14)-(15,15)
(15,14)-(15,18)
(15,17)-(15,18)
(16,26)-(16,27)
(16,26)-(16,32)
(16,29)-(16,32)
(20,5)-(22,52)
(20,17)-(20,18)
(20,17)-(20,22)
(20,20)-(20,22)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,44)
(21,26)-(21,38)
(21,26)-(21,44)
(21,39)-(21,41)
(21,42)-(21,44)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
*)
