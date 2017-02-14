
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
    let f a x = a + x in
    let base = 0 in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(19,17)-(19,22)
(19,21)-(19,22)
(20,5)-(21,69)
(20,16)-(20,17)
(21,5)-(21,69)
(21,16)-(21,18)
(21,22)-(21,69)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
(21,53)-(21,57)
(21,58)-(21,62)
(21,66)-(21,69)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(19,5)-(21,69)
(19,11)-(19,22)
(19,17)-(19,18)
(19,17)-(19,22)
(21,22)-(21,69)
(21,36)-(21,50)
(21,36)-(21,62)
(21,51)-(21,52)
*)
