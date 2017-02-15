
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
  removeZero (add (padZero l1 l2));;


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
(16,16)-(16,24)
(16,16)-(16,44)
(16,25)-(16,44)
(17,4)-(19,51)
(17,15)-(17,23)
(17,15)-(17,43)
(17,24)-(17,43)
(18,4)-(19,51)
(18,15)-(18,27)
(18,15)-(18,33)
(19,4)-(19,51)
(19,18)-(19,32)
(19,18)-(19,44)
(19,33)-(19,34)
(19,35)-(19,39)
(19,40)-(19,44)
(19,48)-(19,51)
(20,2)-(20,12)
(20,2)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
(20,27)-(20,29)
(20,30)-(20,32)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(6,7)-(6,59)
(6,55)-(6,56)
(15,2)-(20,34)
(15,11)-(19,51)
(20,13)-(20,34)
(20,14)-(20,17)
(20,18)-(20,33)
(20,19)-(20,26)
*)
