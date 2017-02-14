
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
(2,20)-(5,43)
(3,3)-(5,43)
(5,3)-(5,43)
(8,3)-(18,50)
(9,5)-(17,52)
(9,11)-(14,74)
(9,13)-(14,74)
(10,7)-(14,74)
(10,13)-(10,14)
(12,12)-(14,74)
(12,18)-(12,19)
(14,16)-(14,74)
(14,27)-(14,30)
(14,27)-(14,36)
(14,27)-(14,45)
(14,33)-(14,36)
(14,40)-(14,45)
(14,51)-(14,54)
(14,51)-(14,60)
(14,51)-(14,74)
(14,59)-(14,60)
(14,64)-(14,67)
(14,64)-(14,74)
(14,65)-(14,66)
(14,68)-(14,69)
(14,70)-(14,74)
(15,5)-(17,52)
(15,17)-(15,18)
(15,17)-(15,22)
(15,20)-(15,22)
(16,5)-(17,52)
(16,16)-(16,28)
(16,16)-(16,34)
(16,29)-(16,31)
(16,32)-(16,34)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,36)-(17,40)
(17,41)-(17,45)
(17,49)-(17,52)
(18,3)-(18,13)
(18,15)-(18,18)
(18,15)-(18,50)
(18,20)-(18,22)
(18,20)-(18,50)
(18,24)-(18,50)
(18,27)-(18,29)
(18,27)-(18,34)
(18,32)-(18,34)
(18,40)-(18,42)
(18,48)-(18,50)
*)

(* type error slice
(18,20)-(18,22)
(18,20)-(18,50)
(18,24)-(18,50)
(18,40)-(18,42)
*)
