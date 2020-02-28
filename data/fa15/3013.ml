
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

*)

(* changed spans
(25,23)-(25,24)
[0]
ListG [LitG]

(25,41)-(25,74)
mulByDigit (i - 1) (bigAdd l
                           l)
AppG [BopG EmptyG EmptyG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(4,4)-(6,79)
(4,13)-(6,77)
(6,18)-(6,42)
(6,37)-(6,38)
(6,39)-(6,41)
(11,4)-(22,37)
(11,12)-(22,35)
(22,19)-(22,34)
(22,20)-(22,27)
(22,28)-(22,30)
(24,4)-(25,76)
(24,20)-(25,74)
(24,22)-(25,74)
(25,3)-(25,74)
(25,23)-(25,24)
(25,32)-(25,33)
(25,41)-(25,55)
(25,41)-(25,74)
(25,42)-(25,52)
(25,58)-(25,74)
(25,59)-(25,60)
(25,61)-(25,73)
(25,62)-(25,68)
(25,69)-(25,70)
*)
