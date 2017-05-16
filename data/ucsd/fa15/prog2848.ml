
let rec removeZero l =
  let f a x = if (List.length a) = 0 then (if x = 0 then [] else [x]) else x in
  List.fold_left f base l;;
