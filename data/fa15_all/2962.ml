
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
(26,18)-(26,21)
l
VarG

(26,36)-(26,60)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(4,4)-(9,78)
(4,13)-(9,76)
(4,16)-(9,76)
(8,13)-(8,47)
(8,14)-(8,25)
(8,44)-(8,46)
(14,4)-(23,37)
(14,12)-(23,35)
(14,15)-(23,35)
(23,19)-(23,34)
(23,20)-(23,27)
(23,31)-(23,33)
(25,4)-(26,62)
(25,20)-(26,60)
(25,22)-(26,60)
(26,27)-(26,33)
(26,27)-(26,60)
(26,36)-(26,60)
(26,37)-(26,51)
(26,38)-(26,48)
(26,54)-(26,59)
(26,55)-(26,56)
*)
