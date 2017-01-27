
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = 0 :: (List.combine (List.rev l1) (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) > (List.length l2)
    then
      (let y = (clone 0 ((List.length l1) - (List.length l2))) @ l2 in
       (l1, y))
    else
      (let z = (clone 0 ((List.length l2) - (List.length l1))) @ l1 in
       (z, l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (d1,d2) ->
          (match a with
           | (carry,result) ->
               if ((d1 + d2) + carry) > 9
               then (1, ((((d1 + d2) + carry) - 10) :: result))
               else (0, (((d1 + d2) + carry) :: result))) in
    let base = (0, []) in
    let args = [(0, 0)] @ (List.combine (List.rev l1) (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(30,16)-(30,17)
(30,16)-(30,61)
(30,22)-(30,61)
(32,20)-(32,27)
(32,28)-(32,30)
(32,31)-(32,33)
*)

(* type error slice
(21,5)-(31,52)
(21,11)-(28,55)
(21,13)-(28,55)
(22,7)-(28,55)
(22,13)-(22,14)
(24,12)-(28,55)
(24,18)-(24,19)
(26,16)-(28,55)
(26,21)-(26,23)
(26,21)-(26,28)
(26,21)-(26,37)
(26,26)-(26,28)
(26,32)-(26,37)
(27,22)-(27,23)
(27,22)-(27,62)
(27,29)-(27,51)
(27,29)-(27,62)
(27,56)-(27,62)
(29,5)-(31,52)
(29,17)-(29,18)
(29,17)-(29,22)
(29,20)-(29,22)
(30,5)-(31,52)
(30,16)-(30,17)
(30,16)-(30,61)
(30,22)-(30,34)
(30,22)-(30,61)
(30,36)-(30,44)
(30,36)-(30,47)
(30,45)-(30,47)
(30,50)-(30,58)
(30,50)-(30,61)
(30,59)-(30,61)
(31,19)-(31,33)
(31,19)-(31,45)
(31,34)-(31,35)
(31,36)-(31,40)
(31,41)-(31,45)
*)
