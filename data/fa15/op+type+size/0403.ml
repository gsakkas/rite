
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
    let args = List.combine (List.rev padZero l1) (List.rev l2) in
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
    let args = List.combine (List.rev ([0] @ l1)) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero
    (add
       ((padZero l1 l2),
         (if (List.length l1) > (List.length l2) then l1 else l2)));;

*)

(* changed spans
(29,28)-(29,49)
(29,38)-(29,45)
(29,46)-(29,48)
*)

(* type error slice
(29,28)-(29,49)
(29,29)-(29,37)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(7,59)
(4,15)-(7,59)
(5,2)-(7,59)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,59)
(6,55)-(6,56)
(6,7)-(6,54)
(6,8)-(6,13)
(6,14)-(6,15)
(6,16)-(6,53)
(6,17)-(6,33)
(6,18)-(6,29)
(6,30)-(6,32)
(6,36)-(6,52)
(6,37)-(6,48)
(6,49)-(6,51)
(6,57)-(6,59)
(7,7)-(7,59)
(7,55)-(7,56)
(7,7)-(7,54)
(7,8)-(7,13)
(7,14)-(7,15)
(7,16)-(7,53)
(7,17)-(7,33)
(7,18)-(7,29)
(7,30)-(7,32)
(7,36)-(7,52)
(7,37)-(7,48)
(7,49)-(7,51)
(7,57)-(7,59)
(9,19)-(12,42)
(10,2)-(12,42)
(10,8)-(11,72)
(10,10)-(11,72)
(11,4)-(11,72)
(11,7)-(11,26)
(11,7)-(11,22)
(11,8)-(11,19)
(11,20)-(11,21)
(11,25)-(11,26)
(11,32)-(11,59)
(11,36)-(11,41)
(11,36)-(11,37)
(11,40)-(11,41)
(11,47)-(11,49)
(11,55)-(11,58)
(11,56)-(11,57)
(11,65)-(11,72)
(11,67)-(11,68)
(11,65)-(11,66)
(11,69)-(11,72)
(11,70)-(11,71)
(12,2)-(12,42)
(12,13)-(12,15)
(12,19)-(12,42)
(12,19)-(12,33)
(12,34)-(12,35)
(12,36)-(12,40)
(12,41)-(12,42)
(14,11)-(34,67)
(14,14)-(34,67)
(15,2)-(34,67)
(15,11)-(30,51)
(16,4)-(30,51)
(16,10)-(27,58)
(16,12)-(27,58)
(17,6)-(27,58)
(17,12)-(17,13)
(19,10)-(27,58)
(19,17)-(19,18)
(21,15)-(27,57)
(21,25)-(21,44)
(21,25)-(21,36)
(21,26)-(21,29)
(21,32)-(21,35)
(21,39)-(21,44)
(22,15)-(27,57)
(22,18)-(22,26)
(22,18)-(22,21)
(22,24)-(22,26)
(23,20)-(23,39)
(23,21)-(23,22)
(23,24)-(23,38)
(23,31)-(23,32)
(23,25)-(23,30)
(23,26)-(23,29)
(23,33)-(23,37)
(25,17)-(27,57)
(25,20)-(25,28)
(25,20)-(25,23)
(25,26)-(25,28)
(26,22)-(26,39)
(26,23)-(26,24)
(26,26)-(26,38)
(26,31)-(26,32)
(26,27)-(26,30)
(26,28)-(26,29)
(26,33)-(26,37)
(27,22)-(27,57)
(27,23)-(27,33)
(27,24)-(27,27)
(27,30)-(27,32)
(27,35)-(27,56)
(27,49)-(27,50)
(27,36)-(27,48)
(27,37)-(27,47)
(27,37)-(27,40)
(27,45)-(27,47)
(27,51)-(27,55)
(28,4)-(30,51)
(28,15)-(28,22)
(28,16)-(28,17)
(28,19)-(28,21)
(29,4)-(30,51)
(29,15)-(29,63)
(29,15)-(29,27)
(29,28)-(29,49)
(29,29)-(29,37)
(29,38)-(29,45)
(29,46)-(29,48)
(29,50)-(29,63)
(29,51)-(29,59)
(29,60)-(29,62)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(34,67)
(31,2)-(31,12)
(32,4)-(34,67)
(32,5)-(32,8)
(33,7)-(34,66)
(33,8)-(33,23)
(33,9)-(33,16)
(33,17)-(33,19)
(33,20)-(33,22)
(34,9)-(34,65)
(34,13)-(34,48)
(34,13)-(34,29)
(34,14)-(34,25)
(34,26)-(34,28)
(34,32)-(34,48)
(34,33)-(34,44)
(34,45)-(34,47)
(34,54)-(34,56)
(34,62)-(34,64)
*)
