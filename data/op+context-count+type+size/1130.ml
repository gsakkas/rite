
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
        | (h1::t1,h2::t2) -> (h1, h2) :: (pair (t1, t2))
        | ([],[]) -> [] in
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
(22,17)-(22,25)
(22,17)-(22,45)
(22,26)-(22,45)
(23,5)-(30,52)
(23,16)-(23,17)
(24,5)-(30,52)
(26,9)-(28,24)
(26,16)-(26,21)
(26,16)-(26,28)
(26,23)-(26,28)
(27,31)-(27,33)
(27,31)-(27,55)
(27,35)-(27,37)
(27,43)-(27,47)
(27,49)-(27,51)
(27,49)-(27,55)
(27,53)-(27,55)
(28,22)-(28,24)
(29,7)-(29,11)
(29,12)-(29,14)
(29,15)-(29,17)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
(30,49)-(30,52)
(31,3)-(31,13)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
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
(21,3)-(31,33)
(21,12)-(30,52)
(22,5)-(30,52)
(22,11)-(22,45)
(22,13)-(22,45)
(23,5)-(30,52)
(23,16)-(23,17)
(24,5)-(30,52)
(25,7)-(29,17)
(25,20)-(28,24)
(25,26)-(28,24)
(26,9)-(28,24)
(26,16)-(26,21)
(26,16)-(26,28)
(26,23)-(26,28)
(27,31)-(27,55)
(27,43)-(27,47)
(27,43)-(27,55)
(27,49)-(27,51)
(27,49)-(27,55)
(27,53)-(27,55)
(29,7)-(29,11)
(29,7)-(29,17)
(29,12)-(29,14)
(29,15)-(29,17)
(30,5)-(30,52)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
(30,49)-(30,52)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
*)
