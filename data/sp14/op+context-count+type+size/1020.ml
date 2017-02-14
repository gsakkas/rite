
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (m,n) ->
          if (m + n) > 9 then 1 :: ((m + n) - 10) :: a else (m + n) :: a in
    let base = [] in
    let args = match List.rev (List.combine l1 l2) with | h::t -> h in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let shorter = if len1 < len2 then l1 else l2 in
  let zeros = if shorter = l1 then len2 - len1 else len1 - len2 in
  if shorter = l1
  then ((List.append (clone 0 zeros) shorter), l2)
  else (l1, (List.append (clone 0 zeros) shorter));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let prevN (n1,n2) = n1 in
      let prev = prevN a in
      let sumlist (p1,p2) = p2 in
      let sum = sumlist a in
      let add (m,n) = m + n in
      let digit = (add x) + prev in
      if digit > 10 then (1, ((digit - 10) :: sum)) else (0, (digit :: sum)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,6)-(21,72)
(19,12)-(19,13)
(21,10)-(21,72)
(21,13)-(21,20)
(21,13)-(21,24)
(21,23)-(21,24)
(21,30)-(21,31)
(21,30)-(21,54)
(21,36)-(21,43)
(21,37)-(21,38)
(21,41)-(21,42)
(21,53)-(21,54)
(21,60)-(21,67)
(21,60)-(21,72)
(21,61)-(21,62)
(21,65)-(21,66)
(21,71)-(21,72)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,15)-(23,67)
(23,31)-(23,43)
(23,44)-(23,46)
(23,47)-(23,49)
(23,66)-(23,67)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,35)-(24,39)
(24,40)-(24,44)
(24,48)-(24,51)
(25,2)-(25,12)
(25,2)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

(* type error slice
(23,4)-(24,51)
(23,15)-(23,67)
(23,15)-(23,67)
(23,15)-(23,67)
(23,21)-(23,29)
(23,21)-(23,50)
(23,30)-(23,50)
(23,31)-(23,43)
(23,66)-(23,67)
(24,18)-(24,32)
(24,18)-(24,44)
(24,40)-(24,44)
*)
