
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
          else ((((fir + sec) / 10) + b1), (((fir + sec) mod 10) :: b2)) in
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
          then (b1, ((fir + sec) :: b2))
          else ((((fir + sec) / 10) + b1), (((fir + sec) mod 10) :: b2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (bar,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,16)-(24,18)
(26,16)-(26,18)
*)

(* type error slice
(19,4)-(28,53)
(19,10)-(25,72)
(19,12)-(25,72)
(20,6)-(25,72)
(20,6)-(25,72)
(20,20)-(20,21)
(21,6)-(25,72)
(23,10)-(25,72)
(23,10)-(25,72)
(24,15)-(24,40)
(24,16)-(24,18)
(25,15)-(25,72)
(25,16)-(25,41)
(25,16)-(25,41)
(25,38)-(25,40)
(28,20)-(28,34)
(28,20)-(28,46)
(28,35)-(28,36)
*)
