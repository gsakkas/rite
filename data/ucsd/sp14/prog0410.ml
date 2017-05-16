
let rec clone x n =
  let aux acc n = if n <= 0 then acc else clone (List.append x acc) (n - 1) in
  aux [] n;;

let _ = clone 3 5;;
