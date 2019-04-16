
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
(27,18)-(28,71)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
LamG VarPatG (LamG VarPatG EmptyG)

(29,10)-(29,13)
i
VarG

(29,14)-(29,15)
l
VarG

(29,16)-(29,17)
[0]
ListG (fromList [LitG])

*)

(* type error slice
(4,4)-(11,48)
(4,13)-(11,46)
(4,16)-(11,46)
(10,17)-(10,36)
(10,31)-(10,32)
(10,33)-(10,35)
(16,4)-(24,37)
(16,12)-(24,35)
(16,15)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,31)-(24,33)
(27,3)-(29,17)
(27,18)-(28,71)
(27,22)-(28,71)
(27,24)-(28,71)
(28,5)-(28,71)
(28,25)-(28,28)
(28,25)-(28,34)
(28,42)-(28,48)
(28,42)-(28,71)
(28,49)-(28,56)
(28,57)-(28,71)
(28,58)-(28,64)
(28,67)-(28,70)
(29,3)-(29,9)
(29,3)-(29,17)
(29,10)-(29,13)
*)
