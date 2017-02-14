
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((out,sum),[]) -> (0, sum)
      | ((out,sum),(b,c)::l') ->
          let d = (b + c) + out in
          if d < 10 then (0, (d :: sum)) else (1, ((d - 10) :: sum)) in
    let base = (0, []) in
    let args = List.combine (List.rev (0 :: l1)) (List.rev (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, ([carry] @ [(carry + b) + c]))
                    else
                      ((carry + 1),
                        ([carry + 1] @ [((carry + b) + c) mod 10]))
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,7)-(22,67)
(18,14)-(18,15)
(18,14)-(18,18)
(19,28)-(19,29)
(19,28)-(19,34)
(19,31)-(19,34)
(21,11)-(22,67)
(21,20)-(21,21)
(21,20)-(21,32)
(21,29)-(21,32)
(22,11)-(22,67)
(22,14)-(22,15)
(22,14)-(22,20)
(22,31)-(22,32)
(22,31)-(22,39)
(22,36)-(22,39)
(22,48)-(22,49)
(22,48)-(22,67)
(22,53)-(22,54)
(22,53)-(22,59)
(22,53)-(22,67)
(22,57)-(22,59)
(22,64)-(22,67)
(23,5)-(25,52)
(23,17)-(23,22)
(23,20)-(23,22)
(24,5)-(25,52)
(24,16)-(24,28)
(24,30)-(24,38)
(24,30)-(24,47)
(24,40)-(24,41)
(24,40)-(24,47)
(24,45)-(24,47)
(24,51)-(24,59)
(24,51)-(24,68)
(24,61)-(24,62)
(24,61)-(24,68)
(24,66)-(24,68)
(25,5)-(25,52)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,36)-(25,40)
(25,41)-(25,45)
(25,49)-(25,52)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,28)-(26,30)
(26,31)-(26,33)
*)

(* type error slice
(17,5)-(25,52)
(17,11)-(22,67)
(17,13)-(22,67)
(18,7)-(22,67)
(18,7)-(22,67)
(18,14)-(18,18)
(18,17)-(18,18)
(24,5)-(25,52)
(24,16)-(24,28)
(24,16)-(24,68)
(25,19)-(25,33)
(25,19)-(25,45)
(25,34)-(25,35)
(25,41)-(25,45)
*)
