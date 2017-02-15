
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
(23,20)-(23,33)
*)

(* type error slice
(15,4)-(29,51)
(15,10)-(26,63)
(15,12)-(26,63)
(16,6)-(26,63)
(16,6)-(26,63)
(16,12)-(16,13)
(18,10)-(26,63)
(20,15)-(26,62)
(20,15)-(26,62)
(23,20)-(23,33)
(25,17)-(26,62)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
*)
