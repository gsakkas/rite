
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      match a2 with
      | [] -> (0, ((sum / 10) :: (sum mod 10) :: a2))
      | h::t -> (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x = y
  then (l1, l2)
  else
    if x < y
    then (((clone 0 (y - x)) @ l1), l2)
    else (l1, ((clone 0 (x - y)) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (l1x,l2x) = x in
      let (a1,a2) = a in
      let test = match a1 with | [] -> 0 | h::t -> h in
      let sum = (l1x + l2x) + test in
      match a2 with
      | [] -> ((0 :: a1), ((sum / 10) :: (sum mod 10) :: a2))
      | h::t -> (((sum / 10) :: a1), ((sum mod 10) :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,15)-(25,16)
(25,18)-(25,52)
*)

(* type error slice
(19,4)-(29,51)
(19,10)-(26,58)
(19,12)-(26,58)
(20,6)-(26,58)
(21,6)-(26,58)
(21,6)-(26,58)
(21,20)-(21,21)
(22,6)-(26,58)
(22,17)-(22,52)
(22,17)-(22,52)
(22,23)-(22,25)
(23,6)-(26,58)
(24,6)-(26,58)
(24,6)-(26,58)
(25,14)-(25,53)
(25,15)-(25,16)
(26,16)-(26,58)
(26,17)-(26,35)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
*)
