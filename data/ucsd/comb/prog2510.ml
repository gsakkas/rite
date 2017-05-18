
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = failwith "to be written" in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l));;

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = failwith "to be written" in
        let rest' = failwith "to be written" in helper (seen', rest') in
  List.rev (helper ([], l)) removeDuplicates [1; 6; 2; 4; 12; 2; 13; 6; 9];;
