
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
    let base = (0, []) in
    let args = (0, (clone 0 List.length l1)) in
    let (_,res) = List.fold_left f base args in res in
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
    let f a x = (0, []) in
    let base = (0, []) in
    let args = clone 0 (List.length l1) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,18)-(20,21)
0
LitG

(20,23)-(20,26)
[]
ListG []

(22,16)-(22,45)
clone 0 (List.length l1)
AppG [LitG,AppG [EmptyG]]

*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(4,29)-(4,37)
(4,29)-(4,56)
(4,49)-(4,56)
(5,3)-(5,11)
(5,3)-(5,16)
(5,15)-(5,16)
(20,5)-(23,52)
(20,11)-(20,27)
(20,13)-(20,27)
(20,17)-(20,27)
(20,18)-(20,21)
(21,5)-(23,52)
(21,16)-(21,23)
(21,17)-(21,18)
(22,20)-(22,44)
(22,21)-(22,26)
(22,29)-(22,40)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,36)-(23,40)
*)
