
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
    then ((place + 1), (res + (mulByDigit l2 a)))
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
(32,24)-(32,49)
mulByDigit x res
AppG [VarG,VarG]

*)

(* type error slice
(4,4)-(9,78)
(4,13)-(9,76)
(9,23)-(9,57)
(9,24)-(9,35)
(9,54)-(9,56)
(14,4)-(23,37)
(14,12)-(23,35)
(23,19)-(23,34)
(23,20)-(23,27)
(23,28)-(23,30)
(26,26)-(26,32)
(26,26)-(26,57)
(26,33)-(26,34)
(26,35)-(26,57)
(26,36)-(26,46)
(26,55)-(26,56)
(29,3)-(35,76)
(29,9)-(33,60)
(30,5)-(33,60)
(30,23)-(30,24)
(32,24)-(32,49)
(32,25)-(32,28)
(32,31)-(32,48)
(32,32)-(32,42)
(32,46)-(32,47)
(33,24)-(33,59)
(33,25)-(33,35)
(33,55)-(33,58)
(34,3)-(35,76)
(34,14)-(34,21)
(34,18)-(34,20)
(35,43)-(35,57)
(35,43)-(35,69)
(35,58)-(35,59)
(35,60)-(35,64)
*)
