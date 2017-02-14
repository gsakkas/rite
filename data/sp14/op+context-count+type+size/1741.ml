
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
(19,16)-(19,54)
(19,22)-(19,23)
(19,40)-(19,47)
(19,40)-(19,54)
(19,41)-(19,42)
(19,45)-(19,46)
(19,52)-(19,54)
(20,4)-(22,53)
(20,20)-(20,22)
(21,4)-(22,53)
(21,15)-(21,44)
(22,4)-(22,53)
(22,20)-(22,34)
(22,20)-(22,46)
(22,35)-(22,36)
(22,37)-(22,41)
(22,42)-(22,46)
(22,50)-(22,53)
(23,2)-(23,12)
(23,2)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(19,4)-(22,53)
(19,10)-(19,54)
(19,12)-(19,54)
(19,16)-(19,54)
(19,40)-(19,54)
(20,4)-(22,53)
(20,15)-(20,23)
(22,20)-(22,34)
(22,20)-(22,46)
(22,35)-(22,36)
(22,37)-(22,41)
*)
