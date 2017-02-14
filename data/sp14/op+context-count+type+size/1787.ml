
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
(15,6)-(19,68)
(15,12)-(15,18)
(15,13)-(15,14)
(16,24)-(16,32)
(16,25)-(16,26)
(16,28)-(16,31)
(18,10)-(19,68)
(18,18)-(18,29)
(18,19)-(18,20)
(18,23)-(18,24)
(18,28)-(18,29)
(19,10)-(19,68)
(19,13)-(19,14)
(19,13)-(19,19)
(19,17)-(19,19)
(19,25)-(19,40)
(19,26)-(19,27)
(19,29)-(19,39)
(19,30)-(19,31)
(19,35)-(19,38)
(19,46)-(19,68)
(19,47)-(19,48)
(19,51)-(19,59)
(19,52)-(19,53)
(19,56)-(19,58)
(19,63)-(19,66)
(20,4)-(22,51)
(20,15)-(20,22)
(21,4)-(22,51)
(22,4)-(22,51)
*)

(* type error slice
(14,4)-(22,51)
(14,10)-(19,68)
(14,12)-(19,68)
(15,6)-(19,68)
(15,6)-(19,68)
(15,12)-(15,18)
(15,16)-(15,17)
(21,4)-(22,51)
(21,15)-(21,23)
(21,15)-(21,44)
(21,24)-(21,44)
(21,25)-(21,37)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,40)-(22,44)
*)
