
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev ((List.combine l1 l2) :: (0, 0)) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;


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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;

*)

(* changed spans
(19,24)-(19,56)
(19,49)-(19,55)
(19,50)-(19,51)
(19,53)-(19,54)
(21,7)-(21,14)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,71)
(15,12)-(17,71)
(16,24)-(16,31)
(16,25)-(16,28)
(16,29)-(16,30)
(19,4)-(20,51)
(19,15)-(19,23)
(19,15)-(19,56)
(19,24)-(19,56)
(19,24)-(19,56)
(19,24)-(19,56)
(19,25)-(19,45)
(19,26)-(19,38)
(19,49)-(19,55)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,40)-(20,44)
*)
