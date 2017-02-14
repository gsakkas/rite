
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
                 ((List.length x) = (List.length l1)) or
                   ((List.length x) = (List.length l2))
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
(21,32)-(21,33)
(22,34)-(22,35)
(23,21)-(23,34)
*)

(* type error slice
(15,5)-(29,52)
(15,11)-(26,61)
(15,13)-(26,61)
(16,7)-(26,61)
(16,7)-(26,61)
(16,13)-(16,14)
(18,12)-(26,61)
(18,12)-(26,61)
(18,18)-(18,19)
(20,16)-(26,61)
(20,16)-(26,61)
(22,22)-(22,33)
(22,22)-(22,35)
(22,34)-(22,35)
(23,21)-(23,34)
(25,22)-(26,61)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
*)
