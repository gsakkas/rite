
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
    let args = List.combine l1 l2 in
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
(18,7)-(21,32)
(18,16)-(18,19)
(18,16)-(18,21)
(18,16)-(18,31)
(18,20)-(18,21)
(18,26)-(18,29)
(18,26)-(18,31)
(19,7)-(21,32)
(20,19)-(20,20)
(20,19)-(20,56)
(20,23)-(20,24)
(20,28)-(20,30)
(20,37)-(20,38)
(20,41)-(20,42)
(20,48)-(20,50)
(20,55)-(20,56)
(21,14)-(21,32)
(21,15)-(21,16)
(21,15)-(21,21)
(21,19)-(21,21)
(21,23)-(21,24)
(21,23)-(21,31)
(21,29)-(21,31)
(22,5)-(24,52)
(22,16)-(22,18)
(23,5)-(24,52)
(23,16)-(23,34)
(24,5)-(24,52)
*)

(* type error slice
(17,5)-(24,52)
(17,11)-(21,32)
(19,7)-(21,32)
(19,7)-(21,32)
(19,13)-(19,14)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
*)
