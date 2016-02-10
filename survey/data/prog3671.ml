let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
       let seen' = if List.mem h seen
                   then [] :: seen
                   else [h] :: seen
       in helper (seen', t)
  in List.rev (helper ([], l))

let _ = removeDuplicates [1;2;1]
