
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
  removeZero (add (l1 (if l1 > l2 then l1 else l2)));;


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
(2,19)-(5,42)
(3,2)-(5,42)
(5,2)-(5,42)
(8,2)-(18,52)
(9,4)-(17,51)
(9,10)-(14,76)
(9,12)-(14,76)
(10,6)-(14,76)
(10,12)-(10,13)
(12,10)-(14,76)
(12,17)-(12,18)
(14,15)-(14,75)
(14,25)-(14,36)
(14,25)-(14,44)
(14,26)-(14,29)
(14,32)-(14,35)
(14,39)-(14,44)
(14,48)-(14,75)
(14,49)-(14,60)
(14,50)-(14,53)
(14,58)-(14,59)
(14,62)-(14,74)
(14,63)-(14,66)
(14,64)-(14,65)
(14,67)-(14,68)
(14,69)-(14,73)
(15,4)-(17,51)
(15,15)-(15,22)
(15,16)-(15,17)
(15,19)-(15,21)
(16,4)-(17,51)
(16,15)-(16,27)
(16,15)-(16,33)
(16,28)-(16,30)
(16,31)-(16,33)
(17,4)-(17,51)
(17,18)-(17,32)
(17,18)-(17,44)
(17,33)-(17,34)
(17,35)-(17,39)
(17,40)-(17,44)
(17,48)-(17,51)
(18,2)-(18,12)
(18,13)-(18,52)
(18,14)-(18,17)
(18,18)-(18,51)
(18,19)-(18,21)
(18,22)-(18,50)
(18,26)-(18,28)
(18,26)-(18,33)
(18,31)-(18,33)
(18,39)-(18,41)
(18,47)-(18,49)
*)

(* type error slice
(18,18)-(18,51)
(18,19)-(18,21)
(18,22)-(18,50)
(18,39)-(18,41)
*)
