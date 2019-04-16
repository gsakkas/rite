
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
  let f a x = mulByDigit x a in
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
  let f a x = mulByDigit x a in
  let base = [] in
  let args = List.rev l1 in
  let (_,res) = (0, (List.fold_left f base args)) in res;;

*)

(* changed spans
(30,14)-(30,21)
[]
ListG (fromList [])

(31,43)-(31,69)
(0 , List.fold_left f base
                    args)
TupleG (fromList [AppG (fromList [EmptyG]),LitG])

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
(29,3)-(31,76)
(29,9)-(29,29)
(29,15)-(29,25)
(29,15)-(29,29)
(29,28)-(29,29)
(30,3)-(31,76)
(30,14)-(30,21)
(31,43)-(31,57)
(31,43)-(31,69)
(31,58)-(31,59)
(31,60)-(31,64)
*)
