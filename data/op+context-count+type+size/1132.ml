
let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match ((List.rev list1), (List.rev list2)) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper a x n =
    if n <= 0 then a else (let a' = x :: a in helper a' x (n - 1)) in
  helper [] x n;;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 > length2
  then (l1, (List.append (clone 0 (length1 - length2)) l2))
  else
    if length2 > length1
    then ((List.append (clone 0 (length2 - length1)) l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (o,z) ->
               if ((o + x1) + x2) > 9
               then (1, ((((o + x1) + x2) mod 10) :: z))
               else (0, (((o + x1) + x2) :: z))) in
    let base = (0, []) in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(33,17)-(33,25)
(33,17)-(33,31)
(33,35)-(33,43)
(33,35)-(33,49)
(36,12)-(36,14)
(36,15)-(36,17)
(37,49)-(37,53)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,28)-(4,65)
(4,37)-(4,43)
(4,47)-(4,53)
(4,47)-(4,65)
(4,54)-(4,56)
(4,57)-(4,58)
(4,60)-(4,65)
(5,3)-(5,9)
(5,3)-(5,16)
(5,10)-(5,12)
(5,13)-(5,14)
(5,15)-(5,16)
(7,4)-(15,20)
(7,13)-(15,17)
(7,16)-(15,17)
(8,3)-(15,17)
(8,17)-(8,28)
(8,17)-(8,31)
(8,29)-(8,31)
(9,3)-(15,17)
(9,17)-(9,28)
(9,17)-(9,31)
(9,29)-(9,31)
(10,3)-(15,17)
(11,9)-(11,11)
(11,9)-(11,58)
(11,14)-(11,25)
(11,14)-(11,58)
(11,27)-(11,32)
(11,27)-(11,53)
(11,33)-(11,34)
(11,36)-(11,53)
(11,56)-(11,58)
(18,3)-(18,70)
(18,51)-(18,61)
(18,51)-(18,63)
(18,62)-(18,63)
(21,3)-(38,33)
(21,12)-(37,53)
(22,5)-(37,53)
(30,5)-(37,53)
(31,5)-(37,53)
(32,7)-(36,17)
(33,9)-(35,22)
(34,43)-(34,47)
(34,43)-(34,53)
(34,48)-(34,50)
(34,51)-(34,53)
(36,7)-(36,11)
(36,7)-(36,17)
(36,12)-(36,14)
(36,15)-(36,17)
(37,5)-(37,53)
(37,49)-(37,53)
(38,3)-(38,13)
(38,3)-(38,33)
(38,15)-(38,18)
(38,15)-(38,33)
(38,20)-(38,27)
(38,20)-(38,33)
(38,28)-(38,30)
(38,31)-(38,33)
*)
