
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> if sum > 9 then [(1, (sum - 1))] else [sum]
      | c::x' ->
          if (sum + c) > 9
          then 1 :: ((sum + c) - 10) :: x'
          else (sum + c) :: x' in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff > 0
  then (l1, ((clone 0 diff) @ l2))
  else if diff < 0 then (((clone 0 (diff * (-1))) @ l1), l2) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::l' -> if h = 0 then removeZero l' else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (n1,n2) = x in
      let sum = n1 + n2 in
      match a with
      | [] -> [sum]
      | c::x' -> if c > 9 then (sum + 1) :: (c - 10) :: x' else sum :: a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,15)-(19,58)
[sum]
ListG (fromList [VarG])

(21,14)-(21,23)
c
VarG

(22,16)-(22,17)
sum + 1
BopG VarG LitG

(22,22)-(22,31)
c
VarG

(23,16)-(23,25)
sum
VarG

(23,29)-(23,31)
a
VarG

(26,5)-(26,52)
let res =
  List.fold_left f base args in
res
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(17,7)-(23,31)
(17,17)-(17,24)
(19,15)-(19,58)
(19,31)-(19,47)
(19,32)-(19,46)
(19,53)-(19,58)
(19,54)-(19,57)
*)
