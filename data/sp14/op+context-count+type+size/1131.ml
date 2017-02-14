
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
(22,16)-(22,24)
(22,16)-(22,44)
(22,25)-(22,44)
(23,4)-(30,51)
(23,15)-(23,16)
(24,4)-(30,51)
(25,6)-(29,16)
(25,19)-(28,23)
(25,25)-(28,23)
(26,8)-(28,23)
(26,14)-(26,28)
(26,15)-(26,20)
(26,22)-(26,27)
(27,29)-(27,37)
(27,30)-(27,32)
(27,34)-(27,36)
(27,41)-(27,56)
(27,42)-(27,46)
(27,47)-(27,55)
(27,48)-(27,50)
(27,52)-(27,54)
(29,6)-(29,10)
(29,6)-(29,16)
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
(25,6)-(29,16)
(25,19)-(28,23)
(26,8)-(28,23)
(26,8)-(28,23)
(26,14)-(26,28)
(26,15)-(26,20)
(27,29)-(27,56)
(27,41)-(27,56)
(27,42)-(27,46)
(27,47)-(27,55)
(29,6)-(29,10)
(29,6)-(29,16)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,35)-(30,39)
*)
