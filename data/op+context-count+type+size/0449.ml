
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
(19,27)-(19,55)
(19,51)-(19,52)
(19,51)-(19,55)
(19,54)-(19,55)
*)

(* type error slice
(15,5)-(20,52)
(15,11)-(17,70)
(15,13)-(17,70)
(16,7)-(17,70)
(16,16)-(16,19)
(16,16)-(16,21)
(16,20)-(16,21)
(17,7)-(17,70)
(17,13)-(17,14)
(17,34)-(17,35)
(17,34)-(17,39)
(17,34)-(17,45)
(17,34)-(17,70)
(17,51)-(17,64)
(17,51)-(17,70)
(17,69)-(17,70)
(18,5)-(20,52)
(18,17)-(18,18)
(18,17)-(18,22)
(18,20)-(18,22)
(19,5)-(20,52)
(19,16)-(19,24)
(19,16)-(19,55)
(19,27)-(19,39)
(19,27)-(19,45)
(19,27)-(19,55)
(19,40)-(19,42)
(19,43)-(19,45)
(19,51)-(19,52)
(19,51)-(19,55)
(19,54)-(19,55)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
*)
