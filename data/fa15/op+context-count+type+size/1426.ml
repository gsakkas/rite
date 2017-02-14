
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
(4,19)-(13,47)
(5,2)-(13,47)
(5,8)-(5,16)
(5,8)-(5,18)
(5,17)-(5,18)
(6,10)-(6,12)
(8,6)-(13,47)
(8,13)-(8,21)
(8,13)-(8,23)
(8,22)-(8,23)
(9,15)-(9,17)
(11,11)-(13,46)
(11,14)-(11,22)
(11,14)-(11,27)
(11,15)-(11,16)
(11,19)-(11,21)
(11,25)-(11,27)
(12,16)-(12,35)
(12,16)-(12,52)
(12,17)-(12,26)
(12,27)-(12,34)
(12,28)-(12,29)
(12,31)-(12,33)
(12,36)-(12,37)
(12,38)-(12,52)
(12,39)-(12,47)
(12,39)-(12,51)
(12,40)-(12,41)
(12,44)-(12,46)
(12,50)-(12,51)
(13,16)-(13,35)
(13,16)-(13,46)
(13,17)-(13,26)
(13,27)-(13,34)
(13,28)-(13,29)
(13,31)-(13,33)
(13,36)-(13,37)
(13,38)-(13,46)
(13,39)-(13,41)
(13,39)-(13,45)
(13,44)-(13,45)
(16,2)-(20,43)
(17,2)-(20,43)
(22,19)-(23,69)
(26,2)-(30,34)
(27,4)-(29,74)
(27,16)-(27,25)
(27,16)-(27,32)
(27,26)-(27,32)
(27,27)-(27,28)
(28,4)-(29,74)
(28,15)-(28,17)
(29,4)-(29,74)
(29,15)-(29,23)
(29,15)-(29,44)
(29,24)-(29,44)
(29,25)-(29,37)
(29,38)-(29,40)
(29,41)-(29,43)
(29,48)-(29,62)
(29,48)-(29,74)
(29,63)-(29,64)
(29,65)-(29,69)
(29,70)-(29,74)
(30,2)-(30,12)
(30,2)-(30,34)
(30,13)-(30,34)
(30,14)-(30,17)
(30,18)-(30,33)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
*)

(* type error slice
(8,6)-(13,47)
(8,6)-(13,47)
(12,16)-(12,35)
(12,17)-(12,26)
(12,27)-(12,34)
(12,31)-(12,33)
(27,4)-(29,74)
(27,10)-(27,32)
(27,12)-(27,32)
(27,16)-(27,25)
(27,16)-(27,32)
(27,26)-(27,32)
(27,30)-(27,31)
(29,4)-(29,74)
(29,15)-(29,23)
(29,15)-(29,44)
(29,24)-(29,44)
(29,25)-(29,37)
(29,48)-(29,62)
(29,48)-(29,74)
(29,63)-(29,64)
(29,70)-(29,74)
*)
