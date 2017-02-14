
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
  | _ -> bigAdd ((bigAdd 1 1) (mulByDigit (i - 2) l));;


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
(27,3)-(30,52)
(27,9)-(27,10)
(28,10)-(28,12)
(29,10)-(29,11)
(30,10)-(30,52)
(30,19)-(30,52)
(30,26)-(30,27)
(30,28)-(30,29)
(30,32)-(30,52)
(30,44)-(30,45)
(30,48)-(30,49)
*)

(* type error slice
(8,31)-(8,38)
(8,31)-(8,51)
(8,40)-(8,47)
(13,4)-(24,37)
(13,12)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(27,3)-(30,52)
(27,3)-(30,52)
(28,10)-(28,12)
(30,10)-(30,16)
(30,10)-(30,52)
(30,19)-(30,25)
(30,19)-(30,29)
(30,26)-(30,27)
*)
