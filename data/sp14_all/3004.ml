
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
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
[0]
ListG (fromList [LitG])

(20,21)-(20,22)
[0]
ListG (fromList [LitG])

(21,17)-(21,18)
[0]
ListG (fromList [LitG])

(21,20)-(21,21)
[0]
ListG (fromList [LitG])

*)

(* type error slice
(16,3)-(16,72)
(16,52)-(16,62)
(16,52)-(16,65)
(16,63)-(16,65)
(19,3)-(23,35)
(19,12)-(22,69)
(20,5)-(22,69)
(20,11)-(20,23)
(20,13)-(20,23)
(20,17)-(20,23)
(20,21)-(20,22)
(21,5)-(22,69)
(22,5)-(22,69)
(22,22)-(22,69)
(22,36)-(22,50)
(22,36)-(22,62)
(22,51)-(22,52)
(22,66)-(22,69)
(23,3)-(23,13)
(23,3)-(23,35)
(23,14)-(23,35)
(23,15)-(23,18)
*)
