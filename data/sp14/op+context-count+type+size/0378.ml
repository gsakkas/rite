
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
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc n lis =
    match n with | 1 -> lis + acc | _ -> helper (n - 1) (bigAdd l lis) in
  helper [] i l;;


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
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> [0] | 1 -> l | _ -> helper (i - 1) l (bigAdd acc l) in
  helper i l [0];;

*)

(* changed spans
(27,17)-(28,70)
(27,21)-(28,70)
(27,23)-(28,70)
(28,4)-(28,70)
(28,10)-(28,11)
(28,24)-(28,27)
(28,24)-(28,33)
(28,30)-(28,33)
(28,41)-(28,47)
(28,41)-(28,70)
(28,49)-(28,50)
(28,56)-(28,70)
(28,64)-(28,65)
(28,66)-(28,69)
(29,9)-(29,11)
*)

(* type error slice
(4,3)-(11,47)
(4,12)-(11,45)
(4,15)-(11,45)
(10,16)-(10,35)
(10,30)-(10,31)
(10,32)-(10,34)
(16,3)-(24,36)
(16,11)-(24,34)
(16,14)-(24,34)
(24,18)-(24,33)
(24,19)-(24,26)
(24,30)-(24,32)
(27,2)-(29,15)
(27,17)-(28,70)
(27,21)-(28,70)
(27,23)-(28,70)
(28,4)-(28,70)
(28,24)-(28,27)
(28,24)-(28,33)
(28,41)-(28,47)
(28,41)-(28,70)
(28,48)-(28,55)
(28,56)-(28,70)
(28,57)-(28,63)
(28,66)-(28,69)
(29,2)-(29,8)
(29,2)-(29,15)
(29,9)-(29,11)
*)
