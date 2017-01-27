
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
    let f a x = match x with | (a,b) -> (a + b) mod 10 in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
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
    let f a x =
      let (b1,b2) = a in
      match x with
      | (fir,sec) ->
          if (fir + sec) < 10
          then ([], ((fir + sec) :: b2))
          else ([], ((fir + sec) :: b2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(19,17)-(19,55)
(19,23)-(19,24)
(19,42)-(19,43)
(19,42)-(19,47)
(19,42)-(19,55)
(19,46)-(19,47)
(19,53)-(19,55)
(20,5)-(22,54)
(20,21)-(20,23)
(21,5)-(22,54)
(21,16)-(21,44)
(22,21)-(22,35)
(22,21)-(22,47)
(22,36)-(22,37)
(22,38)-(22,42)
(22,43)-(22,47)
(22,51)-(22,54)
(23,3)-(23,13)
(23,15)-(23,18)
(23,15)-(23,33)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(19,5)-(22,54)
(19,11)-(19,55)
(19,13)-(19,55)
(19,17)-(19,55)
(19,23)-(19,24)
(19,42)-(19,43)
(19,42)-(19,47)
(19,42)-(19,55)
(19,46)-(19,47)
(20,5)-(22,54)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(21,5)-(22,54)
(21,16)-(21,24)
(21,16)-(21,44)
(21,26)-(21,38)
(21,26)-(21,44)
(21,39)-(21,41)
(21,42)-(21,44)
(22,21)-(22,35)
(22,21)-(22,47)
(22,36)-(22,37)
(22,38)-(22,42)
(22,43)-(22,47)
*)
