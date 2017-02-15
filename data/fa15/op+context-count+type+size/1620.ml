
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
    let f a x =
      let (c,d) = x in
      match a with
      | (n,listSum) ->
          (match listSum with
           | [] ->
               if ((n + c) + d) < 10
               then (0, [n; (n + c) + d])
               else ((n + 1), [n + 1; ((n + c) + d) mod 10])
           | h::t ->
               if ((n + c) + d) < 10
               then (0, ([0; (c + d) + h] @ t))
               else
                 [((n + 1), (((h + c) + d) / 10));
                 (((h + c) + d) mod 10)
                 ::
                 t]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
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
(20,6)-(35,20)
(26,24)-(26,40)
(26,25)-(26,26)
(26,28)-(26,39)
(27,30)-(27,59)
(27,31)-(27,36)
(27,38)-(27,58)
(30,25)-(30,41)
(30,29)-(30,40)
(32,17)-(35,19)
(32,28)-(32,48)
(33,17)-(33,39)
(33,17)-(35,18)
(36,4)-(38,51)
(37,4)-(38,51)
(38,4)-(38,51)
(38,18)-(38,32)
(38,18)-(38,44)
(38,33)-(38,34)
(38,35)-(38,39)
(38,40)-(38,44)
(38,48)-(38,51)
(39,2)-(39,12)
(39,2)-(39,34)
(39,14)-(39,17)
(39,18)-(39,33)
(39,19)-(39,26)
(39,27)-(39,29)
(39,30)-(39,32)
*)

(* type error slice
(9,3)-(12,61)
(9,12)-(12,59)
(9,15)-(12,59)
(10,2)-(12,59)
(11,7)-(11,59)
(11,55)-(11,56)
(18,2)-(39,34)
(18,11)-(38,51)
(29,15)-(35,19)
(29,15)-(35,19)
(30,20)-(30,47)
(32,17)-(35,19)
(32,17)-(35,19)
(32,17)-(35,19)
(32,18)-(32,49)
(33,17)-(35,18)
(39,13)-(39,34)
(39,14)-(39,17)
(39,18)-(39,33)
(39,19)-(39,26)
*)
