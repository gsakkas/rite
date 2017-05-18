
let rec clone x n =
  let rec aux acc n =
    if n <= 0 then acc else aux (List.append [x] acc) (n - 1) in
  aux [] n;;

let _ = List.append ((clone 0 3) [1; 2; 3]);;
