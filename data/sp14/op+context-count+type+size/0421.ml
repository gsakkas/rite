
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
  helper [0] i l;;


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
(27,18)-(28,70)
(27,22)-(28,70)
(27,24)-(28,70)
(28,5)-(28,70)
(28,11)-(28,12)
(28,25)-(28,28)
(28,25)-(28,34)
(28,31)-(28,34)
(28,42)-(28,48)
(28,42)-(28,70)
(28,50)-(28,51)
(28,58)-(28,70)
(28,65)-(28,66)
(28,67)-(28,70)
(29,10)-(29,13)
(29,11)-(29,12)
*)

(* type error slice
(4,4)-(11,48)
(4,13)-(11,45)
(4,16)-(11,45)
(10,19)-(10,35)
(10,31)-(10,32)
(10,33)-(10,35)
(16,4)-(24,37)
(16,12)-(24,33)
(16,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,31)-(24,33)
(27,3)-(29,17)
(27,18)-(28,70)
(27,22)-(28,70)
(27,24)-(28,70)
(28,5)-(28,70)
(28,25)-(28,28)
(28,25)-(28,34)
(28,42)-(28,48)
(28,42)-(28,70)
(28,50)-(28,55)
(28,58)-(28,64)
(28,58)-(28,70)
(28,67)-(28,70)
(29,3)-(29,9)
(29,3)-(29,17)
(29,10)-(29,13)
*)
