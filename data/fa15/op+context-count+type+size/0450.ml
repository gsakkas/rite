
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
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i <= 1 then l else bigAdd l ((mulByDigit i) - (1 l));;


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
    let args = List.combine (List.rev ([0] @ l1)) (List.rev ([0] @ l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

let rec mulByDigit i l =
  if i <= 1 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(37,33)-(37,57)
(37,34)-(37,48)
(37,46)-(37,47)
(37,51)-(37,56)
*)

(* type error slice
(4,3)-(7,61)
(4,12)-(7,59)
(4,15)-(7,59)
(7,36)-(7,52)
(7,37)-(7,48)
(7,49)-(7,51)
(14,3)-(34,69)
(14,11)-(34,67)
(14,14)-(34,67)
(33,8)-(33,23)
(33,9)-(33,16)
(33,20)-(33,22)
(36,3)-(37,59)
(36,19)-(37,57)
(36,21)-(37,57)
(37,24)-(37,30)
(37,24)-(37,57)
(37,33)-(37,57)
(37,33)-(37,57)
(37,34)-(37,48)
(37,35)-(37,45)
(37,51)-(37,56)
(37,52)-(37,53)
*)
