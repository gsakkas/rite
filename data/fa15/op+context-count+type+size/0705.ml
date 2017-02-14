
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
    let args = List.combine (List.rev [l1; 0]) (List.rev [l2; 0]) in
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
(23,39)-(23,46)
(23,40)-(23,42)
(23,49)-(23,65)
(23,58)-(23,65)
(23,59)-(23,61)
(24,5)-(24,52)
*)

(* type error slice
(5,4)-(10,53)
(5,13)-(10,49)
(5,16)-(10,49)
(6,3)-(10,49)
(7,3)-(10,49)
(8,3)-(10,49)
(9,8)-(9,47)
(9,26)-(9,47)
(9,32)-(9,47)
(9,43)-(9,44)
(18,3)-(25,33)
(18,12)-(24,52)
(23,58)-(23,65)
(23,58)-(23,65)
(23,59)-(23,61)
(23,63)-(23,64)
(25,15)-(25,18)
(25,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
*)
