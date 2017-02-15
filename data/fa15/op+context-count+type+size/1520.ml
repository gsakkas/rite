
let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (place,res) = a in
    if place <= 0
    then ((place + 1), (res + (mulByDigit x l2)))
    else ((place + 1), (mulByDigit ((x * 10) * place) res)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else List.append [x] (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then (l1, (List.append (clone 0 (x - y)) l2))
  else if x < y then ((List.append (clone 0 (y - x)) l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (lh1,lh2) = x in
      let (carry,res) = a in
      let num = (lh1 + lh2) + carry in ((num / 10), ((num mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i <= 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (place,res) = a in
    if place <= 0
    then ((place + 1), (mulByDigit x res))
    else ((place + 1), (mulByDigit ((x * 10) * place) res)) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(32,23)-(32,48)
(32,24)-(32,27)
(32,44)-(32,46)
*)

(* type error slice
(4,3)-(9,77)
(4,12)-(9,75)
(4,15)-(9,75)
(8,12)-(8,46)
(8,13)-(8,24)
(8,43)-(8,45)
(9,22)-(9,56)
(9,23)-(9,34)
(9,53)-(9,55)
(14,3)-(23,36)
(14,11)-(23,34)
(14,14)-(23,34)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
(26,25)-(26,31)
(26,25)-(26,56)
(26,32)-(26,33)
(26,34)-(26,56)
(26,35)-(26,45)
(26,54)-(26,55)
(29,2)-(35,75)
(29,8)-(33,59)
(30,4)-(33,59)
(30,22)-(30,23)
(32,23)-(32,48)
(32,23)-(32,48)
(32,24)-(32,27)
(32,30)-(32,47)
(32,31)-(32,41)
(33,23)-(33,58)
(33,24)-(33,34)
(33,54)-(33,57)
(34,2)-(35,75)
(34,13)-(34,20)
(34,17)-(34,19)
(35,42)-(35,56)
(35,42)-(35,68)
(35,57)-(35,58)
(35,59)-(35,63)
*)
