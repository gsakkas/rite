
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
          if ((fir + sec) + b1) < 10
          then
            (if (List.length b2) >= ((List.length l1) - 1)
             then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
             else (0, (((fir + sec) + b1) :: b2)))
          else
            if (List.length b2) >= ((List.length l1) - 1)
            then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
            else
              ((((fir + sec) + b1) / 10), ((((fir + sec) + b1) mod 10) ::
                b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper a b acc =
    if a > 0 then helper (a - 1) b (bigAdd b b) else acc in
  helper i l 0;;


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
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if ((fir + sec) + b1) < 10
          then
            (if (List.length b2) >= ((List.length l1) - 1)
             then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
             else (0, (((fir + sec) + b1) :: b2)))
          else
            if (List.length b2) >= ((List.length l1) - 1)
            then (0, (b1 :: (((fir + sec) + b1) mod 10) :: b2))
            else
              ((((fir + sec) + b1) / 10), ((((fir + sec) + b1) mod 10) ::
                b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper a b acc =
    if a > 0 then helper (a - 1) b (bigAdd b b) else acc in
  helper i l [];;

*)

(* changed spans
(42,14)-(42,15)
*)

(* type error slice
(2,4)-(4,18)
(2,15)-(4,16)
(2,17)-(4,16)
(3,3)-(4,16)
(3,42)-(3,48)
(3,42)-(3,68)
(3,49)-(3,50)
(3,52)-(3,57)
(3,60)-(3,68)
(4,3)-(4,9)
(4,3)-(4,16)
(4,10)-(4,11)
(4,12)-(4,13)
(4,14)-(4,16)
(6,4)-(12,39)
(6,13)-(12,35)
(6,16)-(12,35)
(7,3)-(12,35)
(7,16)-(7,27)
(7,16)-(7,30)
(7,28)-(7,30)
(8,3)-(12,35)
(8,16)-(8,27)
(8,16)-(8,30)
(8,28)-(8,30)
(9,3)-(12,35)
(10,3)-(12,35)
(11,11)-(11,16)
(11,11)-(11,32)
(11,11)-(11,40)
(11,11)-(11,45)
(11,17)-(11,18)
(11,20)-(11,32)
(11,36)-(11,37)
(11,38)-(11,40)
(11,43)-(11,45)
(15,3)-(15,75)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(17,4)-(37,37)
(17,12)-(37,33)
(17,15)-(37,33)
(18,3)-(37,33)
(18,12)-(36,54)
(19,5)-(36,54)
(19,11)-(33,19)
(19,13)-(33,19)
(20,7)-(33,19)
(20,21)-(20,22)
(21,7)-(33,19)
(21,13)-(21,14)
(23,11)-(33,19)
(23,16)-(23,19)
(23,16)-(23,25)
(23,22)-(23,25)
(25,14)-(27,48)
(25,39)-(25,50)
(25,39)-(25,53)
(25,51)-(25,53)
(26,20)-(26,21)
(26,20)-(26,63)
(26,24)-(26,63)
(34,5)-(36,54)
(34,17)-(34,18)
(34,17)-(34,22)
(34,20)-(34,22)
(35,5)-(36,54)
(35,16)-(35,24)
(35,16)-(35,44)
(35,26)-(35,38)
(35,26)-(35,44)
(35,39)-(35,41)
(35,42)-(35,44)
(36,5)-(36,54)
(36,21)-(36,35)
(36,21)-(36,47)
(36,36)-(36,37)
(36,38)-(36,42)
(36,43)-(36,47)
(36,51)-(36,54)
(37,3)-(37,13)
(37,3)-(37,33)
(37,15)-(37,18)
(37,15)-(37,33)
(37,20)-(37,27)
(37,20)-(37,33)
(37,28)-(37,30)
(37,31)-(37,33)
(41,19)-(41,25)
(41,19)-(41,47)
(41,27)-(41,32)
(41,34)-(41,35)
(41,37)-(41,43)
(41,37)-(41,47)
(41,44)-(41,45)
(41,46)-(41,47)
(42,3)-(42,9)
(42,3)-(42,15)
(42,10)-(42,11)
(42,12)-(42,13)
(42,14)-(42,15)
*)
