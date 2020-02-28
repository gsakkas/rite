
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, (carry :: ((carry + b) + c)))
                    else
                      ((carry + 1), ((carry + 1) ::
                        (((carry + b) + c) mod 10)))
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        (((((h + b) + c) / 10) :: (((h + b) + c) mod 10)) @ t)))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if not (h = 0) then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (b,c) ->
          (match a with
           | (carry,sum) ->
               (match sum with
                | [] ->
                    if ((carry + b) + c) < 10
                    then (0, [carry; (carry + b) + c])
                    else ((carry + 1), [carry + 1; ((carry + b) + c) mod 10])
                | h::t ->
                    if ((b + c) + h) < 10
                    then (0, ([0] @ ([(b + c) + h] @ t)))
                    else
                      ((carry + 1),
                        ([((h + b) + c) / 10] @ ([((h + b) + c) mod 10] @ t))))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,30)-(25,58)
[carry ; (carry + b) + c]
ListG [VarG,BopG EmptyG EmptyG]

(27,37)-(28,52)
[carry + 1 ; ((carry + b) + c) mod 10]
ListG [BopG EmptyG EmptyG,BopG EmptyG EmptyG]

(34,26)-(34,74)
[((h + b) + c) / 10]
ListG [BopG EmptyG EmptyG]

(34,77)-(34,78)
[((h + b) + c) mod 10] @ t
AppG [ListG [EmptyG],VarG]

*)

(* type error slice
(25,30)-(25,58)
(25,40)-(25,57)
(27,37)-(28,52)
(28,25)-(28,51)
(34,26)-(34,74)
(34,51)-(34,73)
*)
