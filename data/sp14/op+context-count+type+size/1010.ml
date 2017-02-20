
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
    let f a x = failwith "to be implemented" in
    let base = 0 in
    let args =
      let rec pair list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
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
        match ((List.rev list1), (List.rev list2)) with
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair t1 t2)
        | (_,_) -> [] in
      pair l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(22,16)-(22,24)
(22,16)-(22,44)
(22,25)-(22,44)
(23,4)-(30,51)
(23,15)-(23,16)
(24,4)-(30,51)
(25,6)-(29,16)
(25,19)-(28,21)
(26,15)-(26,20)
(26,22)-(26,27)
(27,29)-(27,37)
(27,30)-(27,32)
(27,34)-(27,36)
(27,41)-(27,53)
(27,42)-(27,46)
(27,47)-(27,49)
(27,50)-(27,52)
(29,6)-(29,10)
(29,11)-(29,13)
(29,14)-(29,16)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,12)
(31,2)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)

(* type error slice
(23,4)-(30,51)
(23,15)-(23,16)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,35)-(30,39)
*)

(* all spans
(2,14)-(5,15)
(2,16)-(5,15)
(3,2)-(5,15)
(3,17)-(4,66)
(3,19)-(4,66)
(3,21)-(4,66)
(4,4)-(4,66)
(4,7)-(4,13)
(4,7)-(4,8)
(4,12)-(4,13)
(4,19)-(4,20)
(4,26)-(4,66)
(4,36)-(4,42)
(4,36)-(4,37)
(4,41)-(4,42)
(4,46)-(4,65)
(4,46)-(4,52)
(4,53)-(4,55)
(4,56)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,15)
(5,2)-(5,8)
(5,9)-(5,11)
(5,12)-(5,13)
(5,14)-(5,15)
(7,12)-(15,17)
(7,15)-(15,17)
(8,2)-(15,17)
(8,16)-(8,30)
(8,16)-(8,27)
(8,28)-(8,30)
(9,2)-(15,17)
(9,16)-(9,30)
(9,16)-(9,27)
(9,28)-(9,30)
(10,2)-(15,17)
(10,5)-(10,22)
(10,5)-(10,12)
(10,15)-(10,22)
(11,7)-(11,59)
(11,8)-(11,10)
(11,12)-(11,58)
(11,13)-(11,24)
(11,25)-(11,54)
(11,26)-(11,31)
(11,32)-(11,33)
(11,34)-(11,53)
(11,35)-(11,42)
(11,45)-(11,52)
(11,55)-(11,57)
(13,4)-(15,17)
(13,7)-(13,24)
(13,7)-(13,14)
(13,17)-(13,24)
(14,9)-(14,61)
(14,10)-(14,56)
(14,11)-(14,22)
(14,23)-(14,52)
(14,24)-(14,29)
(14,30)-(14,31)
(14,32)-(14,51)
(14,33)-(14,40)
(14,43)-(14,50)
(14,53)-(14,55)
(14,58)-(14,60)
(15,9)-(15,17)
(15,10)-(15,12)
(15,14)-(15,16)
(17,19)-(18,69)
(18,2)-(18,69)
(18,8)-(18,9)
(18,23)-(18,25)
(18,36)-(18,69)
(18,39)-(18,44)
(18,39)-(18,40)
(18,43)-(18,44)
(18,50)-(18,62)
(18,50)-(18,60)
(18,61)-(18,62)
(18,68)-(18,69)
(20,11)-(31,34)
(20,14)-(31,34)
(21,2)-(31,34)
(21,11)-(30,51)
(22,4)-(30,51)
(22,10)-(22,44)
(22,12)-(22,44)
(22,16)-(22,44)
(22,16)-(22,24)
(22,25)-(22,44)
(23,4)-(30,51)
(23,15)-(23,16)
(24,4)-(30,51)
(25,6)-(29,16)
(25,19)-(28,21)
(25,25)-(28,21)
(26,8)-(28,21)
(26,14)-(26,28)
(26,15)-(26,20)
(26,22)-(26,27)
(27,29)-(27,53)
(27,29)-(27,37)
(27,30)-(27,32)
(27,34)-(27,36)
(27,41)-(27,53)
(27,42)-(27,46)
(27,47)-(27,49)
(27,50)-(27,52)
(28,19)-(28,21)
(29,6)-(29,16)
(29,6)-(29,10)
(29,11)-(29,13)
(29,14)-(29,16)
(30,4)-(30,51)
(30,18)-(30,44)
(30,18)-(30,32)
(30,33)-(30,34)
(30,35)-(30,39)
(30,40)-(30,44)
(30,48)-(30,51)
(31,2)-(31,34)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)
