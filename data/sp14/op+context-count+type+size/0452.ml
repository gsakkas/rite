
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
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
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
      match a with
      | (w,[]) -> (w, [z / 10; z mod 10])
      | (w,h::t) -> (((w + z) / 10), (((w + z) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  add (padZero l1 l2);;

*)

(* changed spans
(17,6)-(17,71)
(17,31)-(17,45)
(17,32)-(17,39)
(17,68)-(17,69)
(18,4)-(20,51)
(18,15)-(18,17)
(19,4)-(20,51)
(20,4)-(20,51)
(21,2)-(21,5)
(21,6)-(21,21)
(21,7)-(21,14)
(21,15)-(21,17)
(21,18)-(21,20)
*)

(* type error slice
(15,4)-(20,51)
(15,10)-(17,71)
(17,6)-(17,71)
(17,12)-(17,13)
(18,4)-(20,51)
(18,15)-(18,17)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
(20,35)-(20,39)
*)
