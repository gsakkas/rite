
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
      match x with | (x,y)::t -> ((x + y) / 10) :: ((x + y) mod 10) :: t in
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
(19,7)-(19,73)
(19,13)-(19,14)
(19,36)-(19,37)
(19,36)-(19,47)
(19,36)-(19,73)
(19,40)-(19,41)
(19,45)-(19,47)
(19,54)-(19,55)
(19,58)-(19,59)
(19,65)-(19,67)
(19,72)-(19,73)
(20,16)-(20,18)
(21,27)-(21,45)
(21,47)-(21,48)
(21,50)-(21,51)
(21,50)-(21,54)
(21,53)-(21,54)
(23,20)-(23,27)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(18,5)-(22,52)
(18,11)-(19,73)
(18,13)-(19,73)
(19,7)-(19,73)
(19,13)-(19,14)
(19,36)-(19,73)
(19,54)-(19,67)
(19,54)-(19,73)
(19,72)-(19,73)
(20,5)-(22,52)
(20,16)-(20,18)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,54)
(21,27)-(21,39)
(21,27)-(21,45)
(21,27)-(21,54)
(21,40)-(21,42)
(21,43)-(21,45)
(21,47)-(21,48)
(21,50)-(21,51)
(21,50)-(21,54)
(21,53)-(21,54)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
*)
