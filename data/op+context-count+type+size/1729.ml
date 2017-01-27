
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
          else (((fir + sec) / 10), (((fir + sec) mod 10) :: b2)) in
    let base = (0, []) in
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
          then (b1, ((fir + sec) :: b2))
          else ((((fir + sec) / 10) + b1), (((fir + sec) mod 10) :: b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,17)-(24,19)
(25,19)-(25,34)
(25,40)-(25,64)
*)

(* type error slice
(19,5)-(28,54)
(19,11)-(25,64)
(19,13)-(25,64)
(20,7)-(25,64)
(20,21)-(20,22)
(21,7)-(25,64)
(21,13)-(21,14)
(23,11)-(25,64)
(23,15)-(23,18)
(23,15)-(23,24)
(23,21)-(23,24)
(24,17)-(24,19)
(24,17)-(24,39)
(24,23)-(24,39)
(25,19)-(25,34)
(25,19)-(25,64)
(25,40)-(25,64)
(26,5)-(28,54)
(26,17)-(26,18)
(26,17)-(26,22)
(26,20)-(26,22)
(27,5)-(28,54)
(27,16)-(27,24)
(27,16)-(27,44)
(27,26)-(27,38)
(27,26)-(27,44)
(27,39)-(27,41)
(27,42)-(27,44)
(28,21)-(28,35)
(28,21)-(28,47)
(28,36)-(28,37)
(28,38)-(28,42)
(28,43)-(28,47)
*)
