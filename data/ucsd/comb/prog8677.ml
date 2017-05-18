
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
      let (a,b) = x in
      match a with
      | (n,listSum) ->
          (match listSum with
           | [] ->
               if ((n + a) + b) < 10
               then (0, [n; (n + a) + b])
               else ((n + 1), [n + 1; ((n + a) + b) mod 10])
           | h::t ->
               if ((n + a) + b) < 10
               then (0, ([0; (a + b) + h] @ t))
               else
                 [((n + 1), (((h + i) + j) / 10));
                 (((h + a) + b) mod 10)
                 ::
                 t]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
