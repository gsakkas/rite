
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] ->
          (match x with
           | (x1,x2) when (x1 + x2) <= 9 -> 0 :: (x1 + x2) :: a
           | (x1,x2) when (x1 + x2) > 9 -> 1 :: ((x1 + x2) - 9) :: a)
      | h::t ->
          (match x with
           | (x1,x2) when ((x1 + x2) + h) <= 9 -> 0 :: ((x1 + x2) + h) :: t
           | (x1,x2) when ((x1 + x2) + h) > 9 -> 1 :: (((x1 + x2) + h) - 9)
               :: t) in
    let base = [] in
    let args = List.combine List.rev l1 List.rev l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;
