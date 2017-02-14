
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
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
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
(16,17)-(16,25)
(16,17)-(16,45)
(16,26)-(16,45)
(17,5)-(19,52)
(17,16)-(17,24)
(17,16)-(17,44)
(17,25)-(17,44)
(18,5)-(19,52)
(18,16)-(18,28)
(18,16)-(18,34)
(19,5)-(19,52)
(20,3)-(20,13)
(20,15)-(20,18)
(20,15)-(20,62)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
(20,36)-(20,62)
(20,39)-(20,41)
(20,39)-(20,46)
(20,44)-(20,46)
(20,52)-(20,54)
(20,60)-(20,62)
*)

(* type error slice
(4,4)-(7,62)
(4,13)-(7,60)
(4,16)-(7,60)
(5,3)-(7,60)
(6,9)-(6,60)
(6,56)-(6,57)
(15,3)-(20,62)
(15,12)-(19,52)
(20,15)-(20,18)
(20,15)-(20,62)
(20,20)-(20,27)
(20,20)-(20,33)
*)
