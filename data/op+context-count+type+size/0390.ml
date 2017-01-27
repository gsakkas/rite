
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               if
                 ((List.length rest) = (List.length l1)) or
                   ((List.length rest) = (List.length l2))
               then carry :: rest
               else
                 ((((add1 + add2) + carry) / 10),
                   ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l1), l2)
  else (l1, ((clone 0 l) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (carry,rest) ->
          (match x with
           | (add1,add2) ->
               if
                 ((List.length rest) = (List.length l1)) or
                   ((List.length rest) = (List.length l2))
               then (0, (carry :: rest))
               else
                 ((((add1 + add2) + carry) / 10),
                   ((((add1 + add2) + carry) mod 10) :: rest))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,21)-(23,34)
*)

(* type error slice
(15,5)-(29,52)
(15,11)-(26,61)
(15,13)-(26,61)
(16,7)-(26,61)
(16,13)-(16,14)
(18,12)-(26,61)
(18,18)-(18,19)
(20,16)-(26,61)
(21,20)-(21,31)
(21,20)-(21,36)
(21,32)-(21,36)
(21,41)-(21,52)
(21,41)-(21,55)
(21,53)-(21,55)
(22,43)-(22,54)
(22,43)-(22,57)
(22,55)-(22,57)
(23,21)-(23,34)
(25,22)-(25,26)
(25,22)-(25,33)
(25,22)-(25,42)
(25,22)-(25,48)
(25,22)-(26,61)
(25,29)-(25,33)
(25,37)-(25,42)
(26,24)-(26,61)
(27,5)-(29,52)
(27,17)-(27,18)
(27,17)-(27,22)
(27,20)-(27,22)
(28,5)-(29,52)
(28,16)-(28,24)
(28,16)-(28,44)
(28,26)-(28,38)
(28,26)-(28,44)
(28,39)-(28,41)
(28,42)-(28,44)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
(29,36)-(29,40)
(29,41)-(29,45)
*)
