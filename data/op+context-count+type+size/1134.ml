
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
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> (pair (h1, h2)) :: (acc t1 t2)
        | (_,_) -> acc in
      pair [(0, 0)] (List.rev l1) (List.rev l2) in
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
      let rec pair acc list1 list2 =
        match (list1, list2) with
        | (h1::t1,h2::t2) -> pair ((h1, h2) :: acc) t1 t2
        | (_,_) -> acc in
      pair [(0, 0)] (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(34,31)-(34,43)
(34,31)-(34,59)
(34,37)-(34,43)
(34,50)-(34,59)
(36,14)-(36,15)
(36,17)-(36,18)
*)

(* type error slice
(32,7)-(36,47)
(32,20)-(35,23)
(32,24)-(35,23)
(32,30)-(35,23)
(33,9)-(35,23)
(33,16)-(33,21)
(33,16)-(33,28)
(33,23)-(33,28)
(34,31)-(34,35)
(34,31)-(34,43)
(34,31)-(34,59)
(34,37)-(34,39)
(34,37)-(34,43)
(34,41)-(34,43)
(34,50)-(34,53)
(34,50)-(34,59)
(34,54)-(34,56)
(34,57)-(34,59)
(35,20)-(35,23)
(36,7)-(36,11)
(36,7)-(36,47)
(36,12)-(36,20)
(36,14)-(36,15)
(36,14)-(36,18)
(36,17)-(36,18)
(36,22)-(36,30)
(36,22)-(36,33)
(36,31)-(36,33)
(36,36)-(36,44)
(36,36)-(36,47)
(36,45)-(36,47)
*)
