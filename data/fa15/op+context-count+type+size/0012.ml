
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> 0 | 1 -> l | x -> (mulByDigit i) - (1 (bigAdd l l));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let d = (List.length l1) - (List.length l2) in
  if d < 0 then (((clone 0 (0 - d)) @ l1), l2) else (l1, ((clone 0 d) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (l,m) = a in
      if ((j + k) + l) > 9
      then (1, ((((j + k) + l) - 10) :: m))
      else (0, (((j + k) + l) :: m)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (c,res) = List.fold_left f base args in c :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [0] | 1 -> l | x -> mulByDigit (i - 1) (bigAdd l l);;

let _ = mulByDigit 9 [9; 9; 9; 9];;

*)

(* changed spans
(25,22)-(25,23)
(25,40)-(25,54)
(25,40)-(25,73)
(25,52)-(25,53)
(25,57)-(25,73)
*)

(* type error slice
(4,3)-(6,78)
(4,12)-(6,76)
(6,17)-(6,41)
(6,36)-(6,37)
(6,38)-(6,40)
(11,3)-(22,36)
(11,11)-(22,34)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(24,3)-(25,75)
(24,19)-(25,73)
(24,21)-(25,73)
(25,2)-(25,73)
(25,2)-(25,73)
(25,22)-(25,23)
(25,31)-(25,32)
(25,40)-(25,54)
(25,40)-(25,73)
(25,41)-(25,51)
(25,57)-(25,73)
(25,58)-(25,59)
(25,60)-(25,72)
(25,61)-(25,67)
(25,68)-(25,69)
*)
