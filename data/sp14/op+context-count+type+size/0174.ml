
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
  match i with
  | 0 -> []
  | 1 -> l
  | _ -> bigAdd ((bigAdd l l) (mulByDigit (i - 2) l));;


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
(27,2)-(30,53)
(27,8)-(27,9)
(28,9)-(28,11)
(29,9)-(29,10)
(30,9)-(30,53)
(30,16)-(30,53)
(30,43)-(30,44)
(30,47)-(30,48)
*)

(* type error slice
(11,2)-(11,69)
(11,2)-(11,69)
(11,8)-(11,9)
(11,36)-(11,69)
(11,36)-(11,69)
(11,50)-(11,60)
(11,50)-(11,62)
(11,68)-(11,69)
(13,3)-(24,36)
(13,11)-(24,34)
(13,14)-(24,34)
(14,2)-(24,34)
(24,2)-(24,12)
(24,2)-(24,34)
(27,2)-(30,53)
(27,2)-(30,53)
(29,9)-(29,10)
(30,9)-(30,15)
(30,9)-(30,53)
(30,16)-(30,53)
(30,17)-(30,29)
(30,18)-(30,24)
(30,25)-(30,26)
*)
