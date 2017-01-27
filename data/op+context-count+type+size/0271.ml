
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
    let f a x = (0, 0) in
    let base = (0, 0) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
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
(20,18)-(20,19)
(20,21)-(20,22)
(21,17)-(21,18)
(21,20)-(21,21)
(22,17)-(22,23)
(22,21)-(22,23)
*)

(* type error slice
(20,5)-(22,75)
(20,11)-(20,22)
(20,13)-(20,22)
(20,18)-(20,19)
(20,18)-(20,22)
(20,21)-(20,22)
(21,5)-(22,75)
(21,17)-(21,18)
(21,17)-(21,21)
(21,20)-(21,21)
(22,5)-(22,75)
(22,17)-(22,19)
(22,17)-(22,23)
(22,21)-(22,23)
(22,42)-(22,56)
(22,42)-(22,68)
(22,57)-(22,58)
(22,59)-(22,63)
(22,64)-(22,68)
*)
