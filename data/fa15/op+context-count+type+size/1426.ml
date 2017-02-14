
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
    let base = [] in
    let args = List.rev (List.combine l1 l2) in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let carry y = y / 10;;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let remain x = x mod 10;;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (x1,x2) ->
          (match a with
           | (car,cur) ->
               (match cur with
                | [] ->
                    if ((car + x1) + x2) > 10
                    then
                      ((car + 1), ([car + 1] @ [((remain car) + x1) + x2]))
                    else (0, ([car] @ [(car + x1) + x2]))
                | h::t ->
                    if ((x1 + x2) + h) < 10
                    then (0, ([0] @ ([(x1 + x2) + h] @ t)))
                    else
                      ((car + 1),
                        ([((carry h) + x1) + x2] @
                           ([((remain h) + x1) + x2] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,20)-(13,47)
(5,3)-(13,47)
(5,9)-(5,17)
(5,9)-(5,19)
(5,18)-(5,19)
(6,11)-(6,13)
(8,8)-(13,47)
(8,14)-(8,22)
(8,14)-(8,24)
(8,23)-(8,24)
(9,16)-(9,18)
(11,12)-(13,47)
(11,16)-(11,17)
(11,16)-(11,22)
(11,16)-(11,28)
(11,20)-(11,22)
(11,26)-(11,28)
(12,18)-(12,27)
(12,18)-(12,34)
(12,18)-(12,53)
(12,29)-(12,30)
(12,29)-(12,34)
(12,32)-(12,34)
(12,37)-(12,38)
(12,39)-(12,53)
(12,41)-(12,42)
(12,41)-(12,47)
(12,41)-(12,52)
(12,45)-(12,47)
(12,51)-(12,52)
(13,18)-(13,27)
(13,18)-(13,34)
(13,18)-(13,47)
(13,29)-(13,30)
(13,29)-(13,34)
(13,32)-(13,34)
(13,37)-(13,38)
(13,39)-(13,47)
(13,40)-(13,42)
(13,40)-(13,46)
(13,45)-(13,46)
(16,3)-(20,43)
(17,3)-(20,43)
(22,20)-(23,70)
(26,3)-(30,33)
(27,5)-(29,75)
(27,17)-(27,26)
(27,17)-(27,32)
(27,28)-(27,29)
(27,28)-(27,32)
(28,5)-(29,75)
(28,16)-(28,18)
(29,5)-(29,75)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(29,39)-(29,41)
(29,42)-(29,44)
(29,49)-(29,63)
(29,49)-(29,75)
(29,64)-(29,65)
(29,66)-(29,70)
(29,71)-(29,75)
(30,3)-(30,13)
(30,3)-(30,33)
(30,15)-(30,18)
(30,15)-(30,33)
(30,20)-(30,27)
(30,20)-(30,33)
(30,28)-(30,30)
(30,31)-(30,33)
*)

(* type error slice
(8,8)-(13,47)
(8,8)-(13,47)
(12,18)-(12,27)
(12,18)-(12,34)
(12,29)-(12,34)
(12,32)-(12,34)
(27,5)-(29,75)
(27,11)-(27,32)
(27,13)-(27,32)
(27,17)-(27,26)
(27,17)-(27,32)
(27,28)-(27,32)
(27,31)-(27,32)
(29,5)-(29,75)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(29,49)-(29,63)
(29,49)-(29,75)
(29,64)-(29,65)
(29,71)-(29,75)
*)
