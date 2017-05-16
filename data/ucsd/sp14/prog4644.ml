
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem (h, seen) then [h] @ seen' in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
