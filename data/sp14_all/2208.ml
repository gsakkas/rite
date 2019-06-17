
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
(29,29)-(29,73)
bigAdd (bigAdd l l)
       (mulByDigit (i - 2) l)
AppG [AppG [EmptyG,EmptyG],AppG [EmptyG,EmptyG]]

*)

(* type error slice
(11,3)-(11,70)
(11,9)-(11,10)
(11,37)-(11,70)
(11,51)-(11,61)
(11,51)-(11,63)
(11,69)-(11,70)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(14,3)-(24,35)
(24,3)-(24,13)
(24,3)-(24,35)
(29,8)-(29,73)
(29,22)-(29,23)
(29,29)-(29,35)
(29,29)-(29,73)
(29,36)-(29,73)
(29,37)-(29,49)
(29,38)-(29,44)
(29,45)-(29,46)
*)
