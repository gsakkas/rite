
let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (1, 2) in
    let base = 0 in
    let args = (l1, l1) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec clone_RT acc n =
    if n <= 0 then acc else clone_RT (x :: acc) (n - 1) in
  clone_RT [] n;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  let diff = len1 - len2 in
  if diff < 0
  then ((List.append (clone 0 (- diff)) l1), l2)
  else (l1, (List.append (clone 0 diff) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([0], [0]) in
    let base = ([0], [0]) in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,17)-(20,18)
(20,20)-(20,21)
(21,4)-(22,74)
(21,15)-(21,16)
(22,4)-(22,74)
(22,15)-(22,23)
(22,20)-(22,22)
(22,27)-(22,74)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(20,4)-(22,74)
(20,10)-(20,22)
(20,12)-(20,22)
(20,16)-(20,22)
(21,4)-(22,74)
(21,15)-(21,16)
(22,41)-(22,55)
(22,41)-(22,67)
(22,56)-(22,57)
(22,58)-(22,62)
*)
