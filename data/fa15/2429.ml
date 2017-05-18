
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
    let args = List.rev (List.combine l1 l2) in
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
(19,30)-(19,33)
(21,10)-(22,68)
(21,18)-(21,31)
(21,19)-(21,20)
(21,28)-(21,31)
(22,10)-(22,68)
(22,13)-(22,14)
(22,17)-(22,19)
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
(24,15)-(24,23)
(24,15)-(24,44)
(24,24)-(24,44)
(24,25)-(24,37)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,40)-(25,44)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,29)
(2,23)-(2,24)
(2,28)-(2,29)
(2,35)-(2,37)
(2,43)-(2,65)
(2,43)-(2,44)
(2,48)-(2,65)
(2,49)-(2,54)
(2,55)-(2,56)
(2,57)-(2,64)
(2,58)-(2,59)
(2,62)-(2,63)
(4,12)-(10,69)
(4,15)-(10,69)
(5,2)-(10,69)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,15)
(6,8)-(6,10)
(6,12)-(6,14)
(8,4)-(10,69)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,64)
(9,59)-(9,60)
(9,11)-(9,58)
(9,12)-(9,17)
(9,18)-(9,19)
(9,20)-(9,57)
(9,21)-(9,37)
(9,22)-(9,33)
(9,34)-(9,36)
(9,40)-(9,56)
(9,41)-(9,52)
(9,53)-(9,55)
(9,61)-(9,63)
(9,66)-(9,68)
(10,9)-(10,69)
(10,10)-(10,12)
(10,14)-(10,68)
(10,63)-(10,64)
(10,15)-(10,62)
(10,16)-(10,21)
(10,22)-(10,23)
(10,24)-(10,61)
(10,25)-(10,41)
(10,26)-(10,37)
(10,38)-(10,40)
(10,44)-(10,60)
(10,45)-(10,56)
(10,57)-(10,59)
(10,65)-(10,67)
(12,19)-(13,75)
(13,2)-(13,75)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,75)
(13,39)-(13,50)
(13,39)-(13,42)
(13,43)-(13,50)
(13,44)-(13,45)
(13,48)-(13,49)
(13,56)-(13,57)
(13,63)-(13,75)
(13,63)-(13,73)
(13,74)-(13,75)
(15,11)-(26,34)
(15,14)-(26,34)
(16,2)-(26,34)
(16,11)-(25,51)
(17,4)-(25,51)
(17,10)-(22,68)
(17,12)-(22,68)
(18,6)-(22,68)
(18,12)-(18,18)
(18,13)-(18,14)
(18,16)-(18,17)
(19,26)-(19,34)
(19,27)-(19,28)
(19,30)-(19,33)
(21,10)-(22,68)
(21,18)-(21,31)
(21,18)-(21,25)
(21,19)-(21,20)
(21,23)-(21,24)
(21,28)-(21,31)
(22,10)-(22,68)
(22,13)-(22,19)
(22,13)-(22,14)
(22,17)-(22,19)
(22,25)-(22,40)
(22,26)-(22,27)
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
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,51)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,51)
(25,18)-(25,44)
(25,18)-(25,32)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(25,48)-(25,51)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)
