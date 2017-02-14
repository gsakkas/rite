
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let c = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + c) / 10) :: ((h + c) mod 10) :: t
      | _ -> [c / 10; c mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(21,31)
(18,14)-(18,21)
(18,14)-(18,31)
(18,15)-(18,18)
(18,19)-(18,20)
(18,24)-(18,31)
(18,25)-(18,28)
(19,6)-(21,31)
(20,16)-(20,55)
(20,18)-(20,19)
(20,22)-(20,23)
(20,27)-(20,29)
(20,36)-(20,37)
(20,40)-(20,41)
(20,47)-(20,49)
(20,54)-(20,55)
(21,13)-(21,31)
(21,14)-(21,15)
(21,14)-(21,20)
(21,18)-(21,20)
(21,22)-(21,23)
(21,22)-(21,30)
(21,28)-(21,30)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(24,4)-(24,51)
*)

(* type error slice
(17,4)-(24,51)
(17,10)-(21,31)
(19,6)-(21,31)
(19,6)-(21,31)
(19,12)-(19,13)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)
