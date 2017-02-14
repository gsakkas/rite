
let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a,b) = List.hd x in (((List.hd a) + 1), ((List.hd b) + 2)) in
    let base = ([], []) in
    let args = [(l1, l2)] in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a b acc = if b > 0 then helper a (b - 1) (a :: acc) else acc in
  helper x n [];;

let padZero l1 l2 =
  let l1_len = List.length l1 in
  let l2_len = List.length l2 in
  let l_diff = l1_len - l2_len in
  if l_diff < 0
  then (((clone 0 (l_diff * (-1))) @ l1), l2)
  else (l1, ((clone 0 l_diff) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = ([x + 1], [x + 2]) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(20,69)
(20,18)-(20,25)
(20,18)-(20,27)
(20,26)-(20,27)
(20,32)-(20,49)
(20,33)-(20,44)
(20,34)-(20,41)
(20,42)-(20,43)
(20,51)-(20,68)
(20,52)-(20,63)
(20,53)-(20,60)
(20,61)-(20,62)
(21,4)-(23,53)
(22,4)-(23,53)
(22,15)-(22,25)
(22,16)-(22,24)
(22,21)-(22,23)
(23,4)-(23,53)
*)

(* type error slice
(19,4)-(23,53)
(19,10)-(20,69)
(19,12)-(20,69)
(20,6)-(20,69)
(20,31)-(20,69)
(20,51)-(20,68)
(21,4)-(23,53)
(21,15)-(21,23)
(21,20)-(21,22)
(23,20)-(23,34)
(23,20)-(23,46)
(23,35)-(23,36)
(23,37)-(23,41)
*)
