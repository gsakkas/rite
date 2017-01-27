
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
    let args = List.combine (List.rev (padZero l1)) (List.rev (padZero l2)) in
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
(23,40)-(23,47)
(23,40)-(23,50)
(23,64)-(23,71)
(23,64)-(23,74)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(12,20)
(4,13)-(12,17)
(4,16)-(12,17)
(5,3)-(12,17)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(12,17)
(6,13)-(6,24)
(6,13)-(6,27)
(6,25)-(6,27)
(7,3)-(12,17)
(8,10)-(8,21)
(8,10)-(8,48)
(8,10)-(8,53)
(8,23)-(8,28)
(8,23)-(8,43)
(8,29)-(8,30)
(8,32)-(8,43)
(8,46)-(8,48)
(8,51)-(8,53)
(23,30)-(23,38)
(23,30)-(23,50)
(23,40)-(23,47)
(23,40)-(23,50)
(23,48)-(23,50)
(23,54)-(23,62)
(23,54)-(23,74)
(23,64)-(23,71)
(23,64)-(23,74)
(23,72)-(23,74)
*)
