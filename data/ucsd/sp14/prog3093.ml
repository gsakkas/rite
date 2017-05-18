
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  if diff >= 0
  then (l1, ((clone 0 diff) @ l2))
  else (((clone 0 (abs diff)) @ l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> h :: t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (arg1,arg2) = x in
      match a with
      | (0,_) ->
          if (arg1 + arg2) > 9
          then (1, [(arg1 + arg2) mod 10])
          else (0, [arg1 + arg2])
      | (_,_) ->
          if ((arg1 + arg2) + 1) > 9
          then (1, ([((arg1 + arg2) + 1) mod 10] @ a))
          else (0, (((arg1 + arg2) + 1) :: a)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
