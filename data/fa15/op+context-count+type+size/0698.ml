
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
(23,39)-(23,41)
(23,45)-(23,46)
(23,49)-(23,69)
(23,60)-(23,62)
(23,66)-(23,67)
(24,4)-(24,51)
*)

(* type error slice
(5,3)-(10,52)
(5,12)-(10,50)
(5,15)-(10,50)
(6,2)-(10,50)
(7,2)-(10,50)
(8,2)-(10,50)
(9,7)-(9,48)
(9,24)-(9,48)
(9,29)-(9,47)
(9,42)-(9,43)
(18,2)-(25,34)
(18,11)-(24,51)
(19,4)-(24,51)
(19,10)-(21,75)
(19,12)-(21,75)
(21,6)-(21,75)
(21,18)-(21,19)
(21,31)-(21,38)
(21,36)-(21,37)
(23,4)-(24,51)
(23,15)-(23,27)
(23,15)-(23,69)
(23,38)-(23,47)
(23,45)-(23,46)
(23,49)-(23,69)
(23,50)-(23,58)
(23,59)-(23,68)
(23,59)-(23,68)
(23,59)-(23,68)
(23,60)-(23,62)
(23,66)-(23,67)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
(25,13)-(25,34)
(25,14)-(25,17)
(25,18)-(25,33)
(25,19)-(25,26)
*)
