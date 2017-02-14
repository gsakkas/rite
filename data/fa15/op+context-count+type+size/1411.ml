
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
(5,2)-(9,43)
(6,2)-(9,43)
(12,8)-(12,9)
(12,23)-(12,25)
(12,36)-(12,69)
(12,39)-(12,40)
(12,39)-(12,44)
(12,43)-(12,44)
(12,50)-(12,60)
(12,50)-(12,62)
(12,61)-(12,62)
(12,68)-(12,69)
(14,14)-(19,34)
(15,2)-(19,34)
(15,11)-(18,68)
(16,4)-(18,68)
(16,10)-(16,21)
(16,12)-(16,21)
(16,16)-(16,17)
(16,16)-(16,21)
(16,18)-(16,19)
(16,20)-(16,21)
(17,4)-(18,68)
(17,15)-(17,17)
(18,4)-(18,68)
(18,15)-(18,17)
(18,21)-(18,68)
(18,35)-(18,49)
(18,35)-(18,61)
(18,50)-(18,51)
(18,52)-(18,56)
(18,57)-(18,61)
(18,65)-(18,68)
(19,2)-(19,12)
(19,2)-(19,34)
(19,13)-(19,34)
(19,14)-(19,17)
(19,18)-(19,33)
(19,19)-(19,26)
(19,27)-(19,29)
(19,30)-(19,32)
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
