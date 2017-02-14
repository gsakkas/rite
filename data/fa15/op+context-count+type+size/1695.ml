
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
  if i <= 0 then [0] else bigAdd l ((mulByDigit i) - (1 l));;


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
  if i <= 0 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(26,17)-(26,20)
(26,18)-(26,19)
(26,35)-(26,59)
(26,36)-(26,50)
(26,48)-(26,49)
(26,53)-(26,58)
*)

(* type error slice
(4,3)-(9,77)
(4,12)-(9,75)
(4,15)-(9,75)
(8,12)-(8,46)
(8,13)-(8,24)
(8,43)-(8,45)
(14,3)-(23,36)
(14,11)-(23,34)
(14,14)-(23,34)
(23,18)-(23,33)
(23,19)-(23,26)
(23,30)-(23,32)
(25,3)-(26,61)
(25,19)-(26,59)
(25,21)-(26,59)
(26,26)-(26,32)
(26,26)-(26,59)
(26,35)-(26,59)
(26,35)-(26,59)
(26,36)-(26,50)
(26,37)-(26,47)
(26,53)-(26,58)
(26,54)-(26,55)
*)
