
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          if (i + j) > 9 then a :: (1, ((i + j) - 10)) else a :: (0, (i + j))
      | _ -> a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(23,15)
(22,11)-(22,76)
(22,15)-(22,16)
(22,15)-(22,20)
(22,15)-(22,25)
(22,19)-(22,20)
(22,24)-(22,25)
(22,31)-(22,53)
(22,37)-(22,38)
(22,42)-(22,43)
(22,42)-(22,53)
(22,51)-(22,53)
(22,61)-(22,62)
(22,67)-(22,68)
(22,67)-(22,76)
(22,71)-(22,72)
(23,14)-(23,15)
(24,5)-(26,52)
(24,16)-(24,18)
*)

(* type error slice
(19,5)-(26,52)
(19,11)-(23,15)
(19,13)-(23,15)
(20,7)-(23,15)
(20,13)-(20,14)
(22,11)-(22,76)
(22,15)-(22,16)
(22,15)-(22,20)
(22,19)-(22,20)
(22,31)-(22,32)
(22,31)-(22,53)
(22,37)-(22,38)
(22,37)-(22,53)
(22,42)-(22,53)
(22,61)-(22,62)
(22,61)-(22,76)
(22,67)-(22,68)
(22,67)-(22,76)
(22,71)-(22,76)
(23,14)-(23,15)
(24,5)-(26,52)
(24,16)-(24,18)
(25,5)-(26,52)
(25,16)-(25,28)
(25,16)-(25,55)
(25,30)-(25,38)
(25,30)-(25,41)
(25,39)-(25,41)
(25,44)-(25,52)
(25,44)-(25,55)
(25,53)-(25,55)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
(26,41)-(26,45)
*)
