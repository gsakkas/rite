
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | h::t ->
          (match h with
           | (b,c) ->
               (match x with
                | (first,second) ->
                    ((((first + second) + b) / 10),
                      ((((first + second) + b) mod 10) :: t)))) in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
  else
    if (List.length l1) > (List.length l2)
    then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | h::t -> ((h + b) / 10) :: ((h + b) mod 10) :: t
      | _ -> [b / 10; b mod 10] in
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,6)-(25,63)
(18,12)-(18,13)
(20,10)-(25,63)
(20,17)-(20,18)
(22,15)-(25,62)
(22,22)-(22,23)
(24,20)-(25,61)
(24,21)-(24,50)
(24,23)-(24,39)
(24,24)-(24,29)
(24,32)-(24,38)
(25,25)-(25,41)
(25,26)-(25,31)
(25,34)-(25,40)
(26,4)-(28,51)
(26,15)-(26,17)
(27,4)-(28,51)
(28,4)-(28,51)
(28,48)-(28,51)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)

(* type error slice
(17,4)-(28,51)
(17,10)-(25,63)
(17,12)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,6)-(25,63)
(18,12)-(18,13)
(20,10)-(25,63)
(20,10)-(25,63)
(20,17)-(20,18)
(22,15)-(25,62)
(24,20)-(25,61)
(25,22)-(25,60)
(25,22)-(25,60)
(25,23)-(25,54)
(25,58)-(25,59)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)

(* all spans
(2,14)-(2,64)
(2,16)-(2,64)
(2,20)-(2,64)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,36)
(2,42)-(2,64)
(2,42)-(2,43)
(2,47)-(2,64)
(2,48)-(2,53)
(2,54)-(2,55)
(2,56)-(2,63)
(2,57)-(2,58)
(2,61)-(2,62)
(4,12)-(10,17)
(4,15)-(10,17)
(5,2)-(10,17)
(5,5)-(5,40)
(5,5)-(5,21)
(5,6)-(5,17)
(5,18)-(5,20)
(5,24)-(5,40)
(5,25)-(5,36)
(5,37)-(5,39)
(6,7)-(6,67)
(6,8)-(6,62)
(6,57)-(6,58)
(6,9)-(6,56)
(6,10)-(6,15)
(6,16)-(6,17)
(6,18)-(6,55)
(6,19)-(6,35)
(6,20)-(6,31)
(6,32)-(6,34)
(6,38)-(6,54)
(6,39)-(6,50)
(6,51)-(6,53)
(6,59)-(6,61)
(6,64)-(6,66)
(8,4)-(10,17)
(8,7)-(8,42)
(8,7)-(8,23)
(8,8)-(8,19)
(8,20)-(8,22)
(8,26)-(8,42)
(8,27)-(8,38)
(8,39)-(8,41)
(9,9)-(9,69)
(9,10)-(9,12)
(9,14)-(9,68)
(9,63)-(9,64)
(9,15)-(9,62)
(9,16)-(9,21)
(9,22)-(9,23)
(9,24)-(9,61)
(9,25)-(9,41)
(9,26)-(9,37)
(9,38)-(9,40)
(9,44)-(9,60)
(9,45)-(9,56)
(9,57)-(9,59)
(9,65)-(9,67)
(10,9)-(10,17)
(10,10)-(10,12)
(10,14)-(10,16)
(12,19)-(13,69)
(13,2)-(13,69)
(13,8)-(13,9)
(13,23)-(13,25)
(13,36)-(13,69)
(13,39)-(13,44)
(13,39)-(13,40)
(13,43)-(13,44)
(13,50)-(13,62)
(13,50)-(13,60)
(13,61)-(13,62)
(13,68)-(13,69)
(15,11)-(29,34)
(15,14)-(29,34)
(16,2)-(29,34)
(16,11)-(28,51)
(17,4)-(28,51)
(17,10)-(25,63)
(17,12)-(25,63)
(18,6)-(25,63)
(18,12)-(18,13)
(20,10)-(25,63)
(20,17)-(20,18)
(22,15)-(25,62)
(22,22)-(22,23)
(24,20)-(25,61)
(24,21)-(24,50)
(24,22)-(24,44)
(24,23)-(24,39)
(24,24)-(24,29)
(24,32)-(24,38)
(24,42)-(24,43)
(24,47)-(24,49)
(25,22)-(25,60)
(25,23)-(25,54)
(25,24)-(25,46)
(25,25)-(25,41)
(25,26)-(25,31)
(25,34)-(25,40)
(25,44)-(25,45)
(25,51)-(25,53)
(25,58)-(25,59)
(26,4)-(28,51)
(26,15)-(26,17)
(27,4)-(28,51)
(27,15)-(27,44)
(27,15)-(27,23)
(27,24)-(27,44)
(27,25)-(27,37)
(27,38)-(27,40)
(27,41)-(27,43)
(28,4)-(28,51)
(28,18)-(28,44)
(28,18)-(28,32)
(28,33)-(28,34)
(28,35)-(28,39)
(28,40)-(28,44)
(28,48)-(28,51)
(29,2)-(29,34)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)
