
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
                 ((n + 1), [((h + c) + d) / 10; (((h + c) + d) mod 10) :: t])) in
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
l1
VarG

(11,7)-(11,59)
(l1 , clone 0
            (List.length l1 - List.length l2) @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(12,7)-(12,59)
(clone 0
       (List.length l2 - List.length l1) @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(14,19)-(15,77)
l2
VarG

(20,6)-(32,78)
match x with
| (c , d) -> match a with
             | (n , listSum) -> match listSum with
                                | [] -> if ((n + c) + d) < 10
                                        then (0 , [n] @ [(n + c) + d])
                                        else (n + 1 , [n + 1] @ [((n + c) + d) mod 10])
                                | h :: t -> if ((n + c) + d) < 10
                                            then (0 , [0] @ ([(c + d) + h] @ t))
                                            else (n + 1 , [((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t))
CaseG VarG (fromList [(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])

(26,24)-(26,40)
[n] @ [(n + c) + d]
AppG (fromList [ListG EmptyG Nothing])

(26,25)-(26,26)
(@)
VarG

(26,25)-(26,26)
[n]
ListG VarG Nothing

(26,28)-(26,39)
[(n + c) + d]
ListG (BopG EmptyG EmptyG) Nothing

(27,30)-(27,59)
[n + 1] @ [((n + c) + d) mod 10]
AppG (fromList [ListG EmptyG Nothing])

(27,31)-(27,36)
(@)
VarG

(27,31)-(27,36)
[n + 1]
ListG (BopG EmptyG EmptyG) Nothing

(27,38)-(27,58)
[((n + c) + d) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(30,25)-(30,41)
[0]
ListG LitG Nothing

(30,29)-(30,40)
(@)
VarG

(30,29)-(30,40)
[(c + d) + h] @ t
AppG (fromList [VarG,ListG EmptyG Nothing])

(30,29)-(30,40)
[(c + d) + h]
ListG (BopG EmptyG EmptyG) Nothing

(32,27)-(32,76)
[((h + c) + d) / 10] @ ([((h + c) + d) mod 10] @ t)
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(32,28)-(32,46)
(@)
VarG

(32,28)-(32,46)
[((h + c) + d) / 10]
ListG (BopG EmptyG EmptyG) Nothing

(32,48)-(32,70)
(@)
VarG

(32,48)-(32,70)
[((h + c) + d) mod 10]
ListG (BopG EmptyG EmptyG) Nothing

(32,48)-(32,75)
[((h + c) + d) mod 10] @ t
AppG (fromList [VarG,ListG EmptyG Nothing])

*)
