
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
      match x with | (l1e,l2e) -> let num = (l1e + l2e) + a in (num, [7]) in
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
(17,34)-(17,73)
(17,44)-(17,59)
(17,58)-(17,59)
(17,64)-(17,67)
(17,69)-(17,72)
(18,4)-(20,51)
(18,15)-(18,22)
(19,4)-(20,51)
(20,4)-(20,51)
(21,18)-(21,64)
(21,35)-(21,63)
(21,39)-(21,41)
(21,39)-(21,46)
(21,52)-(21,54)
(21,60)-(21,62)
*)

(* type error slice
(16,4)-(20,51)
(16,10)-(17,73)
(16,12)-(17,73)
(17,6)-(17,73)
(17,34)-(17,73)
(17,44)-(17,59)
(17,58)-(17,59)
(17,63)-(17,73)
(20,18)-(20,32)
(20,18)-(20,44)
(20,33)-(20,34)
*)
