
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
  removeZero
    (add (padZero l1 l2)
       (if (List.length l1) > (List.length l2) then l1 else l2));;


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
(26,4)-(27,64)
(26,9)-(26,24)
(27,7)-(27,63)
(27,11)-(27,27)
(27,11)-(27,46)
(27,30)-(27,46)
(27,52)-(27,54)
*)

(* type error slice
(15,2)-(27,64)
(15,11)-(24,51)
(16,4)-(24,51)
(16,4)-(24,51)
(16,10)-(21,76)
(19,10)-(21,76)
(19,17)-(19,18)
(21,62)-(21,74)
(21,67)-(21,68)
(21,69)-(21,73)
(22,4)-(24,51)
(23,4)-(24,51)
(24,4)-(24,51)
(24,4)-(24,51)
(24,18)-(24,32)
(24,18)-(24,44)
(24,33)-(24,34)
(24,48)-(24,51)
(26,4)-(27,64)
(26,5)-(26,8)
*)
