
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with
      | (w,y)::t -> ((((w + z) + y) / 10), (((w + y) + z) mod 10))
      | [] -> (0, 0) in
    let base = (0, 0) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,7)-(22,20)
(21,25)-(21,30)
(21,34)-(21,35)
(21,47)-(21,52)
(21,47)-(21,65)
(21,51)-(21,52)
(22,16)-(22,17)
(22,16)-(22,20)
(22,19)-(22,20)
(23,20)-(23,21)
*)

(* type error slice
(18,5)-(25,52)
(18,11)-(22,20)
(18,13)-(22,20)
(19,7)-(22,20)
(19,16)-(19,19)
(19,16)-(19,21)
(19,20)-(19,21)
(20,7)-(22,20)
(20,13)-(20,14)
(21,25)-(21,41)
(21,25)-(21,65)
(21,47)-(21,65)
(23,5)-(25,52)
(23,17)-(23,18)
(23,17)-(23,21)
(23,20)-(23,21)
(24,5)-(25,52)
(24,16)-(24,24)
(24,16)-(24,44)
(24,26)-(24,38)
(24,26)-(24,44)
(24,39)-(24,41)
(24,42)-(24,44)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
*)
