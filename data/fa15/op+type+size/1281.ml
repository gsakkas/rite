
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = ([], []) in
    let args = (l1, l2) in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,15)-(28,23)
(28,20)-(28,22)
(29,4)-(29,74)
(29,15)-(29,23)
(29,16)-(29,18)
(29,20)-(29,22)
(29,27)-(29,74)
(29,71)-(29,74)
(30,14)-(30,17)
*)

(* type error slice
(12,16)-(12,35)
(12,16)-(12,52)
(12,17)-(12,26)
(12,36)-(12,37)
(27,4)-(29,74)
(27,10)-(27,32)
(27,12)-(27,32)
(27,16)-(27,25)
(27,16)-(27,32)
(28,4)-(29,74)
(28,15)-(28,23)
(29,41)-(29,55)
(29,41)-(29,67)
(29,56)-(29,57)
(29,58)-(29,62)
*)

(* all spans
(2,14)-(2,65)
(2,16)-(2,65)
(2,20)-(2,65)
(2,23)-(2,28)
(2,23)-(2,24)
(2,27)-(2,28)
(2,34)-(2,57)
(2,38)-(2,39)
(2,34)-(2,37)
(2,35)-(2,36)
(2,40)-(2,57)
(2,41)-(2,46)
(2,47)-(2,48)
(2,49)-(2,56)
(2,50)-(2,51)
(2,54)-(2,55)
(2,63)-(2,65)
(4,19)-(13,47)
(5,2)-(13,47)
(5,8)-(5,18)
(5,8)-(5,16)
(5,17)-(5,18)
(6,10)-(6,12)
(8,6)-(13,47)
(8,13)-(8,23)
(8,13)-(8,21)
(8,22)-(8,23)
(9,15)-(9,17)
(11,11)-(13,46)
(11,14)-(11,27)
(11,14)-(11,22)
(11,15)-(11,16)
(11,19)-(11,21)
(11,25)-(11,27)
(12,16)-(12,52)
(12,36)-(12,37)
(12,16)-(12,35)
(12,17)-(12,26)
(12,27)-(12,34)
(12,28)-(12,29)
(12,31)-(12,33)
(12,38)-(12,52)
(12,39)-(12,51)
(12,39)-(12,47)
(12,40)-(12,41)
(12,44)-(12,46)
(12,50)-(12,51)
(13,16)-(13,46)
(13,36)-(13,37)
(13,16)-(13,35)
(13,17)-(13,26)
(13,27)-(13,34)
(13,28)-(13,29)
(13,31)-(13,33)
(13,38)-(13,46)
(13,39)-(13,45)
(13,39)-(13,41)
(13,44)-(13,45)
(15,12)-(20,43)
(15,15)-(20,43)
(16,2)-(20,43)
(16,13)-(16,27)
(16,13)-(16,24)
(16,25)-(16,27)
(17,2)-(20,43)
(17,13)-(17,27)
(17,13)-(17,24)
(17,25)-(17,27)
(18,2)-(20,43)
(18,5)-(18,16)
(18,5)-(18,9)
(18,12)-(18,16)
(19,7)-(19,43)
(19,8)-(19,10)
(19,12)-(19,42)
(19,37)-(19,38)
(19,13)-(19,36)
(19,14)-(19,19)
(19,20)-(19,21)
(19,22)-(19,35)
(19,23)-(19,27)
(19,30)-(19,34)
(19,39)-(19,41)
(20,7)-(20,43)
(20,8)-(20,38)
(20,33)-(20,34)
(20,9)-(20,32)
(20,10)-(20,15)
(20,16)-(20,17)
(20,18)-(20,31)
(20,19)-(20,23)
(20,26)-(20,30)
(20,35)-(20,37)
(20,40)-(20,42)
(22,19)-(23,69)
(23,2)-(23,69)
(23,8)-(23,9)
(23,23)-(23,25)
(23,36)-(23,69)
(23,39)-(23,44)
(23,39)-(23,40)
(23,43)-(23,44)
(23,50)-(23,62)
(23,50)-(23,60)
(23,61)-(23,62)
(23,68)-(23,69)
(25,11)-(30,34)
(25,14)-(30,34)
(26,2)-(30,34)
(26,11)-(29,74)
(27,4)-(29,74)
(27,10)-(27,32)
(27,12)-(27,32)
(27,16)-(27,32)
(27,16)-(27,25)
(27,26)-(27,32)
(27,27)-(27,28)
(27,30)-(27,31)
(28,4)-(29,74)
(28,15)-(28,23)
(28,16)-(28,18)
(28,20)-(28,22)
(29,4)-(29,74)
(29,15)-(29,23)
(29,16)-(29,18)
(29,20)-(29,22)
(29,27)-(29,74)
(29,41)-(29,67)
(29,41)-(29,55)
(29,56)-(29,57)
(29,58)-(29,62)
(29,63)-(29,67)
(29,71)-(29,74)
(30,2)-(30,34)
(30,2)-(30,12)
(30,13)-(30,34)
(30,14)-(30,17)
(30,18)-(30,33)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
*)
