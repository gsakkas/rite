
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
      if (i + j) > 9
      then (1, ((i + j) - 10))
      else if (i + j) <= 9 then (0, (i + j)) in
    let base = (0, 0) in
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
(21,6)-(23,44)
(21,9)-(21,16)
(21,9)-(21,20)
(21,10)-(21,11)
(21,14)-(21,15)
(21,19)-(21,20)
(22,11)-(22,30)
(22,12)-(22,13)
(22,15)-(22,29)
(22,17)-(22,18)
(22,26)-(22,28)
(23,11)-(23,44)
(23,14)-(23,21)
(23,14)-(23,26)
(23,15)-(23,16)
(23,19)-(23,20)
(23,25)-(23,26)
(23,32)-(23,44)
(23,33)-(23,34)
(24,4)-(26,51)
(24,15)-(24,21)
(24,19)-(24,20)
(25,4)-(26,51)
(25,15)-(25,55)
(26,4)-(26,51)
(27,14)-(27,17)
*)

(* type error slice
(15,2)-(15,69)
(15,2)-(15,69)
(15,50)-(15,60)
(15,50)-(15,62)
(15,61)-(15,62)
(18,2)-(27,34)
(18,11)-(26,51)
(19,4)-(26,51)
(19,4)-(26,51)
(19,10)-(23,44)
(19,12)-(23,44)
(20,6)-(23,44)
(21,6)-(23,44)
(22,11)-(22,30)
(22,15)-(22,29)
(23,11)-(23,44)
(23,11)-(23,44)
(23,11)-(23,44)
(23,32)-(23,44)
(24,4)-(26,51)
(25,4)-(26,51)
(26,4)-(26,51)
(26,4)-(26,51)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,48)-(26,51)
(27,2)-(27,12)
(27,2)-(27,34)
(27,13)-(27,34)
(27,14)-(27,17)
*)
