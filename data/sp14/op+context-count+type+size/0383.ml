
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
(19,6)-(19,72)
(19,12)-(19,13)
(19,33)-(19,47)
(19,33)-(19,72)
(19,35)-(19,36)
(19,39)-(19,40)
(19,44)-(19,46)
(19,53)-(19,54)
(19,57)-(19,58)
(19,64)-(19,66)
(19,71)-(19,72)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,25)-(21,45)
(21,46)-(21,47)
(21,48)-(21,54)
(21,49)-(21,50)
(21,52)-(21,53)
(22,4)-(22,51)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(18,4)-(22,51)
(18,10)-(19,72)
(18,12)-(19,72)
(19,6)-(19,72)
(19,6)-(19,72)
(19,6)-(19,72)
(19,33)-(19,72)
(19,51)-(19,67)
(19,51)-(19,72)
(19,51)-(19,72)
(19,71)-(19,72)
(21,24)-(21,55)
(21,46)-(21,47)
(21,48)-(21,54)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
*)
