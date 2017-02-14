
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
(16,45)-(16,77)
(16,55)-(16,58)
(16,55)-(16,64)
(16,69)-(16,72)
(16,69)-(16,77)
(16,74)-(16,77)
(17,5)-(19,52)
(17,17)-(17,22)
(18,5)-(19,52)
(19,5)-(19,52)
(20,21)-(20,47)
(20,21)-(20,63)
(20,24)-(20,26)
(20,24)-(20,31)
(20,29)-(20,31)
(20,37)-(20,39)
(20,45)-(20,47)
*)

(* type error slice
(4,4)-(7,62)
(4,13)-(7,60)
(6,38)-(6,49)
(6,38)-(6,52)
(6,50)-(6,52)
(20,21)-(20,47)
(20,21)-(20,63)
(20,37)-(20,39)
(20,50)-(20,57)
(20,50)-(20,63)
(20,58)-(20,60)
*)
