
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
                 ((n + 1), ((((h + c) + d) / 10) :: (((h + c) + d) mod 10) ::
                   t))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
