
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
      | h::t -> ((h + z) / 10) :: ((h + z) mod 10) :: t
      | _ -> ((z / 10), [z mod 10]) in
    let base = [] in
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
(20,6)-(22,35)
(21,16)-(21,55)
(21,18)-(21,19)
(21,36)-(21,37)
(21,54)-(21,55)
(22,13)-(22,35)
(22,14)-(22,22)
(22,15)-(22,16)
(22,19)-(22,21)
(22,24)-(22,34)
(22,25)-(22,26)
(22,25)-(22,33)
(22,31)-(22,33)
(23,4)-(25,51)
(24,4)-(25,51)
(25,4)-(25,51)
(26,14)-(26,17)
*)

(* type error slice
(18,4)-(25,51)
(18,10)-(22,35)
(20,6)-(22,35)
(20,6)-(22,35)
(20,6)-(22,35)
(20,6)-(22,35)
(20,12)-(20,13)
(21,16)-(21,55)
(22,13)-(22,35)
(25,4)-(25,51)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
*)
