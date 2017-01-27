
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
      let y = List.hd l2 in
      List.combine
        (List.split (let (one,two) = a in ((x :: one), (y :: two)))) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
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
    let f a x =
      let y = List.hd l2 in let (one,two) = a in ((x :: one), (y :: two)) in
    let base = ([], []) in
    let args = l1 in let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,7)-(21,19)
(21,7)-(22,65)
(22,10)-(22,20)
(22,10)-(22,65)
(23,17)-(23,19)
(23,21)-(23,23)
*)

(* type error slice
(19,5)-(24,71)
(19,11)-(22,65)
(19,13)-(22,65)
(20,7)-(22,65)
(21,7)-(21,19)
(21,7)-(22,65)
(22,10)-(22,20)
(22,10)-(22,65)
(22,22)-(22,65)
(22,38)-(22,39)
(22,45)-(22,53)
(22,45)-(22,65)
(22,57)-(22,65)
(23,5)-(24,71)
(23,17)-(23,19)
(23,17)-(23,23)
(23,21)-(23,23)
(24,5)-(24,71)
(24,16)-(24,18)
(24,38)-(24,52)
(24,38)-(24,64)
(24,53)-(24,54)
(24,55)-(24,59)
(24,60)-(24,64)
*)
