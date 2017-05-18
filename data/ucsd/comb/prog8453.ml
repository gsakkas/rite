
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' =
          match List.mem (h, seen) with | true  -> [] | false  -> [h] in
        let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;
