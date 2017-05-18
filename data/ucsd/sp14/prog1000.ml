
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | hd::tl ->
        let seen' = if (List.mem tl hd) = true then seen else hd :: seen in
        let rest' = tl in helper (seen', rest') in
  List.rev (helper ([], l));;
