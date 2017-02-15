
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
      match a with
      | (x,y)::t -> ((x + y) / 10) :: ((x + y) mod 10) :: t
      | _ -> a in
    let base = [] in
    let args = List.rev ((List.combine l1 l2) @ (0, 0)) in
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
(19,6)-(21,14)
(19,12)-(19,13)
(20,20)-(20,59)
(20,22)-(20,23)
(20,26)-(20,27)
(20,31)-(20,33)
(20,40)-(20,41)
(20,44)-(20,45)
(20,51)-(20,53)
(20,58)-(20,59)
(21,13)-(21,14)
(22,4)-(24,51)
(22,15)-(22,17)
(23,4)-(24,51)
(23,25)-(23,45)
(23,46)-(23,47)
(23,48)-(23,54)
(23,49)-(23,50)
(23,52)-(23,53)
(24,4)-(24,51)
(25,19)-(25,26)
(25,27)-(25,29)
(25,30)-(25,32)
*)

(* type error slice
(18,4)-(24,51)
(18,10)-(21,14)
(18,12)-(21,14)
(19,6)-(21,14)
(19,6)-(21,14)
(19,6)-(21,14)
(19,6)-(21,14)
(19,6)-(21,14)
(19,12)-(19,13)
(20,20)-(20,34)
(20,20)-(20,59)
(20,20)-(20,59)
(20,38)-(20,54)
(20,38)-(20,59)
(20,38)-(20,59)
(20,58)-(20,59)
(21,13)-(21,14)
(23,24)-(23,55)
(23,46)-(23,47)
(23,48)-(23,54)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
*)
