
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
    let args = (List.combine (List.rev l1)) :: (0 (List.rev l2)) :: 0 in
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
(23,15)-(23,43)
(23,15)-(23,69)
(23,39)-(23,41)
(23,47)-(23,64)
(23,50)-(23,63)
(23,60)-(23,62)
(24,4)-(24,51)
*)

(* type error slice
(19,4)-(24,51)
(19,10)-(21,75)
(19,12)-(21,75)
(21,6)-(21,75)
(21,18)-(21,19)
(23,4)-(24,51)
(23,15)-(23,43)
(23,15)-(23,69)
(23,15)-(23,69)
(23,16)-(23,28)
(23,47)-(23,64)
(23,47)-(23,69)
(23,48)-(23,49)
(23,68)-(23,69)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,40)-(24,44)
*)
