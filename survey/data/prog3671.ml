(* `removeDuplicates xs` returns the list of elements of
   `xs` with the duplicates, i.e. second, third,
   etc. occurrences, removed, and where the remaining
   elements appear in the same order as in `xs` *)

let rec mem x l =
  match l with
  | [] -> false
  | h::t -> if x = h then true else mem x t

let removeDuplicates xs =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
       let seen' = if mem h seen
                   then [] :: seen
                   else [h] :: seen
       in helper (seen', t)
  in List.rev (helper ([], xs))

let _ = removeDuplicates [1;2;1]
