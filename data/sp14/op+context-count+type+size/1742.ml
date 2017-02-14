
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if (fir + sec) < 10
          then ([], ((fir + sec) :: b2))
          else (((fir + sec) / 10), (((fir + sec) mod 10) :: b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let getTail l = match l with | [] -> [] | h::t -> t in
      let getCarry (c,l) = c in
      let carry = getCarry a in
      let getSum (c,l) = l in
      let sum = if carry = 1 then getTail (getSum a) else getSum a in
      let add (m,n) = m + n in
      let digit = (add x) + carry in
      if digit > 9
      then (1, (1 :: (digit - 10) :: sum))
      else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(25,65)
(20,20)-(20,21)
(21,6)-(25,65)
(21,12)-(21,13)
(23,10)-(25,65)
(23,13)-(23,24)
(23,13)-(23,29)
(23,14)-(23,17)
(23,20)-(23,23)
(23,27)-(23,29)
(24,15)-(24,40)
(24,16)-(24,18)
(24,20)-(24,39)
(24,21)-(24,32)
(24,22)-(24,25)
(24,28)-(24,31)
(24,36)-(24,38)
(25,15)-(25,65)
(25,16)-(25,34)
(25,17)-(25,28)
(25,18)-(25,21)
(25,24)-(25,27)
(25,31)-(25,33)
(25,37)-(25,57)
(25,38)-(25,49)
(25,39)-(25,42)
(25,45)-(25,48)
(25,54)-(25,56)
(25,61)-(25,63)
(26,4)-(28,53)
(26,19)-(26,21)
(27,4)-(28,53)
(27,15)-(27,23)
(27,15)-(27,44)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
(28,4)-(28,53)
(28,20)-(28,34)
(28,20)-(28,46)
(28,35)-(28,36)
(28,37)-(28,41)
(28,42)-(28,46)
(28,50)-(28,53)
(29,2)-(29,12)
(29,2)-(29,34)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)

(* type error slice
(19,4)-(28,53)
(19,10)-(25,65)
(19,12)-(25,65)
(20,6)-(25,65)
(21,6)-(25,65)
(23,10)-(25,65)
(23,10)-(25,65)
(24,15)-(24,40)
(24,16)-(24,18)
(25,15)-(25,65)
(25,16)-(25,34)
(26,4)-(28,53)
(26,15)-(26,22)
(26,16)-(26,17)
(28,20)-(28,34)
(28,20)-(28,46)
(28,35)-(28,36)
(28,37)-(28,41)
*)
