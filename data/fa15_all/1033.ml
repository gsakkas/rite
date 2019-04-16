
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (l1 :: 0)) (List.rev (l2 :: 0)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (y,z) = a in
      let (r,s) = x in let m = (r + s) + y in ((m / 10), ((m mod 10) :: z)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,40)-(23,42)
0
LitG

(23,46)-(23,47)
l1
VarG

(23,61)-(23,63)
0
LitG

(23,67)-(23,68)
l2
VarG

*)

(* type error slice
(5,4)-(10,53)
(5,13)-(10,51)
(5,16)-(10,51)
(6,3)-(10,51)
(7,3)-(10,51)
(8,3)-(10,51)
(10,8)-(10,51)
(10,26)-(10,50)
(10,27)-(10,45)
(10,40)-(10,41)
(18,3)-(25,35)
(18,12)-(24,52)
(19,5)-(24,52)
(19,11)-(21,76)
(19,13)-(21,76)
(21,7)-(21,76)
(21,19)-(21,20)
(21,32)-(21,39)
(21,33)-(21,34)
(23,5)-(24,52)
(23,16)-(23,28)
(23,16)-(23,70)
(23,29)-(23,49)
(23,30)-(23,38)
(23,39)-(23,48)
(23,40)-(23,42)
(23,46)-(23,47)
(23,60)-(23,69)
(23,67)-(23,68)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,41)-(24,45)
(25,14)-(25,35)
(25,15)-(25,18)
(25,19)-(25,34)
(25,20)-(25,27)
*)
