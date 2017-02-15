
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (i,j) ->
          if (i + j) > 9 then a :: (1, ((i + j) - 10)) else a :: (0, (i + j))
      | _ -> a in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let first = List.length l1 in
  let sec = List.length l2 in
  if first < sec
  then ((List.append (clone 0 (sec - first)) l1), l2)
  else
    if first > sec
    then (l1, (List.append (clone 0 (first - sec)) l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i + j) + s) / 10), ((((i + j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(23,14)
(22,10)-(22,77)
(22,13)-(22,20)
(22,13)-(22,24)
(22,14)-(22,15)
(22,18)-(22,19)
(22,23)-(22,24)
(22,30)-(22,54)
(22,36)-(22,37)
(22,39)-(22,53)
(22,41)-(22,42)
(22,50)-(22,52)
(22,60)-(22,61)
(22,65)-(22,77)
(22,66)-(22,67)
(22,70)-(22,71)
(23,13)-(23,14)
(24,4)-(26,51)
(24,15)-(24,17)
(25,4)-(26,51)
(26,4)-(26,51)
*)

(* type error slice
(20,6)-(23,14)
(20,6)-(23,14)
(22,10)-(22,77)
(22,30)-(22,31)
(22,30)-(22,54)
(22,30)-(22,54)
(22,30)-(22,54)
(22,35)-(22,54)
(22,60)-(22,77)
(22,65)-(22,77)
(23,13)-(23,14)
*)
