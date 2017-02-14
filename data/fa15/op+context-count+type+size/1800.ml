
let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (clone 0 ((List.length l1) - (List.length l2))) @ l2
  else (clone 0 ((List.length l2) - (List.length l1))) @ l1;;

let rec removeZero l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = a + x in
    let base = [] in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec rmzhelp l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let rec foldr f b x n = if n > 0 then f x (foldr f b x (n - 1)) else b;;

let rec clone x n = foldr (fun y  -> fun m  -> y :: m) [] x n;;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | x::xs' -> if x = 0 then rmzhelp xs' else x :: xs';;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (c,d) ->
          (match a with
           | (n,listSum) ->
               (match listSum with
                | [] ->
                    if ((n + c) + d) < 10
                    then (0, ([n] @ [(n + c) + d]))
                    else ((n + 1), ([n + 1] @ [((n + c) + d) mod 10]))
                | h::t ->
                    if ((n + c) + d) < 10
                    then (0, ([0] @ ([(c + d) + h] @ t)))
                    else
                      ((n + 1),
                        ([((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(11,7)-(11,59)
(12,7)-(12,59)
(14,19)-(15,77)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(22,51)
(20,15)-(20,17)
(21,4)-(22,51)
(21,15)-(21,23)
(21,15)-(21,43)
(21,24)-(21,43)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,12)
(23,2)-(23,34)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(9,3)-(12,61)
(9,12)-(12,59)
(9,15)-(12,59)
(10,2)-(12,59)
(11,7)-(11,59)
(11,55)-(11,56)
(18,2)-(23,34)
(18,11)-(22,51)
(19,4)-(22,51)
(19,10)-(19,21)
(19,16)-(19,17)
(19,16)-(19,21)
(20,4)-(22,51)
(20,15)-(20,17)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
(23,13)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
*)
