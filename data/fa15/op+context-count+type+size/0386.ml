
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
    let f a x = match x with | (l1e,l2e) -> let num = l1e + l2e in (num, [7]) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add ((if l1 > l2 then l1 else l2) (padZero l1 l2)));;


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
(16,44)-(16,77)
(16,54)-(16,57)
(16,54)-(16,63)
(16,67)-(16,77)
(16,68)-(16,71)
(16,73)-(16,76)
(17,4)-(19,51)
(17,15)-(17,22)
(18,4)-(19,51)
(19,4)-(19,51)
(20,18)-(20,64)
(20,19)-(20,47)
(20,23)-(20,25)
(20,23)-(20,30)
(20,28)-(20,30)
(20,36)-(20,38)
(20,44)-(20,46)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(20,18)-(20,64)
(20,19)-(20,47)
(20,36)-(20,38)
(20,48)-(20,63)
(20,49)-(20,56)
(20,57)-(20,59)
*)
