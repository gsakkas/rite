
let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else if i = 1 then l else bigAdd ((bigAdd l l) (mulByDigit (i - 2) l));;


(* fix

let rec padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 = length2
  then (l1, l2)
  else
    if length1 < length2 then padZero (0 :: l1) l2 else padZero l1 (0 :: l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (eFromList1,eFromList2) = x in
      let (cin,result) = a in
      let sum = (eFromList1 + eFromList2) + cin in
      let tens = sum / 10 in
      let ones = sum mod 10 in (tens, (ones :: result)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0
  then []
  else if i = 1 then l else bigAdd (bigAdd l l) (mulByDigit (i - 2) l);;

*)

(* changed spans
(29,29)-(29,71)
(29,38)-(29,71)
*)

(* type error slice
(4,17)-(4,28)
(4,17)-(4,31)
(4,29)-(4,31)
(8,31)-(8,38)
(8,31)-(8,51)
(8,40)-(8,47)
(8,49)-(8,51)
(11,3)-(11,70)
(11,51)-(11,61)
(11,51)-(11,63)
(11,62)-(11,63)
(13,4)-(24,37)
(13,12)-(24,33)
(13,15)-(24,33)
(14,3)-(24,33)
(14,12)-(23,52)
(15,5)-(23,52)
(15,11)-(20,54)
(15,13)-(20,54)
(16,7)-(20,54)
(16,37)-(16,38)
(17,7)-(20,54)
(17,26)-(17,27)
(18,7)-(20,54)
(19,7)-(20,54)
(19,18)-(19,26)
(20,7)-(20,54)
(20,33)-(20,37)
(20,33)-(20,54)
(20,40)-(20,54)
(21,5)-(23,52)
(21,17)-(21,18)
(21,17)-(21,22)
(21,20)-(21,22)
(22,5)-(23,52)
(22,16)-(22,28)
(22,16)-(22,68)
(22,30)-(22,38)
(22,30)-(22,47)
(22,40)-(22,41)
(22,40)-(22,47)
(22,45)-(22,47)
(22,51)-(22,59)
(22,51)-(22,68)
(22,61)-(22,62)
(22,61)-(22,68)
(22,66)-(22,68)
(23,5)-(23,52)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
(23,41)-(23,45)
(23,49)-(23,52)
(24,3)-(24,13)
(24,3)-(24,33)
(24,15)-(24,18)
(24,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
(29,8)-(29,71)
(29,22)-(29,23)
(29,29)-(29,35)
(29,29)-(29,71)
(29,38)-(29,44)
(29,38)-(29,48)
(29,38)-(29,71)
(29,45)-(29,46)
(29,47)-(29,48)
*)
