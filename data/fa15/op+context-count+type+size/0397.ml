
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
      | (l1e,l2e) -> let num = (l1e + l2e) + a in ((num mod 9), 7) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((padZero l1 l2) (if l1 > l2 then l1 else l2)));;


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
(18,21)-(18,66)
(18,31)-(18,46)
(18,45)-(18,46)
(18,64)-(18,65)
(19,4)-(21,51)
(19,15)-(19,22)
(20,4)-(21,51)
(21,4)-(21,51)
(22,18)-(22,64)
(22,35)-(22,63)
(22,39)-(22,41)
(22,39)-(22,46)
(22,52)-(22,54)
(22,60)-(22,62)
*)

(* type error slice
(16,4)-(21,51)
(16,10)-(18,66)
(16,12)-(18,66)
(17,6)-(18,66)
(18,21)-(18,66)
(18,31)-(18,46)
(18,45)-(18,46)
(18,50)-(18,66)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
