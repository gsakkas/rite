
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
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, (num @ list))
               else if num = 10 then (1, ([0] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;


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
               let num = (l1e + l2e) + carry in
               if num < 10
               then (0, ([num] @ list))
               else
                 if num = 10
                 then (1, ([0] @ list))
                 else ((num / 10), ([num mod 10] @ list))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

*)

(* changed spans
(23,25)-(23,28)
(24,20)-(24,54)
(25,4)-(27,51)
(25,16)-(25,17)
(26,4)-(27,51)
(27,4)-(27,51)
(31,13)-(31,29)
(31,13)-(31,48)
(31,14)-(31,25)
(31,26)-(31,28)
(31,32)-(31,48)
(31,33)-(31,44)
(31,45)-(31,47)
(31,54)-(31,56)
(31,62)-(31,64)
*)

(* type error slice
(21,15)-(24,54)
(21,25)-(21,44)
(23,24)-(23,36)
(23,25)-(23,28)
(23,29)-(23,30)
(24,20)-(24,54)
(24,20)-(24,54)
(24,20)-(24,54)
(24,37)-(24,54)
*)
