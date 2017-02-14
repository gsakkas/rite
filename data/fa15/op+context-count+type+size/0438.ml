
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2) (if l1 > l2 then l1 else l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (clone 0 ((List.length l2) - (List.length l1))) @ l1
  else (clone 0 ((List.length l1) - (List.length l2))) @ l2;;

let rec removeZero l =
  let f a x =
    if (List.length a) = 0 then (if x = 0 then [] else [x]) else a @ [x] in
  let base = [] in List.fold_left f base l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (l1e,l2e) ->
          (match a with
           | (carry,list) ->
               let num = (l1e + l2e) + carry in ((num mod 9), ([7] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2), l2));;

*)

(* changed spans
(25,15)-(25,62)
(25,20)-(25,33)
(25,36)-(25,62)
(25,39)-(25,41)
(25,39)-(25,46)
(25,52)-(25,54)
(25,60)-(25,62)
*)

(* type error slice
(15,3)-(25,62)
(15,12)-(24,52)
(16,5)-(24,52)
(16,5)-(24,52)
(16,11)-(21,74)
(19,12)-(21,74)
(19,18)-(19,19)
(21,64)-(21,74)
(21,68)-(21,69)
(21,70)-(21,74)
(22,5)-(24,52)
(23,5)-(24,52)
(24,5)-(24,52)
(24,5)-(24,52)
(24,19)-(24,33)
(24,19)-(24,45)
(24,34)-(24,35)
(24,49)-(24,52)
(25,15)-(25,18)
(25,15)-(25,62)
*)
