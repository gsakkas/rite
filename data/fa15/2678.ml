
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

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
    let f a x = x @ a in
    let base = [] in
    let args = l1 in let (_,res) = List.fold_left f base args in res in
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
(4,12)-(9,43)
(16,16)-(16,17)
(16,16)-(16,21)
(16,18)-(16,19)
(16,20)-(16,21)
(17,4)-(18,68)
(18,15)-(18,17)
(18,21)-(18,68)
(18,65)-(18,68)
*)

(* type error slice
(16,4)-(18,68)
(16,10)-(16,21)
(16,16)-(16,21)
(16,18)-(16,19)
(16,20)-(16,21)
(18,21)-(18,68)
(18,35)-(18,49)
(18,35)-(18,61)
(18,50)-(18,51)
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
(4,12)-(9,43)
(4,15)-(9,43)
(5,2)-(9,43)
(5,13)-(5,27)
(5,13)-(5,24)
(5,25)-(5,27)
(6,2)-(9,43)
(6,13)-(6,27)
(6,13)-(6,24)
(6,25)-(6,27)
(7,2)-(9,43)
(7,5)-(7,16)
(7,5)-(7,9)
(7,12)-(7,16)
(8,7)-(8,43)
(8,8)-(8,10)
(8,12)-(8,42)
(8,37)-(8,38)
(8,13)-(8,36)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,35)
(8,23)-(8,27)
(8,30)-(8,34)
(8,39)-(8,41)
(9,7)-(9,43)
(9,8)-(9,38)
(9,33)-(9,34)
(9,9)-(9,32)
(9,10)-(9,15)
(9,16)-(9,17)
(9,18)-(9,31)
(9,19)-(9,23)
(9,26)-(9,30)
(9,35)-(9,37)
(9,40)-(9,42)
(11,19)-(12,69)
(12,2)-(12,69)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,69)
(12,39)-(12,44)
(12,39)-(12,40)
(12,43)-(12,44)
(12,50)-(12,62)
(12,50)-(12,60)
(12,61)-(12,62)
(12,68)-(12,69)
(14,11)-(19,34)
(14,14)-(19,34)
(15,2)-(19,34)
(15,11)-(18,68)
(16,4)-(18,68)
(16,10)-(16,21)
(16,12)-(16,21)
(16,16)-(16,21)
(16,18)-(16,19)
(16,16)-(16,17)
(16,20)-(16,21)
(17,4)-(18,68)
(17,15)-(17,17)
(18,4)-(18,68)
(18,15)-(18,17)
(18,21)-(18,68)
(18,35)-(18,61)
(18,35)-(18,49)
(18,50)-(18,51)
(18,52)-(18,56)
(18,57)-(18,61)
(18,65)-(18,68)
(19,2)-(19,34)
(19,2)-(19,12)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
*)
