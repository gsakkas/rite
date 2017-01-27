
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = (List.rev (List.combine l1 l2)) :: (0, 0) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(26,17)-(26,19)
(26,21)-(26,23)
(27,17)-(27,45)
(27,17)-(27,56)
(27,52)-(27,53)
(27,52)-(27,56)
*)

(* type error slice
(14,5)-(28,52)
(14,11)-(25,57)
(14,13)-(25,57)
(15,7)-(25,57)
(15,13)-(15,14)
(17,12)-(25,57)
(17,18)-(17,19)
(19,17)-(25,57)
(21,25)-(21,27)
(21,25)-(21,32)
(21,25)-(21,38)
(21,25)-(21,48)
(21,25)-(22,28)
(21,30)-(21,32)
(21,43)-(21,48)
(21,54)-(21,69)
(21,54)-(22,28)
(22,23)-(22,28)
(26,5)-(28,52)
(26,17)-(26,19)
(26,17)-(26,23)
(26,21)-(26,23)
(27,5)-(28,52)
(27,17)-(27,25)
(27,17)-(27,45)
(27,17)-(27,56)
(27,27)-(27,39)
(27,27)-(27,45)
(27,40)-(27,42)
(27,43)-(27,45)
(27,52)-(27,53)
(27,52)-(27,56)
(27,55)-(27,56)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
(28,36)-(28,40)
(28,41)-(28,45)
*)
