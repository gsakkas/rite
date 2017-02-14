
let rec clone x n =
  match n with | n when n <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x > y
  then let z = x - y in (l1, ((clone 0 z) @ l2))
  else (let z = y - x in (((clone 0 z) @ l1), l2));;

let pairHelper x = let (r,s) = x in r + s;;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = pairHelper x in
    let base = 0 in
    let args = List.combine l1 l2 in
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
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(12,16)-(12,42)
(12,20)-(12,42)
(12,32)-(12,33)
(12,37)-(12,38)
(12,37)-(12,42)
(12,41)-(12,42)
(20,3)-(25,33)
(21,5)-(24,52)
(21,17)-(21,27)
(21,17)-(21,29)
(21,28)-(21,29)
(22,5)-(24,52)
(22,16)-(22,17)
(23,5)-(24,52)
(25,3)-(25,13)
(25,15)-(25,18)
(25,15)-(25,33)
(25,20)-(25,27)
(25,20)-(25,33)
(25,28)-(25,30)
(25,31)-(25,33)
*)

(* type error slice
(12,4)-(12,44)
(12,16)-(12,42)
(12,20)-(12,42)
(12,37)-(12,42)
(21,5)-(24,52)
(21,11)-(21,29)
(21,13)-(21,29)
(21,17)-(21,27)
(21,17)-(21,29)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
*)
