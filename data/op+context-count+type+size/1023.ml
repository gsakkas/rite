
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
    let f a x = match x with | (m,n) -> (m + n) :: a in
    let base = [] in
    let args = match List.rev ((List.combine l1), l2) with | h::t -> h in
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
(18,17)-(18,53)
(18,23)-(18,24)
(18,42)-(18,47)
(18,42)-(18,53)
(18,52)-(18,53)
(19,5)-(21,52)
(19,16)-(19,18)
(20,5)-(21,52)
(20,16)-(20,71)
(20,22)-(20,30)
(20,22)-(20,53)
(20,33)-(20,45)
(20,33)-(20,48)
(20,33)-(20,53)
(20,46)-(20,48)
(20,51)-(20,53)
(20,70)-(20,71)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
(21,36)-(21,40)
(21,41)-(21,45)
(21,49)-(21,52)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(18,5)-(21,52)
(18,11)-(18,53)
(18,42)-(18,53)
(18,52)-(18,53)
(20,22)-(20,30)
(20,22)-(20,53)
(20,33)-(20,53)
(21,5)-(21,52)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
