
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
(17,7)-(17,70)
(17,34)-(17,39)
(17,34)-(17,45)
(17,69)-(17,70)
(18,5)-(20,52)
(18,16)-(18,18)
(19,5)-(20,52)
(20,5)-(20,52)
(21,3)-(21,6)
(21,8)-(21,15)
(21,8)-(21,21)
(21,16)-(21,18)
(21,19)-(21,21)
*)

(* type error slice
(15,5)-(20,52)
(15,11)-(17,70)
(17,7)-(17,70)
(17,13)-(17,14)
(18,5)-(20,52)
(18,16)-(18,18)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
*)
