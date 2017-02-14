
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
(11,9)-(11,60)
(12,9)-(12,60)
(14,20)-(15,78)
(20,7)-(35,20)
(26,25)-(26,41)
(26,26)-(26,27)
(26,30)-(26,40)
(27,31)-(27,60)
(27,32)-(27,37)
(27,41)-(27,59)
(30,26)-(30,42)
(30,31)-(30,41)
(32,18)-(35,20)
(32,32)-(32,48)
(33,21)-(33,39)
(33,21)-(35,19)
(36,5)-(38,52)
(37,5)-(38,52)
(38,5)-(38,52)
(38,19)-(38,33)
(38,19)-(38,45)
(38,34)-(38,35)
(38,36)-(38,40)
(38,41)-(38,45)
(38,49)-(38,52)
(39,3)-(39,13)
(39,3)-(39,33)
(39,15)-(39,18)
(39,20)-(39,27)
(39,20)-(39,33)
(39,28)-(39,30)
(39,31)-(39,33)
*)

(* type error slice
(9,4)-(12,62)
(9,13)-(12,60)
(9,16)-(12,60)
(10,3)-(12,60)
(11,9)-(11,60)
(11,56)-(11,57)
(18,3)-(39,33)
(18,12)-(38,52)
(29,16)-(35,20)
(29,16)-(35,20)
(30,22)-(30,46)
(32,18)-(35,20)
(32,18)-(35,20)
(32,18)-(35,20)
(32,21)-(32,48)
(33,21)-(35,19)
(39,15)-(39,18)
(39,15)-(39,33)
(39,20)-(39,27)
(39,20)-(39,33)
*)
