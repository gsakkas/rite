
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
      | h::t -> (((h + z) / 10), ((h + z) mod 10)) :: t
      | _ -> ((z / 10), (z mod 10)) in
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
(20,7)-(22,34)
(21,20)-(21,21)
(21,20)-(21,56)
(21,36)-(21,37)
(21,36)-(21,49)
(21,55)-(21,56)
(22,16)-(22,17)
(22,16)-(22,22)
(22,16)-(22,34)
(22,20)-(22,22)
(22,26)-(22,27)
(22,26)-(22,34)
(22,32)-(22,34)
(23,5)-(25,52)
(24,5)-(25,52)
(25,5)-(25,52)
*)

(* type error slice
(20,7)-(22,34)
(20,7)-(22,34)
(21,20)-(21,21)
(21,20)-(21,25)
(21,20)-(21,49)
(21,20)-(21,56)
(21,20)-(21,56)
(21,55)-(21,56)
*)
