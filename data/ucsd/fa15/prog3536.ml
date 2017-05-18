
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = if List.mem h t then seen else [seen; h] in
        let rest' = t in helper (seen', rest') in
  helper ([], l);;
