
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
    let f a x = match x with | (l1e,l2e) -> (1, [7]) in
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
(16,44)-(16,52)
(16,45)-(16,46)
(16,48)-(16,51)
(17,4)-(19,51)
(17,15)-(17,22)
(18,4)-(19,51)
(19,4)-(19,51)
(20,14)-(20,17)
(20,18)-(20,64)
(20,19)-(20,34)
(20,20)-(20,27)
(20,28)-(20,30)
(20,31)-(20,33)
(20,35)-(20,63)
(20,39)-(20,41)
(20,39)-(20,46)
(20,44)-(20,46)
(20,52)-(20,54)
(20,60)-(20,62)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(6,7)-(6,59)
(6,55)-(6,56)
(20,18)-(20,64)
(20,19)-(20,34)
(20,20)-(20,27)
*)
