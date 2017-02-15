
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
(18,6)-(22,68)
(18,12)-(18,18)
(18,13)-(18,14)
(19,26)-(19,34)
(19,27)-(19,28)
(19,30)-(19,33)
(21,10)-(22,68)
(21,18)-(21,31)
(21,19)-(21,20)
(21,28)-(21,31)
(22,10)-(22,68)
(22,13)-(22,14)
(22,13)-(22,19)
(22,29)-(22,39)
(22,30)-(22,31)
(22,35)-(22,38)
(22,46)-(22,68)
(22,47)-(22,48)
(22,50)-(22,67)
(22,51)-(22,59)
(22,52)-(22,53)
(22,56)-(22,58)
(22,63)-(22,66)
(23,4)-(25,51)
(23,15)-(23,22)
(23,19)-(23,21)
(24,4)-(25,51)
(24,15)-(24,27)
(24,28)-(24,48)
(24,29)-(24,37)
(24,38)-(24,47)
(24,39)-(24,40)
(24,44)-(24,46)
(24,49)-(24,69)
(24,50)-(24,58)
(24,59)-(24,68)
(24,60)-(24,61)
(24,65)-(24,67)
(25,4)-(25,51)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,12)
(26,2)-(26,34)
(26,13)-(26,34)
(26,14)-(26,17)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)

(* type error slice
(17,4)-(25,51)
(17,10)-(22,68)
(17,12)-(22,68)
(18,6)-(22,68)
(18,6)-(22,68)
(18,12)-(18,18)
(18,16)-(18,17)
(24,4)-(25,51)
(24,15)-(24,27)
(24,15)-(24,69)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,40)-(25,44)
*)
