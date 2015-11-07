let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = seen @ h in 
        let rest' = let is_in i = (i mod 2) = 0 in 
                    List.filter is_in t in
        helper (seen', rest') in
  List.rev (helper ([], l))
